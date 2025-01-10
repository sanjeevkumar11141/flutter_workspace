package com.example.appusagedemo

import AppUsageAdapter
import android.app.AppOpsManager
import android.app.usage.UsageStatsManager
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.provider.Settings
import android.text.Editable
import android.text.TextWatcher
import android.util.Log
import android.widget.EditText
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale


class AppUsageActivity : AppCompatActivity() {

    private lateinit var recyclerView: RecyclerView
    private lateinit var appUsageAdapter: AppUsageAdapter
    private val appUsageList = ArrayList<AppUsageInfo>()
    private val filteredAppUsageList = ArrayList<AppUsageInfo>() // Filtered list for search
    private lateinit var searchBar: EditText
    private lateinit var swipeRefreshLayout: SwipeRefreshLayout


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
        setContentView(R.layout.activity_app_usage)

        // Set up the RecyclerView
        recyclerView = findViewById(R.id.recyclerView)
        recyclerView.layoutManager = LinearLayoutManager(this)
        appUsageAdapter = AppUsageAdapter(filteredAppUsageList) // Use the filtered list in the adapter
        recyclerView.adapter = appUsageAdapter

        // Set up the SwipeRefreshLayout for pull-to-refresh
        swipeRefreshLayout = findViewById(R.id.swipeRefreshLayout)
        swipeRefreshLayout.setOnRefreshListener {
            // Refresh the app usage stats when pulled to refresh
            displayAppUsageStats(this)
        }

        // Set up the search bar
        searchBar = findViewById(R.id.searchBar)
        searchBar.addTextChangedListener(object : TextWatcher {
            override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {}

            override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {}

            override fun afterTextChanged(s: Editable?) {
                filterAppList(s.toString()) // Filter the list based on user input
            }
        })

        // Request usage stats permission
        requestUsageStatsPermission(this)

        // Check if the permission is granted
        if (hasUsageStatsPermission(this)) {
            // Query app usage statistics and display it
            displayAppUsageStats(this)
        } else {
            Log.e("UsageStats", "Permission not granted.")
        }
    }

    // Function to query usage stats and display total foreground time
    private fun displayAppUsageStats(context: Context) {
        val usageStatsManager = context.getSystemService(Context.USAGE_STATS_SERVICE) as UsageStatsManager
        val currentTime = System.currentTimeMillis()
        val startTime = currentTime - 1000 * 60 * 60 * 24 // Last 24 hours

        // Get usage stats for all apps in the last 24 hours
        val statsList = usageStatsManager.queryUsageStats(
            UsageStatsManager.INTERVAL_DAILY, startTime, currentTime
        )

       // Log.d("TAG", "displayAppUsageStats: ${statsList.toString()}")

        if (statsList != null && statsList.isNotEmpty()) {
            appUsageList.clear() // Clear the old data
            filteredAppUsageList.clear()

            for (usageStats in statsList) {
                Log.d("RawData", "Raw UsageStats Data: $usageStats")

                Log.d("RawData", """
                Package Name: ${usageStats.packageName}
                Last Time Stamp (Raw): ${usageStats.lastTimeStamp} 
                Last Time Used (Raw): ${usageStats.lastTimeUsed}
                Total Time in Foreground (Raw): ${usageStats.totalTimeInForeground} ms
            """.trimIndent())

                // For Android Q and above, extract the additional fields if available
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                    Log.d("RawData", """
                    Total Time Visible (Raw): ${usageStats.totalTimeVisible} ms
                    Last Time Foreground Service Used (Raw): ${usageStats.lastTimeForegroundServiceUsed}
                    Total Time Foreground Service Used (Raw): ${usageStats.totalTimeForegroundServiceUsed}
                """.trimIndent())
                }

                val packageName = usageStats.packageName
                val totalTimeInForeground = usageStats.totalTimeInForeground
                val firstTimeStamp = usageStats.firstTimeStamp
                val lastTimeStamp = usageStats.lastTimeStamp
                val lastTimeUsed = usageStats.lastTimeUsed

                // Convert time in milliseconds to hours, minutes, and seconds
                val totalTimeFormatted = formatMillisecondsToReadableTime(totalTimeInForeground)

                // Convert timestamps to readable date formats
                val firstUsedFormatted = formatTimestampToReadableDate(firstTimeStamp)
                val lastUsedFormatted = formatTimestampToReadableDate(lastTimeStamp)
                val lastTimeUsedFormatted = formatTimestampToReadableDate(lastTimeUsed)

                // Get the app name from the package name
                val appName = getAppNameFromPackageName(context, packageName)

                // Add to the list
                val appUsageInfo = AppUsageInfo(
                    appName = appName,
                    packageName = packageName,
                    totalTimeForeground = totalTimeFormatted,
                    firstTimeStamp = firstTimeStamp,
                    lastTimeStamp = lastTimeStamp,
                    lastTimeUsed = lastTimeUsed,
                    firstUsedFormatted = firstUsedFormatted,
                    lastUsedFormatted = lastUsedFormatted,
                    lastTimeUsedFormatted = lastTimeUsedFormatted
                )
                appUsageList.add(appUsageInfo)
                filteredAppUsageList.add(appUsageInfo)
            }

            // Notify the adapter that the data has changed
            appUsageAdapter.notifyDataSetChanged()

        } else {
            Log.d("UsageStats", "No stats available")
        }

        // Stop the refresh animation once the data is loaded
        swipeRefreshLayout.isRefreshing = false
    }



    // Function to filter the app list based on the search query
    private fun filterAppList(query: String) {
        filteredAppUsageList.clear()
        if (query.isEmpty()) {
            filteredAppUsageList.addAll(appUsageList) // If no query, show the full list
        } else {
            val lowerCaseQuery = query.toLowerCase(Locale.getDefault())
            for (appUsage in appUsageList) {
                if (appUsage.appName.toLowerCase(Locale.getDefault()).contains(lowerCaseQuery)) {
                    filteredAppUsageList.add(appUsage)
                }
            }
        }
        appUsageAdapter.notifyDataSetChanged() // Notify adapter of changes
    }

    private fun formatTimestampToReadableDate(timestamp: Long): String {
        val sdf = SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault())
        val date = Date(timestamp)
        return sdf.format(date)
    }


    // Function to format milliseconds to hours, minutes, and seconds
    private fun formatMillisecondsToReadableTime(milliseconds: Long): String {
        val seconds = (milliseconds / 1000) % 60
        val minutes = (milliseconds / (1000 * 60)) % 60
        val hours = (milliseconds / (1000 * 60 * 60)) % 24

        return String.format("%02d hours %02d minutes %02d seconds", hours, minutes, seconds)
    }

    // Function to get app name from package name
    private fun getAppNameFromPackageName(context: Context, packageName: String): String {
        return try {
            val packageManager = context.packageManager
            val applicationInfo = packageManager.getApplicationInfo(packageName, 0)
            packageManager.getApplicationLabel(applicationInfo).toString()
        } catch (e: PackageManager.NameNotFoundException) {
            packageName // If app name is not found, return the package name
        }
    }
}