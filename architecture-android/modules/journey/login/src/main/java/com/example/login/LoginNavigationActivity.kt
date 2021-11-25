package com.example.login

import android.injection.get
import android.injection.provides
import android.os.Bundle
import com.core.base.NavigationActivity
import com.core.extensions.extra
import com.example.journey.login.tracking.LoginTracking
import com.example.login.business.LoginBusinessModel
import com.example.login.business.repository.local.LoginStorage
import com.example.login.business.repository.remote.LoginApi

class LoginNavigationActivity : NavigationActivity(R.navigation.login_navigation_graph) {
    //lateinit var module: Module
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val tracking: LoginTracking = extra("tracking", LoginTracking())
        // TODO ADD MODULES DEPENDENCIES
//        module =
        provides {
            declare<LoginTracking> { tracking }
            declareWithSuperClasses {
                val api = LoginApi(get())
                val storage = LoginStorage(get())
                LoginBusinessModel(api, storage)
            }
        }
//        addModule(module)
    }

    override fun onDestroy() {
        super.onDestroy()
        // TODO REMOVE MODULES DEPENDENCIES
//        removeModule(module)
    }
}