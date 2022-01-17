// Top-level build file where you can add configuration options common to all sub-projects/modules.
plugins {
    id("com.google.devtools.ksp") version ("1.6.10-1.0.2") apply false
    id("com.android.application") version ("7.0.4") apply false
    id("com.android.library") version ("7.0.4") apply false
    id("org.jetbrains.kotlin.android") version ("1.6.10") apply false
    id("com.android.dynamic-feature") version ("7.0.4") apply false
    id("androidx.navigation.safeargs.kotlin") version ("2.4.0-beta02") apply false
    id("org.jetbrains.kotlin.kapt") version ("1.6.10") apply false
}

tasks {
    register("clean", Delete::class) {
        delete = setOf(rootProject.buildDir)
    }
}