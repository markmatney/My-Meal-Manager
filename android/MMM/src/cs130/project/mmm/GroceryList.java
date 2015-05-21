package cs130.project.mmm;


import android.app.AlertDialog;
import android.app.ListFragment;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.*;
import android.widget.*;
import com.wdullaer.swipeactionadapter.SwipeActionAdapter;
import com.wdullaer.swipeactionadapter.SwipeDirections;

public class GroceryList extends ListFragment implements SwipeActionAdapter.SwipeActionListener  {
    /**
     * 10.0.3.2 IP for Genymotion
     * Called when the activity is first created.
     */

    GroceryListAdapter mRegularListAdapter;
    SwipeActionAdapter mGroceryListAdapter;
    private SQLiteDatabaseHelper mItemsDBHelper;
    private boolean isEditing = false;


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mItemsDBHelper = SQLiteDatabaseHelper.getInstance(getActivity());
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


    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        setHasOptionsMenu(true);
        return inflater.inflate(R.layout.grocery_list_listview, container, false);

    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.edit_mode:
                if (!isEditing) {
                    toRegularAdapter();
                } else {
                    toSwipeAdapter();
                }
                isEditing = !isEditing;
                return true;
        }
        return false;
    }

    private void toRegularAdapter() {
        setListAdapter(mRegularListAdapter);
        mGroceryListAdapter.setSwipeActionListener(null);
    }

    private void toSwipeAdapter() {
        setListAdapter(mGroceryListAdapter);
        mGroceryListAdapter.setSwipeActionListener(this);
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        setUpGroceryList(view);
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.inventory_action_bar, menu);
        super.onCreateOptionsMenu(menu, inflater);
    }

    private void setUpGroceryList(final View view) {

        View header = getActivity().getLayoutInflater().inflate(R.layout.listview_header, null);
        getListView().addHeaderView(header);
        View footer = getActivity().getLayoutInflater().inflate(R.layout.listview_footer, null);
        getListView().addFooterView(footer);
        ImageButton addItemButton = (ImageButton) view.findViewById(R.id.add_item_button);
        addItemButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                EditText nameText = (EditText) view.findViewById(R.id.add_item_name);
                EditText quantityText = (EditText) view.findViewById(R.id.add_item_quantity);
                EditText unitText = (EditText) view.findViewById(R.id.add_item_units);
                if (nameText.getText().toString().equals("")
                        || quantityText.getText().toString().equals("")
                        || unitText.getText().toString().equals("")) {
                    Toast.makeText(getActivity(), "All fields required.", Toast.LENGTH_SHORT).show();
                    return;
                }

                ItemRow newRow = new ItemRow(nameText.getText().toString(),
                        Double.parseDouble(quantityText.getText().toString()),
                        unitText.getText().toString());
                mRegularListAdapter.add(newRow);
                mItemsDBHelper.addGroceryRow(newRow);
                mRegularListAdapter.notifyDataSetChanged();
                nameText.setText("");
                quantityText.setText("");
                unitText.setText("");
            }
        });

        mRegularListAdapter = new GroceryListAdapter(getActivity(), R.layout.grocery_list_listview_item,
                mItemsDBHelper.getGroceryList());

        mGroceryListAdapter = new SwipeActionAdapter(mRegularListAdapter);
        mGroceryListAdapter.setSwipeActionListener(this)
                .setDimBackgrounds(true)
                .setListView(getListView());

        setListAdapter(mGroceryListAdapter);


        mGroceryListAdapter.addBackground(SwipeDirections.DIRECTION_FAR_LEFT,R.layout.swipe_delete_left)
                .addBackground(SwipeDirections.DIRECTION_NORMAL_LEFT,R.layout.swipe_delete_left)
                .addBackground(SwipeDirections.DIRECTION_FAR_RIGHT,R.layout.swipe_to_inventory)
                .addBackground(SwipeDirections.DIRECTION_NORMAL_RIGHT, R.layout.swipe_to_inventory);

        mGroceryListAdapter.notifyDataSetChanged();

    }

    @Override
    public boolean hasActions(int position){
        if (position == getListView().getChildCount()-1)
            return false;
        return true;
    }

    @Override
    public boolean shouldDismiss(int position, int direction){
        return direction == SwipeDirections.DIRECTION_FAR_LEFT || direction == SwipeDirections.DIRECTION_NORMAL_LEFT;
    }


    @Override
    public void onSwipe(int[] positionList, int[] directionList) {
        for(int i=0;i<positionList.length;i++) {
            int direction = directionList[i];
            int position = positionList[i];
            String dir = "";
            final ItemRow item;
            switch (direction) {
                case SwipeDirections.DIRECTION_FAR_RIGHT:
                case SwipeDirections.DIRECTION_NORMAL_RIGHT:
                    item = mRegularListAdapter.getItem(position-1);
                    new AlertDialog.Builder(getActivity())
                            .setTitle("Add to Inventory")
                            .setPositiveButton(android.R.string.yes, new DialogInterface.OnClickListener() {
                                public void onClick(DialogInterface dialog, int which) {
                                    mItemsDBHelper.moveToInventory(item.getName().toString());
                                    for (int i = 0; i < getListView().getCount(); i++) {
                                        ItemRow row = mRegularListAdapter.getItem(i);
                                        if (row.getName().equals(item.getName())) {
                                            mRegularListAdapter.remove(row);
                                            mRegularListAdapter.notifyDataSetChanged();
                                            break;
                                        }
                                    }
                                }
                            })
                            .show();
                    break;

                case SwipeDirections.DIRECTION_FAR_LEFT:
                case SwipeDirections.DIRECTION_NORMAL_LEFT:
                    item = mRegularListAdapter.getItem(position-1);
                    mItemsDBHelper.deleteFromGroceryList(item.getName());
                    mRegularListAdapter.remove(item);
                    mRegularListAdapter.notifyDataSetChanged();
                    break;
            }
            mRegularListAdapter.notifyDataSetChanged();
        }
    }
}
