package cs130.project.mmm;

import android.os.Parcel;
import android.os.Parcelable;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by mmdango on 5/18/15.
 */
public class RecipeRow implements Parcelable {

    String mRecipeName;
    String mImageURL;
    List<IngredientRow> mIngredients;
    int mNumberIngredients;
    String mInstructions;
    String mRecipeURL;
    String mCookTime;

    public RecipeRow (String recipeName, String imageURL, List<IngredientRow> ingredients, String instructions, String recipeURL, String cookTime) {
        mRecipeName = recipeName;
        mImageURL = imageURL;
        mIngredients = ingredients;
        mNumberIngredients = mIngredients.size();
        mInstructions = instructions;
        mRecipeURL = recipeURL;
        mCookTime = cookTime;
    }

    public RecipeRow (String recipeName) {
        mRecipeName = recipeName;
    }

    public void setEverything(String recipeName, String imageURL, List<IngredientRow> ingredients, String instructions, String recipeURL, String cookTime) {
        mRecipeName = recipeName;
        mImageURL = imageURL;
        mIngredients = ingredients;
        mNumberIngredients = mIngredients.size();
        mInstructions = instructions;
        mRecipeURL = recipeURL;
        mCookTime = cookTime;
    }

    public String getImageURL() {
        return mImageURL;
    }

    public String getRecipeName() {
        return mRecipeName;
    }

    public String getInstructions() {
        return mInstructions;
    }

    public List<IngredientRow> getIngredients() {
        return mIngredients;
    }

    public String getRecipeURL() {
        return mRecipeURL;
    }

    public String getCookTime() {
        return mCookTime;
    }

    // 99.9% of the time you can just ignore this
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(mRecipeName);
        dest.writeString(mImageURL);
        dest.writeString(mInstructions);
        dest.writeString(mRecipeURL);
        dest.writeString(mCookTime);
        dest.writeInt(mNumberIngredients);
        IngredientRow[] ingredientRows = new IngredientRow[mNumberIngredients];
        mIngredients.toArray(ingredientRows);
        dest.writeTypedArray(ingredientRows, flags);

    }

    // this is used to regenerate your object. All Parcelables must have a CREATOR that implements these two methods
    public static final Parcelable.Creator<RecipeRow> CREATOR = new Parcelable.Creator<RecipeRow>() {
        public RecipeRow createFromParcel(Parcel in) {
            return new RecipeRow(in);
        }

        public RecipeRow[] newArray(int size) {
            return new RecipeRow[size];
        }
    };

    // example constructor that takes a Parcel and gives you an object populated with it's values
    private RecipeRow(Parcel in) {
        mRecipeName = in.readString();
        mImageURL = in.readString();
        mInstructions = in.readString();
        mRecipeURL = in.readString();
        mCookTime = in.readString();
        mNumberIngredients = in.readInt();
        IngredientRow[] ingredients = new IngredientRow[mNumberIngredients];
        in.readTypedArray(ingredients, IngredientRow.CREATOR);
        mIngredients = new ArrayList<IngredientRow>(Arrays.asList(ingredients));
    }

}
