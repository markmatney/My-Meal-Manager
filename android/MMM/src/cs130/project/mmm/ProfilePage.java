package cs130.project.mmm;

import android.app.Fragment;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.GridView;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by mmdango on 5/17/15.
 */
public class ProfilePage extends Fragment {
    GridView mRecipesGridView;
    ArrayAdapter<RecipeRow> mRecipeArrayAdapter;
    int mUserId;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.profile_layout, container, false);

        mRecipesGridView = (GridView) rootView.findViewById(R.id.bookmarked_gridview);
        return rootView;
    }

    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        mRecipeArrayAdapter = new ExploreResultsAdapter(getActivity(), R.layout.explore_listview_item, new ArrayList<RecipeRow>());
        mRecipesGridView.setAdapter(mRecipeArrayAdapter);
        SharedPreferences sharedPref = getActivity().getSharedPreferences(getResources().getString(R.string.app_name), Context.MODE_PRIVATE);
        mUserId = sharedPref.getInt("id", -2);

    }

    @Override
    public void onResume() {
        super.onResume();
        mRecipeArrayAdapter.clear();
        getUserRecipes();
    }


    private void getUserRecipes() {
        String url = getResources().getString(R.string.api) + "get_user_recipes.php?id=" + mUserId;

        CustomRequest jsObjRequest = new CustomRequest(Request.Method.POST, url, null, new Response.Listener<JSONObject>() {

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
