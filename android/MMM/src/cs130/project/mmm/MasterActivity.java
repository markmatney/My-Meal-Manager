package cs130.project.mmm;

import android.app.ActionBar;
import android.app.Activity;
import android.os.Bundle;
import android.app.Fragment;
import android.app.FragmentTransaction;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.LinearLayout;
import android.widget.TabHost;
import android.widget.Toast;
import android.widget.ViewFlipper;

/**
 * Created by mmdango on 5/8/15.
 */
public class MasterActivity extends Activity {

    private boolean isEditing = false;
    private LinearLayout mBackground;
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

        ActionBar.Tab ExploreTab = actionBar.newTab()
                .setText(R.string.explore_page)
                .setTabListener(new TabListener<ExplorePage>(
                        this, "explore_tab", ExplorePage.class));
        actionBar.addTab(ExploreTab);


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