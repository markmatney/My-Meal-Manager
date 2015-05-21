package cs130.project.mmm;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

import android.net.Uri;

import java.net.URISyntaxException;
import java.util.ArrayList;

/**
 * Created by mmdango on 5/17/15.
 */
public class RecipePage extends Activity {
    ImageView mRecipeImage;
    ListView mIngredientsList;
    TextView mRecipeInstructions;

    GroceryListAdapter mIngredientsListAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.recipe_layout);
        mRecipeImage = (ImageView) findViewById(R.id.recipe_image);
        mIngredientsList = (ListView) findViewById(R.id.ingredients_listview);
        mRecipeInstructions = (TextView) findViewById(R.id.recipe_instructions);
        mIngredientsListAdapter = new GroceryListAdapter(this, R.layout.grocery_list_listview_item, new ArrayList<ItemRow>());
        mIngredientsList.setAdapter(mIngredientsListAdapter);
    }

    public void testPageLayout() {
        mRecipeImage.setImageDrawable(getResources().getDrawable(R.drawable.green_checkmark, null));
        mIngredientsListAdapter.add(new ItemRow("Mozerella Cheese", 1.0, "cups"));
        mIngredientsListAdapter.add(new ItemRow("Cheddar Cheese", 1.0, "cups"));

        mIngredientsListAdapter.add(new ItemRow("Dough", 16.0, "ounces"));
        mIngredientsListAdapter.add(new ItemRow("Salt", 2.0, "tblspn"));
        mIngredientsListAdapter.notifyDataSetChanged();
    }

    @Override
    protected void onResume() {
        super.onResume();
    }

}
