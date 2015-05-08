package cs130.project.mmm;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.ListActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import com.wdullaer.swipeactionadapter.SwipeActionAdapter;
import com.wdullaer.swipeactionadapter.SwipeDirections;

/**`
 * Created by mmdango on 4/30/15.
 */
public class InventoryList extends ListActivity implements SwipeActionAdapter.SwipeActionListener {

    SwipeActionAdapter mInventoryListAdapter;
    SQLiteDatabaseHelper mItemsDBHelper;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.checkbox_listview);
        mItemsDBHelper = SQLiteDatabaseHelper.getInstance(this);

        setUpInventory();


    }

    private void setUpInventory() {
        ListView inventoryListView = getListView();//(ListView)findViewById(R.id.items_list);

        View header = getLayoutInflater().inflate(R.layout.checkbox_listview_header, null);
        ((TextView) header.findViewById(R.id.checkbox_listview_header)).setText("Inventory");
        inventoryListView.addHeaderView(header);

        InventoryListAdapter adapter = new InventoryListAdapter(this, R.layout.inventory_listview_item,
                mItemsDBHelper.getInventory());


        mInventoryListAdapter = new SwipeActionAdapter(adapter);
        mInventoryListAdapter.setSwipeActionListener(this)
                .setDimBackgrounds(true)
                .setListView(getListView());
        setListAdapter(mInventoryListAdapter);

        mInventoryListAdapter.addBackground(SwipeDirections.DIRECTION_FAR_LEFT,R.layout.checkbox_listview_footer)
                .addBackground(SwipeDirections.DIRECTION_NORMAL_LEFT,R.layout.checkbox_listview_footer)
                .addBackground(SwipeDirections.DIRECTION_FAR_RIGHT,R.layout.checkbox_listview_footer)
                .addBackground(SwipeDirections.DIRECTION_NORMAL_RIGHT, R.layout.checkbox_listview_footer);

        mInventoryListAdapter.notifyDataSetChanged();
        //inventoryListView.setAdapter(mInventoryListAdapter);
    }

    @Override
    protected void onListItemClick(ListView listView, View view, int position, long id){
        Toast.makeText(
                this,
                "Clicked "+ mInventoryListAdapter.getItem(position),
                Toast.LENGTH_SHORT
        ).show();
    }

    @Override
    public boolean hasActions(int position){
        return true;
    }

    @Override
    public boolean shouldDismiss(int position, int direction){
        return direction == SwipeDirections.DIRECTION_NORMAL_LEFT;
    }

    @Override
    public void onSwipe(int[] positionList, int[] directionList){
        for(int i=0;i<positionList.length;i++) {
            int direction = directionList[i];
            int position = positionList[i];
            String dir = "";

            switch (direction) {
                case SwipeDirections.DIRECTION_FAR_LEFT:
                    dir = "Far left";
                    break;
                case SwipeDirections.DIRECTION_NORMAL_LEFT:
                    dir = "Left";
                    break;
                case SwipeDirections.DIRECTION_FAR_RIGHT:
                    dir = "Far right";
                    break;
                case SwipeDirections.DIRECTION_NORMAL_RIGHT:
                    AlertDialog.Builder builder = new AlertDialog.Builder(this);
                    builder.setTitle("Test Dialog").setMessage("You swiped right").create().show();
                    dir = "Right";
                    break;
            }
            Toast.makeText(
                    this,
                    dir + " swipe Action triggered on " + mInventoryListAdapter.getItem(position-1),
                    Toast.LENGTH_SHORT
            ).show();
            mInventoryListAdapter.notifyDataSetChanged();
        }
    }
}
