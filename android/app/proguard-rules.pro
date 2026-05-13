# Flutter
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Play Core deferred components — optional, not used
-dontwarn com.google.android.play.core.**

# audio_service
-keep class com.ryanheise.audioservice.AudioServicePlugin { *; }
-keep class com.ryanheise.audioservice.AudioService { *; }

# just_audio
-keep class com.ryanheise.justaudio.** { *; }

# audio_session
-keep class com.ryanheise.audiosession.** { *; }

# Drift / SQLite
-keep class com.simplitz.** { *; }
-dontwarn com.simplitz.**

# flutter_secure_storage
-keep class com.it_nomads.fluttersecurestorage.** { *; }

# Connectivity
-keep class dev.fluttercommunity.plus.connectivity.** { *; }

# Keep native methods
-keepclasseswithmembernames,includedescriptorclasses class * { native <methods>; }

# Keep models used via reflection
-keep class * implements com.google.gson.** { *; }
