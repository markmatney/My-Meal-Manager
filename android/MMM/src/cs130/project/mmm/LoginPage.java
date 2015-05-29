package cs130.project.mmm;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.*;
import com.android.volley.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;

/**
 * Created by mmdango on 5/15/15.
 */
public class LoginPage extends Activity {

    ViewAnimator mSampleImages;
    EditText mEmailAddress;
    EditText mPassword;
    EditText mConfirmPassword;
    TextView mTitleText;
    Button mLoginButton;
    Button mRegisterButton;
    Button mSubmitButton;

    ProgressDialog mProgressDialog;

    Boolean mIsLogin = true;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        SharedPreferences sharedPref = getSharedPreferences(getResources().getString(R.string.app_name), Context.MODE_PRIVATE);
        int storedId = sharedPref.getInt("id", -2);
        if (storedId != -2) {
            mProgressDialog = ProgressDialog.show(LoginPage.this, "Logging in...", "Please wait", true);
            String username = sharedPref.getString("username", "");
            String password = sharedPref.getString("password", "");
            loginUser(username, password);
            return;
        }
        setContentView(R.layout.login_page_layout);
        mSampleImages = (ViewAnimator) findViewById(R.id.sample_images);
        mEmailAddress = (EditText) findViewById(R.id.register_email);
        mPassword = (EditText) findViewById(R.id.register_password);
        mConfirmPassword = (EditText) findViewById(R.id.register_password_confirm);
        mTitleText = (TextView) findViewById(R.id.login_title_text);
        mLoginButton = (Button) findViewById(R.id.login_button);
        mLoginButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                mLoginButton.setBackgroundColor(0xFF000000);
                mRegisterButton.setBackgroundColor(0xFF222222);
                mTitleText.setText("Login");
                mConfirmPassword.setVisibility(View.GONE);
                if (!mIsLogin) {
                    mConfirmPassword.setText("");
                    mPassword.setText("");
                }
                mIsLogin = true;

            }
        });
        mRegisterButton = (Button) findViewById(R.id.register_button);
        mRegisterButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                mLoginButton.setBackgroundColor(0xFF222222);
                mRegisterButton.setBackgroundColor(0xFF000000);
                mTitleText.setText("Register");
                mConfirmPassword.setVisibility(View.VISIBLE);
                if (mIsLogin) {
                    mConfirmPassword.setText("");
                    mPassword.setText("");
                }
                mIsLogin = false;
            }
        });

        mSubmitButton = (Button) findViewById(R.id.submit_button);
        mSubmitButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if (mIsLogin) {
                    String username = mEmailAddress.getText().toString();
                    String pass = mPassword.getText().toString();
                    mProgressDialog = ProgressDialog.show(LoginPage.this, "Logging in...", "Please wait", true);
                    loginUser(username, pass);

                } else {
                    String username = mEmailAddress.getText().toString();
                    String pass1 = mPassword.getText().toString();
                    String pass2 = mConfirmPassword.getText().toString();
                    if (pass1.equals(pass2)) {
                        mProgressDialog = ProgressDialog.show(LoginPage.this, "Registering new user", "Almost there!", true);
                        registerUser(username, mPassword.getText().toString());
                    }
                }
            }
        });
    }

    private void loginUser(final String username, final String password) {
        String url = getResources().getString(R.string.api) + "login.php";
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("username", username);
        params.put("password", password);

        CustomRequest jsObjRequest = new CustomRequest(Request.Method.POST, url, params, new Response.Listener<JSONObject>() {

            @Override
            public void onResponse(JSONObject response) {
                try {
                    mProgressDialog.dismiss();
                    int code = response.getInt("code");
                    switch(code) {
                        case 0:
                            int id = response.getInt("id");
                            SharedPreferences sp = getSharedPreferences(getResources().getString(R.string.app_name), Context.MODE_PRIVATE);
                            SharedPreferences.Editor editor = sp.edit();
                            editor.putString("username", username);
                            editor.putString("password", password);
                            editor.putInt("id", id);
                            editor.commit();
                            Intent toMasterActivity = new Intent(getApplicationContext(), MasterActivity.class);
                            toMasterActivity.putExtra("id", id);
                            startActivity(toMasterActivity);
                            finish();
                            break;
                        case 1:
                            Toast.makeText(LoginPage.this, "Incorrect Password or Username", Toast.LENGTH_SHORT).show();
                            break;
                        default:
                            //other error
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }

            }
        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError response) {
                mProgressDialog.dismiss();
                Log.d("Response: ", response.toString());
            }
        });
        APIHelper.getInstance(this).addToRequestQueue(jsObjRequest);
    }

    private void registerUser(final String username, final String password) {
        String url = getResources().getString(R.string.api) + "register.php";
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("username", username);
        params.put("password", password);

        CustomRequest jsObjRequest = new CustomRequest(Request.Method.POST, url, params, new Response.Listener<JSONObject>() {

            @Override
            public void onResponse(JSONObject response) {
                try {
                    mProgressDialog.dismiss();
                    int code = response.getInt("code");
                    switch(code) {
                        case 0:
                            int id = response.getInt("id");
                            SharedPreferences sp = getSharedPreferences(getResources().getString(R.string.app_name), Context.MODE_PRIVATE);
                            SharedPreferences.Editor editor = sp.edit();
                            editor.putString("username", username);
                            editor.putString("password", password);
                            editor.putInt("id", id);
                            editor.commit();
                            Intent toMasterActivity = new Intent(getApplicationContext(), MasterActivity.class);
                            toMasterActivity.putExtra("id", id);
                            startActivity(toMasterActivity);
                            break;
                        case 1:
                            Toast.makeText(LoginPage.this, "Username already exists!", Toast.LENGTH_SHORT).show();
                            break;
                        case 2:
                            //other error
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }

            }
        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError response) {
                mProgressDialog.dismiss();
                Log.d("Response: ", response.toString());
            }
        });
        APIHelper.getInstance(this).addToRequestQueue(jsObjRequest);
    }

    @Override
    protected void onResume() {
        super.onResume();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
    }

}
