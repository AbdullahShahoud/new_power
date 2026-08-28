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

// The core-library-desugaring runtime, pinned for *every* subproject.
//
// The block above only rewrites the `classpath` configuration — the AGP the
// plugin builds itself with. It does not touch the plugin's own dependency
// declarations, which is why it did not cover this: `flutter_local_notifications`
// 18.0.1 declares `com.android.tools:desugar_jdk_libs:1.2.2` for its own
// module, and Google no longer serves an artifact at that coordinate. The
// symptom is release-only, because `generateReleaseLintModel` is the task
// that resolves it — debug builds never ask.
//
// 2.1.4 is what the app module already uses and what is already in the local
// Gradle cache. It is a strict superset of 1.2.2's desugaring, so forcing it
// changes nothing at runtime beyond back-porting more of java.time.
val desugarVersion = "2.1.4"

subprojects {
    configurations.configureEach {
        resolutionStrategy.eachDependency {
            if (requested.group == "com.android.tools" &&
                requested.name.startsWith("desugar_jdk_libs")
            ) {
                useVersion(desugarVersion)
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
