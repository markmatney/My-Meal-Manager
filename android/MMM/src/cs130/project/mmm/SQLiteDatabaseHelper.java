package cs130.project.mmm;

import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;
import android.widget.Toast;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by mmdango on 4/30/15.
 */
public class SQLiteDatabaseHelper extends SQLiteOpenHelper {

    private static SQLiteDatabaseHelper sInstance;
    private final Context mContext;
    private final int mUserId;

    private static final int DATABASE_VERSION = 2;
    private static final String DATABASE_NAME = "ItemsDB";
    private static final String NAME = "ingredient_name";
    private static final String QUANTITY = "quantity";
    private static final String UNIT = "unit";


    private static final String INVENTORY_TABLE_NAME = "INVENTORY";
    private static final String INVENTORY_TABLE_CREATE =
            "CREATE TABLE " + INVENTORY_TABLE_NAME + " (" +
                    NAME + " VARCHAR(80) NOT NULL," +
                    QUANTITY + " FLOAT NOT NULL," +
                    UNIT + " VARCHAR(50) NOT NULL," +
                    "PRIMARY KEY ("+ NAME +")" +
                    ");";

    private static final String GROCERY_LIST_TABLE_NAME = "GROCERY_LIST";
    private static final String GROCERY_LIST_TABLE_CREATE =
            "CREATE TABLE " + GROCERY_LIST_TABLE_NAME + " (" +
                    NAME + " VARCHAR(80) NOT NULL," +
                    QUANTITY + " FLOAT NOT NULL," +
                    UNIT + " VARCHAR(50) NOT NULL," +
                    "PRIMARY KEY ("+ NAME +")" +
                    ");";

    private SQLiteDatabaseHelper(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
        mContext = context;
        SharedPreferences sharedPref = context.getSharedPreferences(context.getResources().getString(R.string.app_name), Context.MODE_PRIVATE);
        mUserId = sharedPref.getInt("id", -2); //id should always be loaded at this point
    }

    public static SQLiteDatabaseHelper getInstance(Context context) {
        if (sInstance == null) {
            sInstance = new SQLiteDatabaseHelper(context);
        }
        return sInstance;
    }

    public long addInventoryRow(String ingredientName, double quantity, String units) {
        MasterActivity.stopUpdater();
        SQLiteDatabase db = getWritableDatabase();
        ingredientName = ingredientName.toLowerCase();
        units = units.toLowerCase();

        /*
        String query = "SELECT * FROM " + INVENTORY_TABLE_NAME + " WHERE " + NAME + "=\"" + ingredientName + "\"";
        Cursor cursor = db.rawQuery(query, null);
        double currentQuantity = 0;
        String currentUnits = "";
        if (cursor.moveToFirst()) {
            currentQuantity = cursor.getDouble(1);
            currentUnits = cursor.getString(2);
        }
        double conversionRate = APIHelper.volumeConversionRate()*/

        ContentValues values = new ContentValues();
        values.put(NAME, ingredientName);
        values.put(QUANTITY, quantity);
        values.put(UNIT, units);
        sendDatabaseUpdate("add_to_inventory", ingredientName, String.valueOf(quantity), units);
        MasterActivity.startUpdater();
        return db.insertWithOnConflict(INVENTORY_TABLE_NAME, null, values, SQLiteDatabase.CONFLICT_IGNORE);
    }

    public long addInventoryRow(IngredientRow item) {
        return addInventoryRow(item.getName(), item.getQuantity(), item.getUnit());
    }

    public long addGroceryRow(String ingredientName, double quantity, String units) {
        MasterActivity.stopUpdater();

        SQLiteDatabase db = getWritableDatabase();
        ingredientName = ingredientName.toLowerCase();
        units = units.toLowerCase();

        ContentValues values = new ContentValues();
        values.put(NAME, ingredientName);
        values.put(QUANTITY, quantity);
        values.put(UNIT, units);
        sendDatabaseUpdate("add_to_grocery", ingredientName, String.valueOf(quantity), units);

        MasterActivity.startUpdater();

        return db.insertWithOnConflict(GROCERY_LIST_TABLE_NAME, null, values, SQLiteDatabase.CONFLICT_IGNORE);
    }

    public long addGroceryRow(IngredientRow item) {
        return addGroceryRow(item.getName(), item.getQuantity(), item.getUnit());
    }

    public void updateGroceryRow(String name, double quantity) {
        MasterActivity.stopUpdater();

        SQLiteDatabase db = getWritableDatabase();
        name = name.toLowerCase();
        Cursor cursor = db.rawQuery("SELECT * FROM " + GROCERY_LIST_TABLE_NAME + " WHERE " + NAME +
                "=\"" + name + "\"", null);
        cursor.moveToFirst();
        ContentValues values = new ContentValues();
        values.put(NAME, cursor.getString(0));
        values.put(UNIT, cursor.getString(2));
        values.put(QUANTITY, quantity);

        sendDatabaseUpdate("update_grocery", name, String.valueOf(quantity), cursor.getString(2));

        db.insertWithOnConflict(GROCERY_LIST_TABLE_NAME, null, values, SQLiteDatabase.CONFLICT_REPLACE);
        MasterActivity.startUpdater();

    }

    public void updateInventoryRow(String name, double quantity) {
        MasterActivity.stopUpdater();

        SQLiteDatabase db = getWritableDatabase();
        name = name.toLowerCase();

        Cursor cursor = db.rawQuery("SELECT * FROM " + INVENTORY_TABLE_NAME + " WHERE " + NAME +
                "=\"" + name + "\"", null);
        cursor.moveToFirst();
        ContentValues values = new ContentValues();
        values.put(NAME, cursor.getString(0));
        values.put(UNIT, cursor.getString(2));
        values.put(QUANTITY, quantity);

        sendDatabaseUpdate("update_inventory", name, String.valueOf(quantity), cursor.getString(2));
        db.insertWithOnConflict(INVENTORY_TABLE_NAME, null, values, SQLiteDatabase.CONFLICT_REPLACE);
        MasterActivity.startUpdater();

    }

    public void takeFromInventoryRow(String name, double quantity) {
        MasterActivity.stopUpdater();

        SQLiteDatabase db = getWritableDatabase();
        name = name.toLowerCase();

        Cursor cursor = db.rawQuery("SELECT * FROM " + INVENTORY_TABLE_NAME + " WHERE " + NAME +
                "=\"" + name + "\"", null);
        cursor.moveToFirst();
        if (cursor.getDouble(1) - quantity <= 0) {
            deleteFromInventory(name);
            return;
        }
        ContentValues values = new ContentValues();
        values.put(NAME, cursor.getString(0));
        values.put(UNIT, cursor.getString(2));
        values.put(QUANTITY, cursor.getDouble(1) - quantity);

        sendDatabaseUpdate("update_inventory", name, String.valueOf(quantity), cursor.getString(2));
        db.insertWithOnConflict(INVENTORY_TABLE_NAME, null, values, SQLiteDatabase.CONFLICT_REPLACE);
        MasterActivity.startUpdater();

    }

    public void deleteFromGroceryList(String name) {
        MasterActivity.stopUpdater();

        SQLiteDatabase db = getWritableDatabase();
        name = name.toLowerCase();

        Cursor cursor = db.rawQuery("SELECT * FROM " + GROCERY_LIST_TABLE_NAME + " WHERE " + NAME +
                "=\"" + name + "\"", null);
        cursor.moveToFirst();
        String quantity = cursor.getString(1);
        String units = cursor.getString(2);
        db.delete(GROCERY_LIST_TABLE_NAME, NAME + "=\"" + name + "\"", null);
        sendDatabaseUpdate("delete_from_grocery", name, quantity, units);
        MasterActivity.startUpdater();

    }

    public void deleteFromGroceryList(IngredientRow row) {
        deleteFromGroceryList(row.getName());
    }


    public void deleteFromInventory(String name) {
        MasterActivity.stopUpdater();

        SQLiteDatabase db = getWritableDatabase();
        name = name.toLowerCase();

        Cursor cursor = db.rawQuery("SELECT * FROM " + INVENTORY_TABLE_NAME + " WHERE " + NAME +
                "=\"" + name + "\"", null);
        cursor.moveToFirst();
        String quantity = cursor.getString(1);
        String units = cursor.getString(2);
        db.delete(INVENTORY_TABLE_NAME, NAME + "=\"" + name + "\"", null);
        sendDatabaseUpdate("delete_from_inventory", name, quantity, units);
        MasterActivity.startUpdater();

    }

    public void deleteFromInventory(IngredientRow row) {
        deleteFromInventory(row.getName());
    }

    public void moveToInventory(String name) {
        MasterActivity.stopUpdater();

        SQLiteDatabase db = getWritableDatabase();
        name = name.toLowerCase();

        Cursor cursor = db.rawQuery("SELECT * FROM " + GROCERY_LIST_TABLE_NAME + " WHERE " + NAME +
                "=\"" + name + "\"", null);
        cursor.moveToFirst();
        double groceryQuantity = cursor.getDouble(1);

        String units = cursor.getString(2);
        ContentValues values = new ContentValues();
        values.put(NAME, name);
        values.put(UNIT, units);

        cursor = db.rawQuery("SELECT " + QUANTITY + " FROM " + INVENTORY_TABLE_NAME + " WHERE " + NAME +
                "=\"" + name + "\"", null);
        double inventoryQuantity = 0;
        if (cursor.moveToFirst()) {
            inventoryQuantity = cursor.getDouble(0);
        }

        values.put(QUANTITY, groceryQuantity + inventoryQuantity);

        sendDatabaseUpdate("move_to_inventory", name, String.valueOf(groceryQuantity + inventoryQuantity), units);
        db.insertWithOnConflict(INVENTORY_TABLE_NAME, null, values, SQLiteDatabase.CONFLICT_REPLACE);
        db.delete(GROCERY_LIST_TABLE_NAME, NAME + "=\"" + name + "\"", null);
        MasterActivity.startUpdater();

    }
    /*
        Takes the ingredient name and quantity

        Returns 0 if user has ingredient and enough quantity
        Returns 1 if user has ingredient, but not enough
        Returns -1 if user does not have ingredient

        Returns 2 if cannot convert units
    */

    public int haveInInventory(String name, double quantity, String units) {
        MasterActivity.stopUpdater();

        SQLiteDatabase db = getReadableDatabase();
        name = name.toLowerCase();
        units = units.toLowerCase();

        String query = "SELECT * FROM " + INVENTORY_TABLE_NAME + " WHERE " + NAME + "=\"" + name + "\"";
        Cursor cursor = db.rawQuery(query, null);
        double invenQuantity = 0;
        String invenUnits = "";
        MasterActivity.startUpdater();

        if (cursor.moveToFirst()) {
            invenQuantity = cursor.getDouble(1);
            invenUnits = cursor.getString(2);
        } else {

            return -1;
        }

        double conversionRate1 = APIHelper.volumeConversionRate(units);
        double conversionRate2 = APIHelper.volumeConversionRate(invenUnits);
        if (conversionRate1 == -1) {
            conversionRate1 = APIHelper.weightConversionRate(units);
            if (conversionRate1 == -1) {
                return 2;
            }
        }

        if (conversionRate2 == -1) {
            conversionRate2 = APIHelper.weightConversionRate(units);
            if (conversionRate2 == -1) {
                return 2;
            }
        }
        quantity *= conversionRate1;
        invenQuantity *= conversionRate2;
        if (quantity <= invenQuantity) {
            return 0;
        } else {
            return 1;
        }

    }

    public void addToGrocery(String name, double quantity, String units) {
        MasterActivity.stopUpdater();

        SQLiteDatabase db = getWritableDatabase();
        name = name.toLowerCase();
        units = units.toLowerCase();

        Cursor cursor = db.rawQuery("SELECT * FROM " + GROCERY_LIST_TABLE_NAME + " WHERE " + NAME +
                "=\"" + name + "\"", null);
        double groceryQuantity = 0;
        if (cursor.moveToFirst()) {
            groceryQuantity = cursor.getDouble(1);
        }

        ContentValues values = new ContentValues();
        values.put(NAME, name);
        values.put(UNIT, units);
        double totalQuantity = groceryQuantity + quantity;

        values.put(QUANTITY, totalQuantity);
        sendDatabaseUpdate("add_to_grocery", name, String.valueOf(totalQuantity), units);
        db.insertWithOnConflict(GROCERY_LIST_TABLE_NAME, null, values, SQLiteDatabase.CONFLICT_REPLACE);
        MasterActivity.startUpdater();

    }

    public List<IngredientRow> getInventory() {
        MasterActivity.stopUpdater();

        SQLiteDatabase db = getReadableDatabase();
        String query = "SELECT * FROM " + INVENTORY_TABLE_NAME;
        Cursor cursor = db.rawQuery(query, null);

        ArrayList<IngredientRow> items = new ArrayList<IngredientRow>();

        while(cursor.moveToNext()){
            items.add(new IngredientRow(cursor.getString(0), cursor.getDouble(1), cursor.getString(2)));
        }
        MasterActivity.startUpdater();

        return items;
    }

    public List<IngredientRow> getGroceryList() {
        MasterActivity.stopUpdater();

        SQLiteDatabase db = getReadableDatabase();
        String query = "SELECT * FROM " + GROCERY_LIST_TABLE_NAME;
        Cursor cursor = db.rawQuery(query, null);

        ArrayList<IngredientRow> items = new ArrayList<IngredientRow>();

        while(cursor.moveToNext()){
            items.add(new IngredientRow(cursor.getString(0), cursor.getDouble(1), cursor.getString(2)));
        }
        MasterActivity.startUpdater();

        return items;
    }

    public void loadIntoGroceryList(JSONArray items) {
        MasterActivity.stopUpdater();

        SQLiteDatabase db = getWritableDatabase();
        db.delete(GROCERY_LIST_TABLE_NAME, null, null);
        try {
            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.getJSONObject(i);

                String name = item.getString("name");
                name = name.toLowerCase();

                String quantity = item.getString("quantity");
                String units = item.getString("units");
                units = units.toLowerCase();

                ContentValues values = new ContentValues();
                values.put(NAME, name);
                values.put(QUANTITY, quantity);
                values.put(UNIT, units);
                db.insertWithOnConflict(GROCERY_LIST_TABLE_NAME,null,values,SQLiteDatabase.CONFLICT_REPLACE);
            }
        } catch (JSONException e) {
            MasterActivity.startUpdater();

            e.printStackTrace();
        }
        MasterActivity.startUpdater();

    }

    public void loadIntoInventory(JSONArray items) {
        MasterActivity.stopUpdater();

        SQLiteDatabase db = getWritableDatabase();
        db.delete(INVENTORY_TABLE_NAME, null, null);
        try {
            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.getJSONObject(i);
                String name = item.getString("name");
                name = name.toLowerCase();

                String quantity = item.getString("quantity");
                String units = item.getString("units");
                units = units.toLowerCase();

                ContentValues values = new ContentValues();
                values.put(NAME, name);
                values.put(QUANTITY, quantity);
                values.put(UNIT, units);
                db.insertWithOnConflict(INVENTORY_TABLE_NAME, null, values, SQLiteDatabase.CONFLICT_REPLACE);
            }
        } catch (JSONException e) {
            MasterActivity.startUpdater();

            e.printStackTrace();
        }
        MasterActivity.startUpdater();

    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL(INVENTORY_TABLE_CREATE);
        db.execSQL(GROCERY_LIST_TABLE_CREATE);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {

    }
    private void sendDatabaseUpdate(String function, String name, String quantity, String units) {
        String url =  mContext.getResources().getString(R.string.api) + function + ".php";
        name = name.toLowerCase();
        units = units.toLowerCase();
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("id", String.valueOf(mUserId));
        params.put("name", name);
        params.put("quantity", quantity);
        params.put("units", units);

        CustomRequest jsObjRequest = new CustomRequest(Request.Method.POST, url, params, new Response.Listener<JSONObject>() {

            @Override
            public void onResponse(JSONObject response) {
                try {
                    int code = response.getInt("code");
                    if (code != 1) {
                        Toast.makeText(mContext, "Error updating database", Toast.LENGTH_SHORT).show();
                    }
                } catch (JSONException e) {
                    Toast.makeText(mContext, "Error updating database", Toast.LENGTH_SHORT).show();
                    e.printStackTrace();
                }

            }
        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError response) {
                Toast.makeText(mContext, "Error updating database", Toast.LENGTH_SHORT).show();

                Log.d("Response: ", response.toString());
            }
        });
        APIHelper.getInstance(mContext).addToRequestQueue(jsObjRequest);
    }
}