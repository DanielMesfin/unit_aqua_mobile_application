import com.android.build.gradle.BaseExtension
import org.gradle.api.tasks.Delete
import org.gradle.api.file.Directory

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Optional: move build output to a centralized location
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(name)
    layout.buildDirectory.value(newSubprojectBuildDir)
}


// ✅ Correct Kotlin DSL for modifying android config after evaluation
subprojects {
    afterEvaluate {
        if (plugins.hasPlugin("com.android.application") ||
            plugins.hasPlugin("com.android.library")) {

            val androidExtension = extensions.findByName("android")
            if (androidExtension is BaseExtension) {
                androidExtension.compileSdkVersion(34)
                androidExtension.buildToolsVersion("34.0.0")
            }
        }
    }
}

// Ensure the app module is evaluated first
subprojects {
    evaluationDependsOn(":app")
}
// Clean task
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
