package cs130.project.mmm;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.*;

public class GroceryList extends Activity {
    /**
     * Called when the activity is first created.
     */

    GroceryListAdapter mGroceryListAdapter;
    private SQLiteDatabaseHelper mItemsDBHelper;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.checkbox_listview);
        mItemsDBHelper = SQLiteDatabaseHelper.getInstance(this);
/*
        mItemsDBHelper.addInventoryRow("Carrots", null, 8, "sticks");
        mItemsDBHelper.addInventoryRow("Milk", null, 3, "gallons");
        mItemsDBHelper.addInventoryRow("Potatoes", "Golden yukon", 2.5, "pounds");
        mItemsDBHelper.addInventoryRow("Broccoli", "just florets", 12, "ounces");

        mItemsDBHelper.addGroceryRow("Chicken Breast", null, 7.5, "ounces");
        mItemsDBHelper.addGroceryRow("Spaghetti Noodles", null, 1, "boxes");
        mItemsDBHelper.addGroceryRow("Marinara", null, 10, "fl oz");
        mItemsDBHelper.addGroceryRow("Apples", "red", 4, "apples");
*/
        setUpGroceryList();

        Button toInventory = (Button) findViewById(R.id.navigate_button);
        toInventory.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(GroceryList.this, InventoryList.class);
                startActivity(intent);
            }
        });

    }

    private void setUpGroceryList() {
        ListView groceryList = (ListView)findViewById(R.id.items_list);

        View header = getLayoutInflater().inflate(R.layout.checkbox_listview_header, null);
        groceryList.addHeaderView(header);
        View footer = getLayoutInflater().inflate(R.layout.checkbox_listview_footer, null);
        groceryList.addFooterView(footer);
        Button addItemButton = (Button) findViewById(R.id.add_item_button);
        addItemButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                EditText nameText = (EditText) findViewById(R.id.add_item_name);
                EditText quantityText = (EditText) findViewById(R.id.add_item_quantity);
                EditText unitText = (EditText) findViewById(R.id.add_item_units);
                if(nameText.getText().equals("") || quantityText.getText().equals("") || unitText.getText().equals("")) {
                    return;
                }

                ItemRow newRow = new ItemRow(nameText.getText().toString(),
                        Double.parseDouble(quantityText.getText().toString()),
                        unitText.getText().toString());
                mGroceryListAdapter.add(newRow);
                mItemsDBHelper.addGroceryRow(newRow);
                mGroceryListAdapter.notifyDataSetChanged();
                nameText.setText("");
                quantityText.setText("");
                unitText.setText("");
            }
        });

        mGroceryListAdapter = new GroceryListAdapter(this, R.layout.checkbox_listview_item,
                mItemsDBHelper.getGroceryList());
        groceryList.setAdapter(mGroceryListAdapter);

    }



    public void onCheckboxClicked(View view) {
        final CheckBox checkBox = (CheckBox) view;
        boolean checked = checkBox.isChecked();
        if (checked) {
            new AlertDialog.Builder(this)
                    .setTitle("Move to Inventory")
                    .setPositiveButton(android.R.string.yes, new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int which) {
                            mItemsDBHelper.moveToInventory(checkBox.getText().toString());
                            for(int i = 0; i < mGroceryListAdapter.getCount(); i++) {
                                ItemRow row = mGroceryListAdapter.getItem(i);
                                if (row.getName().equals(checkBox.getText())) {
                                    checkBox.setChecked(false);
                                    mGroceryListAdapter.remove(row);
                                    mGroceryListAdapter.notifyDataSetChanged();
                                    break;
                                }
                            }
                        }
                    })
                    .setNegativeButton(android.R.string.no, new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int which) {
                            checkBox.setChecked(false);
                        }
                    })
                    .show();
        }
    }

}
