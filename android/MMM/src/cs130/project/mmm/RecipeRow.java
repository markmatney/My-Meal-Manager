package cs130.project.mmm;

/**
 * Created by mmdango on 5/18/15.
 */
public class RecipeRow {

    int mRecipeId;
    String mRecipeName;
    String mImageURL;

    public RecipeRow (int recipeId, String recipeName, String imageURL) {
        mRecipeId = recipeId;
        mRecipeName = recipeName;
        mImageURL = imageURL;
    }

    public int getRecipeId() {
        return mRecipeId;
    }

    public String getImageURL() {
        return mImageURL;
    }

    public String getRecipeName() {
        return mRecipeName;
    }

}
