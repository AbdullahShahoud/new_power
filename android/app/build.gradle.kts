import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

// Release signing credentials, kept out of version control.
//
// Loaded defensively rather than with a hard `require`: a contributor who
// has cloned the repo but has no keystore must still be able to run
// `flutter build apk --release` for testing. When the file is missing the
// release build falls back to the debug key and prints why — noisy on
// purpose, because a debug-signed AAB is rejected by Play and the failure
// otherwise only shows up at upload time.
val keystoreProperties = Properties().apply {
    val file = rootProject.file("key.properties")
    if (file.exists()) file.inputStream().use { load(it) }
}
val hasReleaseSigning = keystoreProperties.getProperty("storeFile") != null

android {
    namespace = "com.newpower.app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        // `flutter_local_notifications` (the foreground push presenter) uses
        // java.time internally and refuses to build without this — its AAR
        // metadata declares the requirement, which is the
        // `checkDebugAarMetadata` failure.
        //
        // Desugaring back-ports those APIs to API levels below 26. That
        // band sits *above* this app's minSdk, so it covers devices the app
        // genuinely still ships to — not a theoretical case.
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // ⚠️ Permanent. Google Play binds a listing to its applicationId on
        // first publish and it can never be changed afterwards — a different
        // ID is a different app, with no upgrade path for installed users.
        //
        // Must stay in step with:
        //   - `package_name` in android/app/google-services.json
        //   - the Android app registered in the newpower-bgx Firebase project
        //   - the Android restriction on the Maps API key
        applicationId = "com.newpower.app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        if (hasReleaseSigning) {
            create("release") {
                storeFile = file(keystoreProperties.getProperty("storeFile"))
                storePassword = keystoreProperties.getProperty("storePassword")
                keyAlias = keystoreProperties.getProperty("keyAlias")
                keyPassword = keystoreProperties.getProperty("keyPassword")
            }
        }
    }

    buildTypes {
        release {
            signingConfig = if (hasReleaseSigning) {
                signingConfigs.getByName("release")
            } else {
                logger.warn(
                    "\n⚠️  android/key.properties not found — signing the RELEASE build with " +
                    "the DEBUG key.\n    This artifact is fine for local testing and will be " +
                    "REJECTED by Google Play.\n"
                )
                signingConfigs.getByName("debug")
            }
        }
    }
}

dependencies {
    // The runtime half of `isCoreLibraryDesugaringEnabled` — the flag alone
    // does nothing without this artifact. 2.1.4 is the floor
    // `flutter_local_notifications` 18.x asks for; older versions build but
    // fail at runtime on the very devices desugaring exists to serve.
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}

flutter {
    source = "../.."
}
