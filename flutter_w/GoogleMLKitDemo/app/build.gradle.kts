plugins {
    alias(libs.plugins.android.application)
    alias(libs.plugins.jetbrains.kotlin.android)
}

android {
    namespace = "com.example.googlemlkitdemo"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.example.googlemlkitdemo"
        minSdk = 24
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
    kotlinOptions {
        jvmTarget = "1.8"
    }
}

dependencies {

    implementation(libs.androidx.core.ktx)
    implementation(libs.androidx.appcompat)
    implementation(libs.material)
    implementation(libs.androidx.activity)
    implementation(libs.androidx.constraintlayout)
    testImplementation(libs.junit)
    androidTestImplementation(libs.androidx.junit)
    androidTestImplementation(libs.androidx.espresso.core)

//    implementation "androidx.core:core-ktx:1.10.0"
//    implementation "androidx.appcompat:appcompat:1.6.1"
//    implementation "com.google.android.material:material:1.9.0"
//    implementation "androidx.activity:activity-ktx:1.7.2"

    implementation ("com.google.mlkit:text-recognition:16.0.0")
    implementation ("com.google.android.gms:play-services-mlkit-text-recognition:19.0.0")

    implementation ("com.google.mlkit:face-detection:16.1.6")
    implementation ("com.google.android.gms:play-services-mlkit-face-detection:17.1.0")

    implementation ("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.6.4")

}