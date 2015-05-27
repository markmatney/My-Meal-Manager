package cs130.project.mmm;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.CheckBox;
import android.widget.ImageButton;
import android.widget.TextView;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.NetworkImageView;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

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
        final RecipeRow recipeItem = getItem(position);

        if (row == null) {
            LayoutInflater inflater = ((Activity) mContext).getLayoutInflater();
            row = inflater.inflate(mResourceId, parent, false);

            holder = new RecipeRowHolder();
            holder.image = (NetworkImageView) row.findViewById(R.id.list_item_image);
            holder.title = (TextView) row.findViewById(R.id.list_item_name);
            row.setTag(holder);
        } else {
            holder = (RecipeRowHolder) row.getTag();
        }
        holder.title.setText(recipeItem.getRecipeName());
        holder.image.setImageUrl(recipeItem.getImageURL(), APIHelper.getInstance(mContext).getImageLoader());

        row.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                SharedPreferences sharedPref = mContext.getSharedPreferences(mContext.getResources().getString(R.string.app_name), Context.MODE_PRIVATE);
                int storedId = sharedPref.getInt("id", -2);
                String url = mContext.getResources().getString(R.string.api) + "get_user_recipes.php?id=" + storedId;

                CustomRequest jsObjRequest = new CustomRequest(Request.Method.POST, url, null, new Response.Listener<JSONObject>() {

                    @Override
                    public void onResponse(JSONObject response) {
                        try {
                            JSONArray recipes = response.getJSONArray("recipes");
                            for (int i = 0 ;i < recipes.length(); i++) {
                                if (recipes.getString(i).equals(recipeItem.getRecipeName())) {
                                    Intent toRecipePageIntent = new Intent(mContext, RecipePage.class);
                                    toRecipePageIntent.putExtra("recipe", recipeItem);
                                    toRecipePageIntent.putExtra("bookmarked", true);
                                    mContext.startActivity(toRecipePageIntent);
                                    return;
                                }
                            }
                            Intent toRecipePageIntent = new Intent(mContext, RecipePage.class);
                            toRecipePageIntent.putExtra("recipe", recipeItem);
                            mContext.startActivity(toRecipePageIntent);
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }

                    }
                }, new Response.ErrorListener() {

                    @Override
                    public void onErrorResponse(VolleyError response) {
                        Log.d("Response: ", response.toString());
                    }
                });
                APIHelper.getInstance(mContext).addToRequestQueue(jsObjRequest);



            }
        });

        return row;
    }

    private static class RecipeRowHolder {
        NetworkImageView image;
        TextView title;
    }
}
