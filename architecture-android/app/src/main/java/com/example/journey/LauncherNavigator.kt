package com.example.journey

import android.content.Context
import android.os.Bundle
import android.util.AttributeSet
import androidx.navigation.*
import com.example.app.R

/**
 * Allows to navigate to some [DialogFragment].
 *
 * Usage: add some dialog element in your navigation graph
 * ```
 *     <launcher android:id="@+id/my_dialog"
 *               android:name="com.exemple.MyDialogFragment"/>
 *
 * ```
 * Use [DialogNavHostFragment] as your [androidx.navigation.NavHost] in your layout
 * or add the DialogNavigator to your [NavigatorProvider]
 */
@Navigator.Name("launcher")
class LauncherNavigator(
    private val context: Context
) : Navigator<LauncherNavigator.Destination>() {

    override fun createDestination(): Destination = Destination(this)
    override fun popBackStack(): Boolean {
        return super.popBackStack()
    }

    override fun navigate(
        destination: Destination,
        args: Bundle?,
        navOptions: NavOptions?,
        navigatorExtras: Extras?
    ): NavDestination? {

        return super.navigate(destination, args, navOptions, navigatorExtras)
    }

    class Destination(navigator: LauncherNavigator) : NavDestination(navigator) {
        var name: String? = null
            get() = checkNotNull(field) { "destination name was not set" }
        var destiny: Int? = null

        override fun onInflate(context: Context, attrs: AttributeSet) {
            super.onInflate(context, attrs)
            val it = context.resources.obtainAttributes(attrs, R.styleable.LauncherNavigator)
            name = it.getString(R.styleable.LauncherNavigator_android_name)
            destiny = it.getResourceId(R.styleable.LauncherNavigator_destiny, 0)
            it.recycle()
        }
    }
}