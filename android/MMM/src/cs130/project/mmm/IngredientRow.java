package cs130.project.mmm;

import android.os.Parcel;
import android.os.Parcelable;

/**
 * Created by mmdango on 4/29/15.
 */
public class IngredientRow extends Object implements Parcelable{
    String mName;
    double mQuantity;
    String mUnit;
    boolean mIsChecked;

    public IngredientRow(String name, double quantity, String unit) {
        mName = name;
        mQuantity = quantity;
        mUnit = unit;
    }

    public boolean isChecked() {
        return mIsChecked;
    }

    public void setChecked(boolean b) {
        mIsChecked = b;
    }

    public String getName() {
        return mName;
    }

    public double getQuantity() {
        return mQuantity;
    }

    public String getUnit() {
        return mUnit;
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(mName);
        dest.writeDouble(mQuantity);
        dest.writeString(mUnit);
    }

    public static final Parcelable.Creator<IngredientRow> CREATOR = new Parcelable.Creator<IngredientRow>() {
        public IngredientRow createFromParcel(Parcel in) {
            return new IngredientRow(in);
        }

        public IngredientRow[] newArray(int size) {
            return new IngredientRow[size];
        }
    };

    private IngredientRow(Parcel in) {
        mName = in.readString();
        mQuantity = in.readDouble();
        mUnit = in.readString();
    }
}
