# ─────────────────────────────────────────────
#  Flutter Core & Engine Rules
# ─────────────────────────────────────────────
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.provider.** { *; }
-keep class io.flutter.plugins.** { *; }

# Keep Flutter entry points
-keep class * implements io.flutter.plugin.common.MethodChannel$MethodCallHandler { *; }
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

# ─────────────────────────────────────────────
#  Hive & Local Storage Protection
# ─────────────────────────────────────────────
-keep class com.dexterous.flutterlocalnotifications.** { *; }
-keep class io.realm.** { *; }
-keep class com.hive.** { *; }

# ─────────────────────────────────────────────
#  Networking & Dio / OkHttp / Retrofit Rules
# ─────────────────────────────────────────────
-keepattributes Signature, InnerClasses, EnclosingMethod, Annotation, Exceptions, RuntimeVisibleAnnotations
-dontwarn okhttp3.**
-dontwarn okio.**
-dontwarn javax.annotation.**
-dontwarn org.conscrypt.**

-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-keep class okio.** { *; }

# Preserve JSON models from being stripped/renamed
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}

# ─────────────────────────────────────────────
#  App Safety & Stacktrace Preservation
# ─────────────────────────────────────────────
-keepattributes SourceFile, LineNumberTable
-renamesourcefileattribute SourceFile

-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# ─────────────────────────────────────────────
#  Additional Obfuscation Rules
# ─────────────────────────────────────────────
# Keep classes annotated with @Keep to avoid reflection issues
-keep @androidx.annotation.Keep class * { *; }

# Preserve method and field annotations (useful for JSON serialization, etc.)
-keepattributes *Annotation*,Signature,EnclosingMethod
