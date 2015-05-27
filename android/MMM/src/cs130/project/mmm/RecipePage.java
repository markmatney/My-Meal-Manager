package cs130.project.mmm;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.*;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.*;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.NetworkImageView;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by mmdango on 5/17/15.
 */
public class RecipePage extends Activity {
    NetworkImageView mRecipeImage;
    ListView mIngredientsList;
    TextView mRecipeInstructions;

    ImageButton mAddToGroceryButton;
    ImageButton mBookmarkButton;
    ImageButton mChooseRecipe;
    int mUserId;
    boolean mBookmarked;

    IngredientsListAdapter mIngredientsListAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.recipe_layout);
        Intent recipeInfoIntent = getIntent();
        //add intent stuff
        mBookmarked = recipeInfoIntent.getBooleanExtra("bookmarked", false);
        final RecipeRow recipe = recipeInfoIntent.getParcelableExtra("recipe");
        TextView recipeTitleTextView = (TextView) findViewById(R.id.recipe_title);
        recipeTitleTextView.setText(recipe.getRecipeName() + " - Time: " + recipe.getCookTime());

        mRecipeImage = (NetworkImageView) findViewById(R.id.recipe_image);
        mRecipeImage.setImageUrl(recipe.getImageURL(), APIHelper.getInstance(this).getImageLoader());
        mIngredientsList = (ListView) findViewById(R.id.ingredients_listview);
        mRecipeInstructions = (TextView) findViewById(R.id.recipe_instructions);
        mRecipeInstructions.setText("Instructions:\n" + recipe.getInstructions());
        mIngredientsListAdapter = new IngredientsListAdapter(this, R.layout.ingredients_listview_item, recipe.getIngredients());
        mIngredientsList.setAdapter(mIngredientsListAdapter);
        View header = getLayoutInflater().inflate(R.layout.listview_header, null);
        ((TextView) header.findViewById(R.id.checkbox_listview_header)).setText("Ingredients:");
        mIngredientsList.addHeaderView(header);
        mAddToGroceryButton = (ImageButton) findViewById(R.id.add_missing_items_button);
        mAddToGroceryButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                for (int i = 0; i < mIngredientsListAdapter.getCount(); i++) {
                    IngredientRow curItem = mIngredientsListAdapter.getItem(i);
                    if (!curItem.isChecked()) {
                        SQLiteDatabaseHelper.getInstance(RecipePage.this).addGroceryRow(curItem);
                    }
                    Toast.makeText(RecipePage.this, "Added missing items to your grocery list!", Toast.LENGTH_SHORT).show();
                }
            }
        });

        mBookmarkButton = (ImageButton) findViewById(R.id.bookmark_button);
        if (mBookmarked) {
            mBookmarkButton.setImageDrawable(getDrawable(R.drawable.unbookmark_icon));
        }

        mBookmarkButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (mBookmarked) {
                    removeRecipeFromUser(recipe.getRecipeName());
                    mBookmarkButton.setImageDrawable(getDrawable(R.drawable.bookmark_icon));
                    mBookmarked = !mBookmarked;
                } else {
                    addRecipeToUser(recipe.getRecipeName());
                    mBookmarkButton.setImageDrawable(getDrawable(R.drawable.unbookmark_icon));
                    mBookmarked = !mBookmarked;
                }
            }
        });
        mChooseRecipe = (ImageButton) findViewById(R.id.choose_recipe_button);

        mChooseRecipe.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new AlertDialog.Builder(RecipePage.this)
                        .setTitle("Are you sure?")
                        .setMessage("Hitting yes will remove the checked ingredients from your inventory")
                        .setPositiveButton(android.R.string.yes, new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                                for (int i = 0; i < mIngredientsListAdapter.getCount(); i++) {
                                    IngredientRow curItem = mIngredientsListAdapter.getItem(i);
                                    if (curItem.isChecked()) {
                                        SQLiteDatabaseHelper.getInstance(RecipePage.this).takeFromInventoryRow(curItem.getName(), curItem.getQuantity());
                                    }
                                }
                            }
                        })
                        .show();

            }
        });
        SharedPreferences sharedPref = getSharedPreferences(getResources().getString(R.string.app_name), Context.MODE_PRIVATE);
        mUserId = sharedPref.getInt("id", -2);

    }

    private void addRecipeToUser(String recipeName) {
        //recipeName = recipeName.replace(" ", "%20");
        String url = getResources().getString(R.string.api) + "add_recipe_to_user.php";
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("id", String.valueOf(mUserId));
        params.put("recipe", recipeName);

        CustomRequest jsObjRequest = new CustomRequest(Request.Method.POST, url, params, new Response.Listener<JSONObject>() {

            @Override
            public void onResponse(JSONObject response) {
                try {
                    int code = response.getInt("code");
                    if (code != 0) {
                        Toast.makeText(RecipePage.this, "Cannot update database at this time", Toast.LENGTH_SHORT).show();
                    }

                } catch (JSONException e) {
                    e.printStackTrace();
                }

            }
        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError response) {
                Toast.makeText(RecipePage.this, "Cannot update database at this time", Toast.LENGTH_SHORT).show();
                Log.d("Response: ", response.toString());
            }
        });
        APIHelper.getInstance(this).addToRequestQueue(jsObjRequest);
    }

    private void removeRecipeFromUser(String recipeName) {
        //recipeName = recipeName.replace(" ", "%20");
        String url = getResources().getString(R.string.api) + "remove_recipe_from_user.php";
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("id", String.valueOf(mUserId));
        params.put("recipe", recipeName);

        CustomRequest jsObjRequest = new CustomRequest(Request.Method.POST, url, params, new Response.Listener<JSONObject>() {

            @Override
            public void onResponse(JSONObject response) {
                try {
                    int code = response.getInt("code");
                    if (code != 0) {
                        Toast.makeText(RecipePage.this, "Cannot update database at this time", Toast.LENGTH_SHORT).show();
                    }

                } catch (JSONException e) {
                    e.printStackTrace();
                }

            }
        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError response) {
                Toast.makeText(RecipePage.this, "Cannot update database at this time", Toast.LENGTH_SHORT).show();
                Log.d("Response: ", response.toString());
            }
        });
        APIHelper.getInstance(this).addToRequestQueue(jsObjRequest);
    }

    @Override
    protected void onResume() {
        super.onResume();
    }

}
