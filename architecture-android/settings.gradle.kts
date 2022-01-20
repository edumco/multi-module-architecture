pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        mavenCentral()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
        maven (url =  "https://artifactory.it4ng.eu/virtual")
        maven ( url  = "https://jitpack.io" )
    }
}
rootProject.name = "ModularFeatureArchitecture"
include (":app")
include (":libraries")
include (":libraries:bug-finder")
include (":libraries:injection")
include (":libraries:auto-service")
include (":libraries:auto-service:android")
include (":libraries:auto-service:annotations")
include (":libraries:auto-service:processor")

include (":engineering")
include (":engineering:interfaces")
include (":engineering:interfaces:networking-interface")
include (":engineering:interfaces:storage-interface")
include (":engineering:interfaces:tagging-interface")
include (":engineering:interfaces:security-interface")
include (":engineering:implementations")
include (":engineering:implementations:networkingsecurev2")

include (":modules")
include (":modules:structural")
include (":modules:structural:networking")
include (":modules:structural:networkingsecure")
include (":modules:structural:networkingsecurev2")
include (":modules:structural:storage")
include (":modules:structural:security")
include (":modules:structural:tagging")

include (":modules:journey")
include (":modules:journey:login")
include (":modules:journey:home")
include (":modules:journey:profile")
