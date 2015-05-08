package cs130.project.mmm;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.TextView;

import java.util.List;

public class InventoryListAdapter extends ArrayAdapter<ItemRow> {

    Context mContext;
    int mResourceId;

    public InventoryListAdapter(Context context, int layoutResourceId, List<ItemRow> data) {
        super(context, layoutResourceId, data);
        this.mResourceId = layoutResourceId;
        this.mContext = context;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View row = convertView;
        ItemRowHolder holder = null;

        if (row == null) {
            LayoutInflater inflater = ((Activity) mContext).getLayoutInflater();
            row = inflater.inflate(mResourceId, parent, false);

            holder = new ItemRowHolder();
            holder.nameBox = (TextView) row.findViewById(R.id.name_text);
            holder.quantityBox = (EditText) row.findViewById(R.id.quantity_text);
            holder.unitBox = (TextView) row.findViewById(R.id.unit_text);
            row.setTag(holder);
        } else {
            holder = (ItemRowHolder) row.getTag();
        }

        ItemRow item = getItem(position);
        holder.nameBox.setText(item.getName());
        holder.quantityBox.setText(Double.toString(item.getQuantity()));
        holder.unitBox.setText(item.getUnit());

        return row;
    }

    private static class ItemRowHolder {
        TextView nameBox;
        EditText quantityBox;
        TextView unitBox;
    }
}
