// plugins {
//     id("com.android.application")
//     // START: FlutterFire Configuration
//     id("com.google.gms.google-services")
//     // END: FlutterFire Configuration
//     id("kotlin-android")
//     // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
//     id("dev.flutter.flutter-gradle-plugin")
// }
// // def keystoreProperties = new Properties()
// // def keystorePropertiesFile = rootProject.file("key.properties")

// // if (keystorePropertiesFile.exists()) {
// //     keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
// // }
// val keystoreProperties = java.util.Properties()
// val keystorePropertiesFile = rootProject.file("key.properties")

// if (keystorePropertiesFile.exists()) {
//     keystoreProperties.load(keystorePropertiesFile.inputStream())
// }


// android {
//     namespace = "com.unitaqua.unity_labs"
//     compileSdk = flutter.compileSdkVersion
//     ndkVersion = "27.0.12077973"


//     compileOptions {
//         sourceCompatibility = JavaVersion.VERSION_11
//         targetCompatibility = JavaVersion.VERSION_11
//     }

//     kotlinOptions {
//         jvmTarget = JavaVersion.VERSION_11.toString()
//         // jvmTarget = "1.8"
//     }

//     defaultConfig {
//         // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
//         applicationId = "com.unitaqua.unity_labs"
//         // You can update the following values to match your application needs.
//         // For more information, see: https://flutter.dev/to/review-gradle-config.
//         minSdk = flutter.minSdkVersion
//         targetSdk = flutter.targetSdkVersion
//         versionCode = flutter.versionCode
//         versionName = flutter.versionName
//     }

//     // signingConfigs {
//     //    release {
//     //        keyAlias keystoreProperties['keyAlias']
//     //        keyPassword keystoreProperties['keyPassword']
//     //        storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
//     //        storePassword keystoreProperties['storePassword']
//     //    }
//     //    debug {
//     //        keyAlias keystoreProperties['keyAlias']
//     //        keyPassword keystoreProperties['keyPassword']
//     //        storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
//     //        storePassword keystoreProperties['storePassword']
//     //     }
//     //     }
//     // buildTypes {
//     //     // release {
//     //     //     // TODO: Add your own signing config for the release build.
//     //     //     // Signing with the debug keys for now, so `flutter run --release` works.
//     //     //     signingConfig = signingConfigs.getByName("debug")
//     //     // }
//     //      release {
//     //        keyAlias keystoreProperties['keyAlias']
//     //        keyPassword keystoreProperties['keyPassword']
//     //        storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
//     //        storePassword keystoreProperties['storePassword']
//     //    }
//     //    debug {
//     //        keyAlias keystoreProperties['keyAlias']
//     //        keyPassword keystoreProperties['keyPassword']
//     //        storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
//     //        storePassword keystoreProperties['storePassword']
//     //     }
//     // }
//     signingConfigs {
//     create("release") {
//         keyAlias = keystoreProperties["keyAlias"] as String
//         keyPassword = keystoreProperties["keyPassword"] as String
//         storeFile = keystoreProperties["storeFile"]?.let { file(it as String) }
//         storePassword = keystoreProperties["storePassword"] as String
//     }
//     create("debug") {
//         keyAlias = keystoreProperties["keyAlias"] as String
//         keyPassword = keystoreProperties["keyPassword"] as String
//         storeFile = keystoreProperties["storeFile"]?.let { file(it as String) }
//         storePassword = keystoreProperties["storePassword"] as String
//     }
// }

// buildTypes {
//     getByName("release") {
//         signingConfig = signingConfigs.getByName("release")
//     }
//     getByName("debug") {
//         signingConfig = signingConfigs.getByName("debug")
//     }
// }

// }

// flutter {
//     source = "../.."
// }
import java.util.Properties // ✅ Fix unresolved reference: util

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// ✅ Load keystore properties from file
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")

if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(keystorePropertiesFile.inputStream())
}

android {
    namespace = "com.unitaqua.unity_labs"
    compileSdk = 34
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.unitaqua.unity_labs"
        // minSdk = flutter.minSdkVersion
        // targetSdk = flutter.targetSdkVersion
                // targetSdk = flutter.targetSdkVersion
        minSdk = 21
        targetSdk = 34
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"]?.toString()
            keyPassword = keystoreProperties["keyPassword"]?.toString()
            storeFile = keystoreProperties["storeFile"]?.toString()?.let { file(it) }
            storePassword = keystoreProperties["storePassword"]?.toString()
        }
        getByName("debug") {
            keyAlias = keystoreProperties["keyAlias"]?.toString()
            keyPassword = keystoreProperties["keyPassword"]?.toString()
            storeFile = keystoreProperties["storeFile"]?.toString()?.let { file(it) }
            storePassword = keystoreProperties["storePassword"]?.toString()
        }
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
        }
        getByName("debug") {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
