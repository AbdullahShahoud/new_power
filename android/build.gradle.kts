allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// The AGP version this app actually builds with — keep in sync with the
// `com.android.application` version in settings.gradle.kts.
val agpVersion = "8.11.1"

// Many Flutter plugins still carry a legacy `buildscript { classpath
// 'com.android.tools.build:gradle:X' }` block pinning their *own* AGP —
// just_audio pins 8.5.0, connectivity_plus 8.12.1, app_links 8.6.1, and so
// on. Each distinct version is a separate multi-megabyte download of a
// toolchain the build never uses: the plugin subprojects are compiled by the
// app's AGP regardless.
//
// On a network where dl.google.com is slow or blocked that turns every one
// of them into a build-stopping timeout — and the cascading symptom is
// misleading, because a failed classpath means `com.android.library` never
// applies and Gradle then reports "Configuration with name 'implementation'
// not found" plus an NPE, neither of which is the real fault.
//
// Forcing them all onto the app's own AGP is what the modern plugin template
// does by simply omitting the block. It removes the downloads entirely, so
// the build stops depending on that network path at all.
subprojects {
    buildscript.configurations
        .matching { it.name == "classpath" }
        .configureEach {
            resolutionStrategy.eachDependency {
                if (requested.group == "com.android.tools.build" &&
                    requested.name == "gradle"
                ) {
                    useVersion(agpVersion)
                }
            }
        }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
