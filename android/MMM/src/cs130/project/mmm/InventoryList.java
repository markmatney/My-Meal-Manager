package cs130.project.mmm;

import android.app.AlertDialog;
import android.app.ListFragment;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.*;
import android.widget.*;
import com.wdullaer.swipeactionadapter.SwipeActionAdapter;
import com.wdullaer.swipeactionadapter.SwipeDirections;

/**`
 * Created by mmdango on 4/30/15.
 */
public class InventoryList extends ListFragment implements SwipeActionAdapter.SwipeActionListener {

    SwipeActionAdapter mInventoryListAdapter;
    InventoryListAdapter mRegularListAdapter;
    SQLiteDatabaseHelper mItemsDBHelper;

    private boolean isEditing = false;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        setHasOptionsMenu(true);
        return inflater.inflate(R.layout.listview_background, container, false);
    }

    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        mItemsDBHelper = SQLiteDatabaseHelper.getInstance(getActivity());
        setUpInventory(view);
        setUpSwipeAdapter();

    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.inventory_action_bar, menu);

        super.onCreateOptionsMenu(menu, inflater);

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

    public void syncList() {
        mRegularListAdapter.clear();
        mRegularListAdapter.addAll(mItemsDBHelper.getInventory());
        mRegularListAdapter.notifyDataSetChanged();
        mInventoryListAdapter.notifyDataSetChanged();
    }

    private void setUpInventory(final View view) {
        ListView inventoryListView = getListView();
        mRegularListAdapter = new InventoryListAdapter(getActivity(), R.layout.inventory_listview_item,
                mItemsDBHelper.getInventory());

        View header = getActivity().getLayoutInflater().inflate(R.layout.listview_header, null);
        ((TextView) header.findViewById(R.id.checkbox_listview_header)).setText("Inventory");
        inventoryListView.addHeaderView(header);

        View footer = getActivity().getLayoutInflater().inflate(R.layout.listview_footer, null);
        inventoryListView.addFooterView(footer);
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

                IngredientRow newRow = new IngredientRow(nameText.getText().toString(),
                        Double.parseDouble(quantityText.getText().toString()),
                        unitText.getText().toString());
                mRegularListAdapter.add(newRow);
                mItemsDBHelper.addInventoryRow(newRow);
                mRegularListAdapter.notifyDataSetChanged();
                mInventoryListAdapter.notifyDataSetChanged();
                nameText.setText("");
                quantityText.setText("");
                unitText.setText("");
            }
        });


    }

    public void setUpSwipeAdapter() {
        mInventoryListAdapter = new SwipeActionAdapter(mRegularListAdapter);
        mInventoryListAdapter.setSwipeActionListener(this)
                .setDimBackgrounds(true)
                .setListView(getListView());

        setListAdapter(mInventoryListAdapter);

        mInventoryListAdapter.addBackground(SwipeDirections.DIRECTION_FAR_LEFT,R.layout.swipe_to_grocery_list_bg)
                .addBackground(SwipeDirections.DIRECTION_NORMAL_LEFT,R.layout.swipe_to_grocery_list_bg)
                .addBackground(SwipeDirections.DIRECTION_FAR_RIGHT,R.layout.swipe_delete_right)
                .addBackground(SwipeDirections.DIRECTION_NORMAL_RIGHT, R.layout.swipe_delete_right);

        mInventoryListAdapter.notifyDataSetChanged();
    }

    private void toRegularAdapter() {
        setListAdapter(mRegularListAdapter);
        mInventoryListAdapter.setSwipeActionListener(null);
    }

    private void toSwipeAdapter() {
        setListAdapter(mInventoryListAdapter);
        mInventoryListAdapter.setSwipeActionListener(this);
    }

    @Override
    public boolean hasActions(int position){
        if (position == getListView().getChildCount()-1)
            return false;
        return true;
    }

    @Override
    public boolean shouldDismiss(int position, int direction){
        return direction == SwipeDirections.DIRECTION_FAR_RIGHT || direction == SwipeDirections.DIRECTION_NORMAL_RIGHT;
    }

    @Override
    public void onSwipe(int[] positionList, int[] directionList){
        for(int i=0;i<positionList.length;i++) {
            int direction = directionList[i];
            int position = positionList[i];
            final IngredientRow item;
            switch (direction) {
                case SwipeDirections.DIRECTION_FAR_LEFT:
                case SwipeDirections.DIRECTION_NORMAL_LEFT:
                    item = (IngredientRow) mInventoryListAdapter.getItem(position-1);
                    AlertDialog.Builder alert = new AlertDialog.Builder(getActivity());

                    LayoutInflater inflater= getActivity().getLayoutInflater();
                    //this is what I did to added the layout to the alert dialog
                    View layout=inflater.inflate(R.layout.alert_dialog_edit_text,null);
                    alert.setView(layout);
                    final EditText quantityText = (EditText) layout.findViewById(R.id.to_grocery_quantity);
                    final EditText unitsText = (EditText) layout.findViewById(R.id.to_grocery_units);
                    quantityText.setText(String.valueOf(item.getQuantity()));
                    unitsText.setText(item.getUnit());

                    alert.setTitle("Add to Grocery List")
                            .setMessage(item.getName())
                            .setPositiveButton(android.R.string.yes, new DialogInterface.OnClickListener() {
                                public void onClick(DialogInterface dialog, int which) {
                                    if (quantityText.getText().toString().equals("") || unitsText.getText().toString().equals("")) {
                                        return;
                                    }
                                    double quantity = Double.parseDouble(quantityText.getText().toString());
                                    String units = unitsText.getText().toString();
                                    mItemsDBHelper.addToGrocery(item.getName().toString(), quantity, units);

                                }
                            })
                            .show();
                    break;
                case SwipeDirections.DIRECTION_FAR_RIGHT:
                case SwipeDirections.DIRECTION_NORMAL_RIGHT:
                    item = (IngredientRow) mInventoryListAdapter.getItem(position-1);
                    mItemsDBHelper.deleteFromInventory(item);
                    mRegularListAdapter.remove(item);
                    mRegularListAdapter.notifyDataSetChanged();
                    break;
            }
            mInventoryListAdapter.notifyDataSetChanged();
        }
    }

    @Override
    public void onListItemClick(ListView l, View v, int position, long id) {
        super.onListItemClick(l, v, position, id);

    }
}
