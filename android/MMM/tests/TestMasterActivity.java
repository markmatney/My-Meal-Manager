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
public class TestMasterActivity extends ActivityUnitTestCase<MasterActivity> {

    private Intent mLaunchIntent;

    public TestMasterActivity() {
        super(MasterActivity.class);
    }


    @Override
    protected void setUp() throws Exception {
        super.setUp();
        //Create an intent to launch target Activity
        mLaunchIntent = new Intent(getInstrumentation().getTargetContext(),
                MasterActivity.class);
        mLaunchIntent.putExtra("testing", true);
        mLaunchIntent.putExtra("test_id", 1);

    }


    @MediumTest
    public void testMasterActivity() {
        //Start the activity under test in isolation, without values for savedInstanceState and
        //lastNonConfigurationInstance
        startActivity(mLaunchIntent, null, null);
        ActionBar.Tab groceryTab = getActivity().getActionBar().getTabAt(0);
        ActionBar.Tab inventoryTab = getActivity().getActionBar().getTabAt(1);
        ActionBar.Tab exploreTab = getActivity().getActionBar().getTabAt(2);
        ActionBar.Tab profileTab = getActivity().getActionBar().getTabAt(3);

        assertNotNull("mLaunchActivity is null", getActivity());
        assertNotNull("Grocery List is null", groceryTab);
        assertNotNull("Inventory is null", inventoryTab);
        assertNotNull("Explore is null", exploreTab);
        assertNotNull("Profile is null", profileTab);

    }
}