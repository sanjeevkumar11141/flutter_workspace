package com.example.appusagedemo

data class AppUsageInfo(
    val appName: String,
    val packageName: String,
    val totalTimeForeground: String, // Formatted total time in foreground
    val firstTimeStamp: Long,         // First time app was used (raw value)
    val lastTimeStamp: Long,          // Last time app was used (raw value)
    val lastTimeUsed: Long,           // Last time the app was actively used (raw value)
    val firstUsedFormatted: String,   // Formatted first time used
    val lastUsedFormatted: String,    // Formatted last time used
    val lastTimeUsedFormatted: String // Formatted last active time used
)


