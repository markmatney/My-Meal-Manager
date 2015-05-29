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

import android.app.ActionBar;
import android.content.Intent;
import android.test.ActivityUnitTestCase;
import android.test.suitebuilder.annotation.MediumTest;
import android.widget.Button;

/**
 * Tests LaunchActivity in isolation from the system.
 */
public class TestRecipeActivity extends ActivityUnitTestCase<RecipePage> {

    private Intent mLaunchIntent;

    public TestRecipeActivity() {
        super(RecipePage.class);
    }


    @Override
    protected void setUp() throws Exception {
        super.setUp();
        //Create an intent to launch target Activity
        mLaunchIntent = new Intent(getInstrumentation().getTargetContext(),
                MasterActivity.class);

        //RecipeRow recipe = new RecipeRow("Rosemary Steak", )

    }

    /**
     * Tests the preconditions of this test fixture.
     */
    @MediumTest
    public void testRecipeActivity() {
        //Start the activity under test in isolation, without values for savedInstanceState and
        //lastNonConfigurationInstance
        startActivity(mLaunchIntent, null, null);

        assertNotNull("mLaunchActivity is null", getActivity());

    }
}