package cs130.project.mmm;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.*;

import java.util.List;

public class IngredientsListAdapter extends ArrayAdapter<IngredientRow> {

    Context mContext;
    int mResourceId;

    public IngredientsListAdapter(Context context, int layoutResourceId, List<IngredientRow> data) {
        super(context, layoutResourceId, data);
        this.mResourceId = layoutResourceId;
        this.mContext = context;
    }

    @Override
    public void remove(IngredientRow object) {
        super.remove(object);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View row = convertView;
        ItemRowHolder holder = null;
        final IngredientRow item = getItem(position);

        if (row == null) {
            LayoutInflater inflater = ((Activity) mContext).getLayoutInflater();
            row = inflater.inflate(mResourceId, parent, false);

            holder = new ItemRowHolder();
            holder.nameBox = (TextView) row.findViewById(R.id.name_text);
            holder.quantityBox = (EditText) row.findViewById(R.id.quantity_text);
            holder.unitBox = (TextView) row.findViewById(R.id.unit_text);
            holder.checkBox = (CheckBox) row.findViewById(R.id.have_ingredient_checkbox);
            holder.checkBox.setChecked(false);
            holder.checkBox.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                @Override
                public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                    item.setChecked(isChecked);
                }
            });
            holder.warningBox = (TextView) row.findViewById(R.id.warning_textview);
            row.setTag(holder);
        } else {
            holder = (ItemRowHolder) row.getTag();
        }

        holder.nameBox.setText(item.getName());
        holder.quantityBox.setText(Double.toString(item.getQuantity()));
        holder.unitBox.setText(item.getUnit());
        int have = SQLiteDatabaseHelper.getInstance(mContext).haveInInventory(item.getName(),
                item.getQuantity(), item.getUnit());

        switch (have) {
            case 0:
                holder.checkBox.setChecked(true);
                holder.warningBox.setVisibility(View.INVISIBLE);
                item.setChecked(true);
                holder.nameBox.setBackgroundColor(0xFF009900);
                break;
            case 1:
                holder.warningBox.setText("Not enough quantity");
                holder.warningBox.setVisibility(View.VISIBLE);
                holder.nameBox.setBackgroundColor(0xFF009900);
                if (item.isChecked()) {
                    holder.checkBox.setChecked(true);
                } else {
                    holder.checkBox.setChecked(false);
                }
                break;
            case 2:
                holder.warningBox.setText("Cannot convert units");
                holder.warningBox.setVisibility(View.VISIBLE);
                holder.nameBox.setBackgroundColor(0xFF009900);
                holder.checkBox.setChecked(false);
                item.setChecked(false);
                break;
            case -1:
                holder.nameBox.setBackgroundColor(0xFF990000);
                holder.warningBox.setVisibility(View.INVISIBLE);
                holder.checkBox.setChecked(false);
                item.setChecked(false);


        }
        return row;
    }

    private static class ItemRowHolder {
        TextView nameBox;
        EditText quantityBox;
        TextView unitBox;
        TextView warningBox;
        CheckBox checkBox;
    }
}
