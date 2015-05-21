package cs130.project.mmm;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.io.InputStream;
import java.util.List;

/**
 * Created by mmdango on 5/18/15.
 */
public class ExploreResultsAdapter extends ArrayAdapter<RecipeRow> {

    Context mContext;
    int mResourceId;

    public ExploreResultsAdapter(Context context, int layoutResourceId, List<RecipeRow> data) {
        super(context, layoutResourceId, data);
        this.mResourceId = layoutResourceId;
        this.mContext = context;
    }

    @Override
    public void remove(RecipeRow object) {
        super.remove(object);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View row = convertView;
        RecipeRowHolder holder = null;
        RecipeRow recipeItem = getItem(position);

        if (row == null) {
            LayoutInflater inflater = ((Activity) mContext).getLayoutInflater();
            row = inflater.inflate(mResourceId, parent, false);

            holder = new RecipeRowHolder();
            holder.image = (ImageView) row.findViewById(R.id.list_item_image);
            holder.title = (TextView) row.findViewById(R.id.list_item_name);
            new GetImageFromURL(holder.image).execute(recipeItem.getImageURL());

            row.setTag(holder);
        } else {
            holder = (RecipeRowHolder) row.getTag();
        }
        holder.title.setText(getItem(position).getRecipeName());
        return row;
    }

    private static class RecipeRowHolder {
        ImageView image;
        TextView title;
    }

    private class GetImageFromURL extends AsyncTask<String, Void, Bitmap> {

        private ImageView mImageView;
        public GetImageFromURL(ImageView view) {
            mImageView = view;
        }

        @Override
        protected Bitmap doInBackground(String... params) {
            String urldisplay = params[0];
            Bitmap mIcon11 = null;
            try {
                InputStream in = new java.net.URL(urldisplay).openStream();
                mIcon11 = BitmapFactory.decodeStream(in);
            } catch (Exception e) {
                Log.e("Error", e.getMessage());
                e.printStackTrace();
            }
            return mIcon11;        }

        @Override
        protected void onPostExecute(Bitmap bitmap) {
            mImageView.setImageBitmap(bitmap);
            notifyDataSetChanged();
        }
    }
}
