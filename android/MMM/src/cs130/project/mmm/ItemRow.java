package cs130.project.mmm;

/**
 * Created by mmdango on 4/29/15.
 */
public class ItemRow {
    String mName;
    double mQuantity;
    String mUnit;

    public ItemRow(String name, double quantity, String unit) {
        mName = name;
        mQuantity = quantity;
        mUnit = unit;
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
}
