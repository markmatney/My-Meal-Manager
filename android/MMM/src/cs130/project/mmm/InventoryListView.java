
package cs130.project.mmm;

import android.app.AlertDialog;
import android.app.ListActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import com.wdullaer.swipeactionadapter.SwipeActionAdapter;
import com.wdullaer.swipeactionadapter.SwipeDirections;

import java.util.ArrayList;
import java.util.Arrays;


public class InventoryListView extends ListActivity
{
    protected SwipeActionAdapter mAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        String[] content = new String[20];
        for (int i=0;i<20;i++) content[i] = "Row "+(i+1);
        ArrayAdapter<String> stringAdapter = new ArrayAdapter<String>(
                this,
                R.layout.checkbox_listview_item,
                5,
                new ArrayList<String>(Arrays.asList(content))
        );
        mAdapter = new SwipeActionAdapter(stringAdapter);
        mAdapter.setDimBackgrounds(true)
                .setListView(getListView());
        setListAdapter(mAdapter);

        mAdapter.addBackground(SwipeDirections.DIRECTION_FAR_LEFT,R.layout.checkbox_listview_footer)
                .addBackground(SwipeDirections.DIRECTION_NORMAL_LEFT,R.layout.checkbox_listview_footer)
                .addBackground(SwipeDirections.DIRECTION_FAR_RIGHT, R.layout.checkbox_listview_footer)
                .addBackground(SwipeDirections.DIRECTION_NORMAL_RIGHT, R.layout.checkbox_listview_footer);
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();
        return super.onOptionsItemSelected(item);
    }

    @Override
    protected void onListItemClick(ListView listView, View view, int position, long id){
        Toast.makeText(
                this,
                "Clicked "+mAdapter.getItem(position),
                Toast.LENGTH_SHORT
        ).show();
    }
}
