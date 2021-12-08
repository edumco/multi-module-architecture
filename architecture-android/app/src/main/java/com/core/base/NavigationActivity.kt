package com.core.base

import android.os.Bundle
import androidx.annotation.IdRes
import androidx.annotation.NavigationRes
import androidx.appcompat.app.AppCompatActivity
import androidx.navigation.NavController
import androidx.navigation.NavDestination
import androidx.navigation.NavGraph
import androidx.navigation.Navigator
import androidx.navigation.fragment.NavHostFragment
import com.example.app.R

abstract class NavigationActivity(
    @NavigationRes open val graphResId: Int,
    @IdRes open val startDestination: Int = DEFAULT_START_DESTINATION
) : AppCompatActivity(R.layout.navigation_activity) {
    companion object {
        const val DEFAULT_START_DESTINATION: Int = -1
    }

    open lateinit var navController: NavController
    open lateinit var navGraph: NavGraph
    private val navHostFragment: NavHostFragment by lazy {
        supportFragmentManager.findFragmentById(R.id.nav_host_fragment) as NavHostFragment
    }

    open fun customNavigators(): List<Navigator<out NavDestination>> = listOf()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val graphInflater = navHostFragment.navController.navInflater
        navController = navHostFragment.navController
        navController.apply {
            for (navigator in customNavigators()) {
                navigatorProvider.addNavigator(navigator)
            }
        }
        navGraph = graphInflater.inflate(graphResId)
        if (startDestination != DEFAULT_START_DESTINATION) {
            navGraph.setStartDestination(startDestination)
        }
        navController.graph = navGraph
    }
}
