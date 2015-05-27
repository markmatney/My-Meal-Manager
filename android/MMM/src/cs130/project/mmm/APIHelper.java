package cs130.project.mmm;

import android.content.Context;
import android.graphics.Bitmap;
import android.util.Log;
import android.util.LruCache;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.Volley;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Timer;
import java.util.TimerTask;

/**
 * Created by mmdango on 5/15/15.
 */
public class APIHelper {

    private static APIHelper mInstance;
    private RequestQueue mRequestQueue;
    private ImageLoader mImageLoader;
    private static Context mContext;

    private APIHelper(Context context) {
        mContext = context;
        mRequestQueue = getRequestQueue();

        mImageLoader = new ImageLoader(mRequestQueue,
                new ImageLoader.ImageCache() {
                    private final LruCache<String, Bitmap>
                            cache = new LruCache<String, Bitmap>(20);

                    @Override
                    public Bitmap getBitmap(String url) {
                        return cache.get(url);
                    }

                    @Override
                    public void putBitmap(String url, Bitmap bitmap) {
                        cache.put(url, bitmap);
                    }
                });
    }


    /*
        Parameter: unit
        Returns the conversion rate from the specified unit to cups
        Returns -1 if cannot be converted;
     */
    public static double volumeConversionRate(String unit) {
        unit = unit.toLowerCase();
        if (unit.charAt(unit.length()-1) == 's') {
            unit = unit.substring(0, unit.length()-1);
        }

        if (unit.equals("tablespoon")) {
            return 1/16;
        }

        if (unit.equals("teaspoon")) {
            return 1/48;
        }

        if (unit.equals("cup")) {
            return 1;
        }

        if (unit.equals("pint")) {
            return 0.5;
        }
        if (unit.equals("gallon")) {
            return 0.0625;
        }
        return -1;
    }
    /*
        Parameter: unit
        Returns the conversion rate from the specified unit to ounces
        Returns -1 if cannot be converted;
     */
    public static double weightConversionRate(String unit) {
        unit = unit.toLowerCase();
        if (unit.charAt(unit.length()-1) == 's') {
            unit = unit.substring(0, unit.length()-1);
        }

        if (unit.equals("pound")) {
            return 16;
        }

        if (unit.equals("ounce")) {
            return 1;
        }

        // Considering these are relatively small amounts, return 0 for it
        if (unit.equals("sprig") || unit.equals("dashe") || unit.equals("pinch")) {
            return 0;
        }

        return -1;
    }

    public static synchronized APIHelper getInstance(Context context) {
        if (mInstance == null) {
            mInstance = new APIHelper(context);
        }
        return mInstance;
    }

    public RequestQueue getRequestQueue() {
        if (mRequestQueue == null) {
            // getApplicationContext() is key, it keeps you from leaking the
            // Activity or BroadcastReceiver if someone passes one in.
            mRequestQueue = Volley.newRequestQueue(mContext.getApplicationContext());
        }
        return mRequestQueue;
    }

    public <T> void addToRequestQueue(Request<T> req) {
        getRequestQueue().add(req);
    }

    public ImageLoader getImageLoader() {
        return mImageLoader;
    }
}

