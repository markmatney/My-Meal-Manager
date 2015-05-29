package cs130.project.mmm;

import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.*;
import android.widget.*;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by mmdango on 5/8/15.
 */
public class ExplorePage extends Fragment {

    GridView mExploreGridView;
    LinearLayout mSearchBar;
    EditText mSearchQuery;
    ImageButton mSearchButton;
    ArrayAdapter<RecipeRow> mRecipeArrayAdapter;
    int mUserId;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.explore_search_page, container, false);
        mExploreGridView = (GridView) rootView.findViewById(R.id.explore_gridview);
        mSearchBar = (LinearLayout) rootView.findViewById(R.id.search_bar);
        mSearchQuery = (EditText) rootView.findViewById(R.id.search_query);
        mSearchButton = (ImageButton) rootView.findViewById(R.id.enter_search_button);
        mSearchButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mRecipeArrayAdapter.clear();
                mRecipeArrayAdapter.notifyDataSetChanged();
                sendSearchQuery(mSearchQuery.getText().toString());
            }
        });
        return rootView;
    }


    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        SharedPreferences sharedPref = getActivity().getSharedPreferences(getResources().getString(R.string.app_name), Context.MODE_PRIVATE);
        mUserId = sharedPref.getInt("id", -2);

        mRecipeArrayAdapter = new ExploreResultsAdapter(getActivity(), R.layout.explore_listview_item, new ArrayList<RecipeRow>());
        mExploreGridView.setAdapter(mRecipeArrayAdapter);
        getExploreResults();
        //testLayout();
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.inventory_action_bar, menu);
        super.onCreateOptionsMenu(menu, inflater);
    }

    private void getExploreResults() {
        String url = getResources().getString(R.string.api) + "search.php";
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("id", String.valueOf(mUserId));
        params.put("ingredients", "");

        CustomRequest jsObjRequest = new CustomRequest(Request.Method.POST, url, params, new Response.Listener<JSONObject>() {

            @Override
            public void onResponse(JSONObject response) {
                try {
                    JSONArray recipes = response.getJSONArray("recipes");
                    for (int i = 0 ;i < recipes.length(); i++) {
                        getRecipeInfo(recipes.getString(i));
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
        APIHelper.getInstance(getActivity()).addToRequestQueue(jsObjRequest);
    }

    private void sendSearchQuery(String query) {
        String url = getResources().getString(R.string.api) + "search.php";
        String[] items = query.split(",");
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("id", String.valueOf(mUserId));
        String ingredients = "";
        for (String item : items) {
            if (item.equals("")) {
                continue;
            }
            ingredients += " \"" + item.trim() + '"';
        }
        params.put("ingredients", ingredients);

        CustomRequest jsObjRequest = new CustomRequest(Request.Method.POST, url, params, new Response.Listener<JSONObject>() {

            @Override
            public void onResponse(JSONObject response) {
                try {
                    JSONArray recipes = response.getJSONArray("recipes");
                    for (int i = 0 ;i < recipes.length(); i++) {
                        //mRecipeArrayAdapter.add(new RecipeRow(recipes.getString(i)));
                        getRecipeInfo(recipes.getString(i));
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
        APIHelper.getInstance(getActivity()).addToRequestQueue(jsObjRequest);
    }

    public void testLayout() {
        //mRecipeArrayAdapter.add(new RecipeRow(0, "Cheese balls", "http://creamcentre.com/files/9913/6057/0117/cheese_corn_balls.jpg"));
        //mRecipeArrayAdapter.add(new RecipeRow(1, "Pizza", "http://uncletonysnypizza.com/wp-content/uploads/2012/10/pep_pizza_BIG.jpg"));
        //mRecipeArrayAdapter.add(new RecipeRow(2, "Spaghetti", "http://divinehealthyfood.com/wp-content/uploads/2014/01/Vegan_Spaghetti_Bolognese_Recipe_001.jpg"));

        mRecipeArrayAdapter.notifyDataSetChanged();
    }

    public void getRecipeInfo(String recipeName) {
        recipeName = recipeName.replace(" ", "%20");
        String url = getResources().getString(R.string.api) + "get_recipe.php?recipe_name=" + recipeName;

        CustomRequest jsObjRequest = new CustomRequest(Request.Method.POST, url, null, new Response.Listener<JSONObject>() {

            @Override
            public void onResponse(JSONObject response) {
                try {
                    String recipeName = response.getString("recipe_name");
                    String recipeURL = response.getString("url");
                    String imageURL = response.getString("image_url");
                    String cookTime = response.getString("time");
                    String instructions = response.getString("instructions");
                    JSONArray JSONIngredients = response.getJSONArray("ingredients");
                    ArrayList<IngredientRow> ingredients = new ArrayList<IngredientRow>();
                    for (int i = 0; i < JSONIngredients.length(); i++) {
                        JSONObject ing = JSONIngredients.getJSONObject(i);
                        String ingredientName = ing.getString("name");
                        String units = ing.getString("units");
                        double quantity = ing.getDouble("quantity");
                        ingredients.add(new IngredientRow(ingredientName, quantity, units));

                    }
                    /*
                    for(int i = 0; i < mRecipeArrayAdapter.getCount(); i++) {
                        if (mRecipeArrayAdapter.getItem(i).getRecipeName().equals(recipeName))) {
                            mRecipeArrayAdapter.getItem(i).setEverything(recipeName, imageURL, ingredients, instructions, recipeURL, cookTime);
                        }
                    }*/
                    mRecipeArrayAdapter.add(new RecipeRow(recipeName, imageURL, ingredients, instructions, recipeURL, cookTime));
                    mRecipeArrayAdapter.notifyDataSetChanged();

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
        APIHelper.getInstance(getActivity()).addToRequestQueue(jsObjRequest);
    }

}