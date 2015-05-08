package cs130.project.mmm;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteDatabase;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by mmdango on 4/30/15.
 */
public class SQLiteDatabaseHelper extends SQLiteOpenHelper {

    private static SQLiteDatabaseHelper sInstance;

    private static final int DATABASE_VERSION = 2;
    private static final String DATABASE_NAME = "ItemsDB";
    private static final String NAME = "ingredient_name";
    private static final String DESCRIPTION = "description";
    private static final String QUANTITY = "quantity";
    private static final String UNIT = "unit";


    private static final String INVENTORY_TABLE_NAME = "INVENTORY";
    private static final String INVENTORY_TABLE_CREATE =
            "CREATE TABLE " + INVENTORY_TABLE_NAME + " (" +
                    NAME + " VARCHAR(80) NOT NULL," +
                    DESCRIPTION + " TEXT," +
                    QUANTITY + " FLOAT NOT NULL," +
                    UNIT + " VARCHAR(50) NOT NULL," +
                    "PRIMARY KEY ("+ NAME +")" +
                    ");";

    private static final String GROCERY_LIST_TABLE_NAME = "GROCERY_LIST";
    private static final String GROCERY_LIST_TABLE_CREATE =
            "CREATE TABLE " + GROCERY_LIST_TABLE_NAME + " (" +
                    NAME + " VARCHAR(80) NOT NULL," +
                    DESCRIPTION + " TEXT," +
                    QUANTITY + " FLOAT NOT NULL," +
                    UNIT + " VARCHAR(50) NOT NULL," +
                    "PRIMARY KEY ("+ NAME +")" +
                    ");";

    private SQLiteDatabaseHelper(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }

    public static SQLiteDatabaseHelper getInstance(Context context) {
        if (sInstance == null) {
            sInstance = new SQLiteDatabaseHelper(context);
        }
        return sInstance;
    }

    public long addInventoryRow(String ingredientName, String description, double quantity, String unit) {
        SQLiteDatabase db = getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(NAME, ingredientName);
        values.put(DESCRIPTION, description);
        values.put(QUANTITY, quantity);
        values.put(UNIT, unit);

        return db.insertWithOnConflict(INVENTORY_TABLE_NAME, null, values, SQLiteDatabase.CONFLICT_IGNORE);
    }

    public long addGroceryRow(String ingredientName, String description, double quantity, String unit) {
        SQLiteDatabase db = getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(NAME, ingredientName);
        values.put(DESCRIPTION, description);
        values.put(QUANTITY, quantity);
        values.put(UNIT, unit);

        return db.insertWithOnConflict(GROCERY_LIST_TABLE_NAME, null, values, SQLiteDatabase.CONFLICT_IGNORE);
    }

    public long addGroceryRow(ItemRow item) {
        return addGroceryRow(item.getName(), null, item.getQuantity(), item.getUnit());
    }

    public void updateGroceryRow(String name, double quantity) {
        SQLiteDatabase db = getWritableDatabase();
        Cursor cursor = db.rawQuery("SELECT * FROM " + GROCERY_LIST_TABLE_NAME + " WHERE " + NAME +
                "=\"" + name + "\"", null);
        cursor.moveToFirst();
        ContentValues values = new ContentValues();
        values.put(NAME, cursor.getString(0));
        values.put(DESCRIPTION, cursor.getString(1));
        values.put(UNIT, cursor.getString(3));
        values.put(QUANTITY, quantity);

        db.insertWithOnConflict(GROCERY_LIST_TABLE_NAME, null, values, SQLiteDatabase.CONFLICT_REPLACE);
    }

    public void updateInventoryRow(String name, double quantity) {
        SQLiteDatabase db = getWritableDatabase();
        Cursor cursor = db.rawQuery("SELECT * FROM " + INVENTORY_TABLE_NAME + " WHERE " + NAME +
                "=\"" + name + "\"", null);
        cursor.moveToFirst();
        ContentValues values = new ContentValues();
        values.put(NAME, cursor.getString(0));
        values.put(DESCRIPTION, cursor.getString(1));
        values.put(UNIT, cursor.getString(3));
        values.put(QUANTITY, quantity);

        db.insertWithOnConflict(INVENTORY_TABLE_NAME, null, values, SQLiteDatabase.CONFLICT_REPLACE);
    }

    public void moveToInventory(String name) {
        SQLiteDatabase db = getWritableDatabase();
        Cursor cursor = db.rawQuery("SELECT * FROM " + GROCERY_LIST_TABLE_NAME + " WHERE " + NAME +
                "=\"" + name + "\"", null);
        cursor.moveToFirst();
        double groceryQuantity = cursor.getDouble(2);

        ContentValues values = new ContentValues();
        values.put(NAME, cursor.getString(0));
        values.put(DESCRIPTION, cursor.getString(1));
        values.put(UNIT, cursor.getString(3));

        cursor = db.rawQuery("SELECT " + QUANTITY + " FROM " + INVENTORY_TABLE_NAME + " WHERE " + NAME +
                "=\"" + name + "\"", null);
        double inventoryQuantity = 0;
        if (cursor.moveToFirst()) {
            inventoryQuantity = cursor.getDouble(0);
        }

        values.put(QUANTITY, groceryQuantity + inventoryQuantity);

        db.insertWithOnConflict(INVENTORY_TABLE_NAME, null, values, SQLiteDatabase.CONFLICT_REPLACE);
        db.delete(GROCERY_LIST_TABLE_NAME, NAME + "=\"" + name + "\"", null);
    }

    public void moveToGrocery(String name, double quantity, boolean removeFromInventory) {
        SQLiteDatabase db = getWritableDatabase();
        double inventoryQuantity = quantity;

        Cursor cursor = db.rawQuery("SELECT * FROM " + INVENTORY_TABLE_NAME + " WHERE " + NAME +
                "=\"" + name + "\"", null);
        cursor.moveToFirst();
        ContentValues values = new ContentValues();
        values.put(NAME, cursor.getString(0));
        values.put(DESCRIPTION, cursor.getString(1));
        values.put(UNIT, cursor.getString(3));

        cursor = db.rawQuery("SELECT " + QUANTITY + " FROM " + GROCERY_LIST_TABLE_NAME + " WHERE " + NAME +
                "=\"" + name + "\"", null);
        double groceryQuantity = 0;
        if (cursor.moveToFirst()) {
            groceryQuantity = cursor.getDouble(0);
        }

        values.put(QUANTITY, groceryQuantity + inventoryQuantity);

        db.insertWithOnConflict(GROCERY_LIST_TABLE_NAME, null, values, SQLiteDatabase.CONFLICT_REPLACE);
        if (removeFromInventory) {
            db.delete(INVENTORY_TABLE_NAME, NAME + "=\"" + name + "\"", null);    }
    }

    public List<ItemRow> getInventory() {
        SQLiteDatabase db = getReadableDatabase();
        String query = "SELECT * FROM " + INVENTORY_TABLE_NAME;
        Cursor cursor = db.rawQuery(query, null);

        ArrayList<ItemRow> items = new ArrayList<ItemRow>();

        while(cursor.moveToNext()){
            items.add(new ItemRow(cursor.getString(0), cursor.getDouble(2), cursor.getString(3)));
        }
        return items;
    }

    public List<ItemRow> getGroceryList() {
        SQLiteDatabase db = getReadableDatabase();
        String query = "SELECT * FROM " + GROCERY_LIST_TABLE_NAME;
        Cursor cursor = db.rawQuery(query, null);

        ArrayList<ItemRow> items = new ArrayList<ItemRow>();

        while(cursor.moveToNext()){
            items.add(new ItemRow(cursor.getString(0), cursor.getDouble(2), cursor.getString(3)));
        }
        return items;
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL(INVENTORY_TABLE_CREATE);
        db.execSQL(GROCERY_LIST_TABLE_CREATE);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {

    }
}