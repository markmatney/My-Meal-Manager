package cs130.project.mmm;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.TextView;

import java.util.List;

public class GroceryListAdapter extends ArrayAdapter<ItemRow> {

    Context mContext;
    int mResourceId;

    public GroceryListAdapter(Context context, int layoutResourceId, List<ItemRow> data) {
        super(context, layoutResourceId, data);
        this.mResourceId = layoutResourceId;
        this.mContext = context;
    }

    @Override
    public void remove(ItemRow object) {
        super.remove(object);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View row = convertView;
        ItemRowHolder holder = null;

        if (row == null) {
            LayoutInflater inflater = ((Activity) mContext).getLayoutInflater();
            row = inflater.inflate(mResourceId, parent, false);

            holder = new ItemRowHolder();
            holder.checkBox = (CheckBox) row.findViewById(R.id.item_checkbox);
            holder.quantityBox = (EditText) row.findViewById(R.id.quantity_text);

            holder.unitBox = (TextView) row.findViewById(R.id.unit_text);
            row.setTag(holder);
        } else {
            holder = (ItemRowHolder) row.getTag();
        }

        final ItemRow item = getItem(position);
        holder.checkBox.setText(item.getName());
        holder.quantityBox.setText(Double.toString(item.getQuantity()));
        holder.unitBox.setText(item.getUnit());


        holder.quantityBox.setOnFocusChangeListener(new View.OnFocusChangeListener() {
            @Override
            public void onFocusChange(View v, boolean hasFocus) {
                if (!hasFocus) {
                    SQLiteDatabaseHelper.getInstance(mContext).updateGroceryRow(item.getName(), item.getQuantity());
                }
            }
        });
        return row;
    }

    private static class ItemRowHolder {
        CheckBox checkBox;
        EditText quantityBox;
        TextView unitBox;
    }
}
