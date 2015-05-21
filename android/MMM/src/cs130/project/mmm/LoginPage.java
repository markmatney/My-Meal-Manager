package cs130.project.mmm;

import android.app.Activity;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.ViewAnimator;

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

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
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
            }
        });

        mSubmitButton = (Button) findViewById(R.id.submit_button);
        mSubmitButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent toMasterActivity = new Intent(getApplicationContext(), MasterActivity.class);
                startActivity(toMasterActivity);

            }
        });
    }

    private void registerUser() {

    }

    @Override
    protected void onResume() {
        super.onResume();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
    }

    private class AuthorizeLogin extends AsyncTask<String, Void, Void> {

        @Override
        protected Void doInBackground(String... params) {
            return null;
        }

        @Override
        protected void onPostExecute(Void aVoid) {
            super.onPostExecute(aVoid);
        }

        @Override
        protected void onCancelled(Void aVoid) {
            super.onCancelled(aVoid);
        }

        @Override
        protected void onCancelled() {
            super.onCancelled();
        }
    }
}
