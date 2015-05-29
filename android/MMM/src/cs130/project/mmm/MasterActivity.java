package cs130.project.mmm;

import android.app.ActionBar;
import android.app.Activity;
import android.content.*;
import android.os.Bundle;
import android.app.Fragment;
import android.app.FragmentTransaction;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.LinearLayout;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Timer;
import java.util.TimerTask;

/**
 * Created by mmdango on 5/8/15.
 */
public class MasterActivity extends Activity {

    private static int mUserId;
    private boolean isEditing = false;
    private LinearLayout mBackground;
    private static Timer mPeriodicUpdates;

    private static GroceryList mGroceryList;
    private static InventoryList mInventory;
    private static String API_URL;
    private static Context mContext;
    private static boolean mTimerStarted = false;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.master_layout);

        mBackground = (LinearLayout) findViewById(R.id.background);
        ActionBar actionBar = getActionBar();
        actionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_TABS);
        actionBar.setDisplayShowTitleEnabled(false);

        ActionBar.Tab groceryListTab = actionBar.newTab()
                .setText(R.string.grocery_list)
                .setTabListener(new TabListener<GroceryList>(
                        this, "grocery_list", GroceryList.class));
        actionBar.addTab(groceryListTab);
        ActionBar.Tab inventoryListTab = actionBar.newTab()
                .setText(R.string.inventory)
                .setTabListener(new TabListener<InventoryList>(
                        this, "inventory_list", InventoryList.class));
        actionBar.addTab(inventoryListTab);

        ActionBar.Tab exploreTab = actionBar.newTab()
                .setText(R.string.explore_page)
                .setTabListener(new TabListener<ExplorePage>(
                        this, "explore_tab", ExplorePage.class));
        actionBar.addTab(exploreTab);

        ActionBar.Tab profileTab = actionBar.newTab()
                .setText(R.string.profile_page)
                .setTabListener(new TabListener<ProfilePage>(
                        this, "profile_tab", ProfilePage.class));
        actionBar.addTab(profileTab);

        API_URL = getResources().getString(R.string.api);
        mContext = getApplicationContext();
        startUpdater();

    }

    @Override
    protected void onResume() {
        super.onResume();

        mGroceryList = (GroceryList) getFragmentManager().findFragmentByTag("grocery_list");
        mInventory = (InventoryList) getFragmentManager().findFragmentByTag("inventory_list");
        setUserId();
        startUpdater();
    }

    @Override
    protected void onPause() {
        super.onPause();
        stopUpdater();
    }


    public static void startUpdater() {
        if (mTimerStarted) {
            return;
        }
        mTimerStarted = true;
        mPeriodicUpdates = new Timer();
        mPeriodicUpdates.schedule(new TimerTask() {

            public void run() {
                fetchGroceryList();
                fetchInventory();
            }
        }, 5000);
    }

    public static void stopUpdater() {
        if (!mTimerStarted) {
            return;
        }
        mTimerStarted = false;
        mPeriodicUpdates.cancel();
    }

    private static void fetchGroceryList() {
        String url = API_URL + "get_grocery.php?" + "id=" + String.valueOf(mUserId);

        CustomRequest jsObjRequest = new CustomRequest(Request.Method.GET, url, null, new Response.Listener<JSONObject>() {

            @Override
            public void onResponse(JSONObject response) {
                try {
                    JSONArray groceryItems = response.getJSONArray("items");
                    SQLiteDatabaseHelper.getInstance(mContext).loadIntoGroceryList(groceryItems);
                    if (mGroceryList != null) {
                        mGroceryList.syncList();
                    }
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

    private static void fetchInventory() {
        String url = API_URL + "get_inventory.php?" + "id=" + String.valueOf(mUserId);

        CustomRequest jsObjRequest = new CustomRequest(Request.Method.GET, url, null, new Response.Listener<JSONObject>() {

            @Override
            public void onResponse(JSONObject response) {
                try {
                    JSONArray inventoryItems = response.getJSONArray("items");
                    SQLiteDatabaseHelper.getInstance(mContext).loadIntoInventory(inventoryItems);
                    if (mInventory != null) {
                        mInventory.syncList();
                    }
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

    void setUserId() {
        Intent info = getIntent();
        mUserId = info.getIntExtra("id", -1);
        Intent testIntent = getIntent();
        if (testIntent.getBooleanExtra("testing", false)) {
            mUserId = testIntent.getIntExtra("test_id", mUserId);
        }
        fetchGroceryList();
        fetchInventory();
    }

    @Override
    public boolean onMenuItemSelected(int featureId, MenuItem item) {
        if (R.id.edit_mode ==item.getItemId()) {
            if (!isEditing) {
                mBackground.setBackgroundColor(0xFF333333);
            } else {
                mBackground.setBackgroundColor(0x55111111);
            }
            isEditing = !isEditing;
        }
        return super.onMenuItemSelected(featureId, item);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        return super.onCreateOptionsMenu(menu);
    }

    public static class TabListener<T extends Fragment> implements ActionBar.TabListener {
        private Fragment mFragment;
        private final Activity mActivity;
        private final String mTag;
        private final Class<T> mClass;

        /** Constructor used each time a new tab is created.
         * @param activity  The host Activity, used to instantiate the fragment
         * @param tag  The identifier tag for the fragment
         * @param clz  The fragment's Class, used to instantiate the fragment
         */
        public TabListener(Activity activity, String tag, Class<T> clz) {
            mActivity = activity;
            mTag = tag;
            mClass = clz;
        }

    /* The following are each of the ActionBar.TabListener callbacks */

        @Override
        public void onTabSelected(ActionBar.Tab tab, FragmentTransaction ft) {
            // Check if the fragment is already initialized
            if (mFragment == null) {
                // If not, instantiate and add it to the activity
                mFragment = Fragment.instantiate(mActivity, mClass.getName());
                ft.add(android.R.id.content, mFragment, mTag);
            } else {
                // If it exists, simply attach it in order to show it
                ft.attach(mFragment);
            }
        }

        @Override
        public void onTabUnselected(ActionBar.Tab tab, FragmentTransaction ft) {
            if (mFragment != null) {
                // Detach the fragment, because another one is being attached
                ft.detach(mFragment);
            }
        }

        @Override
        public void onTabReselected(ActionBar.Tab tab, FragmentTransaction ft) {
            // User selected the already selected tab. Usually do nothing.
        }
    }
}