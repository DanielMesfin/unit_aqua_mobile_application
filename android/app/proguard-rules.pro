-keep class com.pichillilorenzo.flutter_inappwebview_android.** { *; }
# This is generated automatically by the Android Gradle plugin.
-dontwarn android.window.BackEvent
-keep class android.window.** { *; }


# Keep flutter_inappwebview
-keep class com.github.andrewoma.dexter.** { *; }
-keep class com.pichillilorenzo.flutter_inappwebview.** { *; }

# Keep Flutter classes
-keep class io.flutter.** { *; }

# Keep classes used by Firebase
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**
# other 
# Please add these rules to your existing keep rules in order to suppress warnings.
# This is generated automatically by the Android Gradle plugin.
-dontwarn com.google.j2objc.annotations.ReflectionSupport$Level
-dontwarn com.google.j2objc.annotations.ReflectionSupport
-dontwarn com.google.j2objc.annotations.RetainedWith
-keep class com.google.android.play.core.splitcompat.SplitCompatApplication { *; }
-keep class com.google.android.play.core.splitinstall.SplitInstallException { *; }
-keep class com.google.android.play.core.splitinstall.SplitInstallManager { *; }
#new 
-dontwarn com.google.android.play.core.**
-keep class com.google.android.play.core.** { *; }
