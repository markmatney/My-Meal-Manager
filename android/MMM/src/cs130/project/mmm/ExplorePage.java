package cs130.project.mmm;

import android.app.Fragment;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.*;
import android.widget.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.ArrayList;

/**
 * Created by mmdango on 5/8/15.
 */
public class ExplorePage extends Fragment {

    ListView mExploreGridView;
    LinearLayout mSearchBar;
    EditText mSearchQuery;
    ImageButton mSearchButton;
    ArrayAdapter<RecipeRow> mRecipeArrayAdapter;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.explore_search_page, container, false);
        mExploreGridView = (ListView) rootView.findViewById(R.id.explore_listview);
        mSearchBar = (LinearLayout) rootView.findViewById(R.id.search_bar);
        mSearchQuery = (EditText) rootView.findViewById(R.id.search_query);
        mSearchButton = (ImageButton) rootView.findViewById(R.id.enter_search_button);
        mSearchButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new SendSearchQuery().execute(mSearchQuery.getText().toString());
            }
        });

        mExploreGridView.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                Intent toRecipePageIntent = new Intent(getActivity(), RecipePage.class);
                RecipeRow recipe = mRecipeArrayAdapter.getItem(position);
                toRecipePageIntent.putExtra("image_url", recipe.getImageURL());
                toRecipePageIntent.putExtra("recipe_id", recipe.getRecipeId());
                getActivity().startActivity(toRecipePageIntent);
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        return rootView;

    }


    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        new SendSearchQuery().execute(""); //To initially populate gridview
        setHasOptionsMenu(true);
        mRecipeArrayAdapter = new ExploreResultsAdapter(getActivity(), R.layout.explore_listview_item, new ArrayList<RecipeRow>());

        mExploreGridView.setAdapter(mRecipeArrayAdapter);
        testLayout();
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.inventory_action_bar, menu);
        super.onCreateOptionsMenu(menu, inflater);
    }

    public void testLayout() {
        mRecipeArrayAdapter.add(new RecipeRow(0, "Cheese balls", "http://creamcentre.com/files/9913/6057/0117/cheese_corn_balls.jpg"));
        mRecipeArrayAdapter.add(new RecipeRow(1, "Pizza", "http://uncletonysnypizza.com/wp-content/uploads/2012/10/pep_pizza_BIG.jpg"));
        mRecipeArrayAdapter.add(new RecipeRow(2, "Spaghetti", "http://divinehealthyfood.com/wp-content/uploads/2014/01/Vegan_Spaghetti_Bolognese_Recipe_001.jpg"));

        mRecipeArrayAdapter.notifyDataSetChanged();
    }

    @Override
    public void onResume() {
        super.onResume();
    }

    @Override
    public void onPause() {
        super.onPause();
    }

    @Override
    public void onStop() {
        super.onStop();
    }

    private class SendSearchQuery extends AsyncTask<String, Void, Void> {
        @Override
        protected Void doInBackground(String... params) {
            String query = params[0];
            BufferedReader rd  = null;
            StringBuilder sb = null;
            String line = null;
            try {
                URL url = new URL("");
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("GET");
                connection.connect();
                rd  = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                sb = new StringBuilder();

                while ((line = rd.readLine()) != null)
                {
                    sb.append(line + '\n');
                }
                //return sb.toString();

            } catch (MalformedURLException e) {
                e.printStackTrace();
            } catch (ProtocolException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

            return null;
        }

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
        }

        @Override
        protected void onPostExecute(Void aVoid) {
            super.onPostExecute(aVoid);
        }


        @Override
        protected void onProgressUpdate(Void... values) {}

        @Override
        protected void onCancelled(Void aVoid) {
            super.onCancelled(aVoid);
        }
    }
}