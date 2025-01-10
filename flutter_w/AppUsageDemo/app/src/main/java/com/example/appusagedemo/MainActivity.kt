package com.example.appusagedemo

import android.app.usage.UsageEvents
import android.app.usage.UsageStats
import android.app.usage.UsageStatsManager
import android.content.Context
import android.os.Bundle
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import java.text.SimpleDateFormat
import java.util.*

import android.app.AppOpsManager
import android.content.Intent
import android.os.Build
import android.provider.Settings
import android.widget.Toast

class MainActivity : AppCompatActivity() {

    fun hasUsageStatsPermission(context: Context): Boolean {
        val appOps = context.getSystemService(Context.APP_OPS_SERVICE) as AppOpsManager
        val mode = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            appOps.unsafeCheckOpNoThrow(AppOpsManager.OPSTR_GET_USAGE_STATS, android.os.Process.myUid(), context.packageName)
        } else {
            appOps.checkOpNoThrow(AppOpsManager.OPSTR_GET_USAGE_STATS, android.os.Process.myUid(), context.packageName)
        }
        return mode == AppOpsManager.MODE_ALLOWED
    }

    fun requestUsageStatsPermission(context: Context) {
        if (!hasUsageStatsPermission(context)) {
            Toast.makeText(context, "Please enable Usage Access for this app", Toast.LENGTH_LONG).show()
            val intent = Intent(Settings.ACTION_USAGE_ACCESS_SETTINGS)
            context.startActivity(intent)
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Request usage stats permission
        requestUsageStatsPermission(this)

        // Check if the permission is granted
        if (hasUsageStatsPermission(this)) {
            // Query app usage statistics and events
            queryUsageStats(this)
            queryUsageEvents(this)
        } else {
            Log.e("UsageStats", "Permission not granted.")
        }
    }

    // Query UsageStats data
    private fun queryUsageStats(context: Context) {
        val usageStatsManager = context.getSystemService(Context.USAGE_STATS_SERVICE) as UsageStatsManager
        val currentTime = System.currentTimeMillis()
        val startTime = currentTime - 1000 * 60 * 60 * 24 // Last 24 hours

        val statsList = usageStatsManager.queryUsageStats(
            UsageStatsManager.INTERVAL_DAILY, startTime, currentTime
        )

        if (statsList != null && statsList.isNotEmpty()) {
            for (usageStats in statsList) {
                val packageName = usageStats.packageName
                val totalTimeInForeground = usageStats.totalTimeInForeground
                val lastTimeUsed = usageStats.lastTimeUsed

                Log.d("UsageStats", "Package: $packageName, Total Time: $totalTimeInForeground ms, Last Used: $lastTimeUsed")
            }
        } else {
            Log.d("UsageStats", "No stats available")
        }
    }

    // Query UsageEvents data
    private fun queryUsageEvents(context: Context) {
        val usageStatsManager = context.getSystemService(Context.USAGE_STATS_SERVICE) as UsageStatsManager
        val currentTime = System.currentTimeMillis()
        val startTime = currentTime - 1000 * 60 * 60 * 24 // Last 24 hours

        val usageEvents = usageStatsManager.queryEvents(startTime, currentTime)
        val event = UsageEvents.Event()

        while (usageEvents.hasNextEvent()) {
            usageEvents.getNextEvent(event)

            val eventType = when (event.eventType) {
                UsageEvents.Event.MOVE_TO_FOREGROUND -> "MOVE_TO_FOREGROUND"
                UsageEvents.Event.MOVE_TO_BACKGROUND -> "MOVE_TO_BACKGROUND"
                UsageEvents.Event.ACTIVITY_RESUMED -> "ACTIVITY_RESUMED"
                UsageEvents.Event.ACTIVITY_PAUSED -> "ACTIVITY_PAUSED"
                UsageEvents.Event.CONFIGURATION_CHANGE -> "CONFIGURATION_CHANGE"
                UsageEvents.Event.SHORTCUT_INVOCATION -> "SHORTCUT_INVOCATION"
                else -> "OTHER"
            }

            Log.d("UsageEvents", "Event: $eventType, Package: ${event.packageName}, Time: ${event.timeStamp}, Class: ${event.className}")
        }
    }
}
