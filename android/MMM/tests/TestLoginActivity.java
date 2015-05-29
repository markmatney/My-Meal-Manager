package cs130.project.mmm;/*
 * Copyright (C) 2013 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import android.content.Intent;
import android.test.ActivityUnitTestCase;
import android.test.suitebuilder.annotation.MediumTest;
import android.widget.Button;

/**
 * Tests LaunchActivity in isolation from the system.
 */
public class TestLoginActivity extends ActivityUnitTestCase<LoginPage> {

    private Intent mLaunchIntent;

    public TestLoginActivity() {
        super(LoginPage.class);
    }


    @Override
    protected void setUp() throws Exception {
        super.setUp();
        //Create an intent to launch target Activity
        mLaunchIntent = new Intent(getInstrumentation().getTargetContext(),
                LoginPage.class);
    }

    /**
     * Tests Login Activity
     */
    @MediumTest
    public void testLoginActivity() {
        startActivity(mLaunchIntent, null, null);
        final Button loginButton = (Button) getActivity().findViewById(R.id.login_button);
        final Button registerButton = (Button) getActivity().findViewById(R.id.register_button);

        assertNotNull("mLaunchActivity is null", getActivity());
        assertNotNull("mLaunchNextButton is null", loginButton);
        assertNotNull("mLaunchNextButton is null", registerButton);

    }
}