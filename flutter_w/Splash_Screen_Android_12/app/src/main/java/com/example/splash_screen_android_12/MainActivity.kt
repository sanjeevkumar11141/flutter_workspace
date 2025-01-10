package com.example.splash_screen_android_12

import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.view.View
import android.view.ViewTreeObserver
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.splashscreen.SplashScreen
import androidx.core.splashscreen.SplashScreen.Companion.installSplashScreen
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)


       /* val splashScreen: SplashScreen = installSplashScreen()
        // Delay the transition for 3 seconds
        splashScreen.setOnExitAnimationListener {
            Handler(Looper.getMainLooper()).postDelayed({
                // Your code to transition to the main content
                // For example, you can start a new activity or show a fragment
                 val intent = Intent(this,HomeActivity::class.java)
                startActivity(intent)
            }, 3000)
        }*/
        //splashScreen.setKeepOnScreenCondition{ true }




        setContentView(R.layout.activity_main)

        val content: View = findViewById(android.R.id.content)
        content.viewTreeObserver.addOnPreDrawListener(
            object : ViewTreeObserver.OnPreDrawListener {
                override fun onPreDraw(): Boolean {
                    // Check whether the initial data is ready.
                 return true
                }
            }
        )


    }
}