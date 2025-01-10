import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.appusagedemo.AppUsageInfo
import com.example.appusagedemo.R

class AppUsageAdapter(private val appUsageList: List<AppUsageInfo>) :
    RecyclerView.Adapter<AppUsageAdapter.AppUsageViewHolder>() {

    // ViewHolder class to hold the views for each item
    class AppUsageViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val appNameTextView: TextView = view.findViewById(R.id.appNameTextView)
        val foregroundTimeTextView: TextView = view.findViewById(R.id.foregroundTimeTextView)
        val firstUsedTextView: TextView = view.findViewById(R.id.firstUsedTextView)
        val lastUsedTextView: TextView = view.findViewById(R.id.lastUsedTextView)
        val lastTimeUsedTextView: TextView = view.findViewById(R.id.lastTimeUsedTextView)
    }

    // Create new views (invoked by the layout manager)
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): AppUsageViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_app_usage, parent, false)
        return AppUsageViewHolder(view)
    }

    // Bind the app usage data to the views
    override fun onBindViewHolder(holder: AppUsageViewHolder, position: Int) {
        val appUsageInfo = appUsageList[position]

        // Bind data to the views
        holder.appNameTextView.text = appUsageInfo.appName
        holder.foregroundTimeTextView.text = "Total Time in Foreground: ${appUsageInfo.totalTimeForeground}"
        holder.firstUsedTextView.text = "First Used: ${appUsageInfo.firstUsedFormatted}"
        holder.lastUsedTextView.text = "Last Used: ${appUsageInfo.lastUsedFormatted}"
        holder.lastTimeUsedTextView.text = "Last Active Time: ${appUsageInfo.lastTimeUsedFormatted}"
    }

    // Return the total number of items in the list
    override fun getItemCount() = appUsageList.size
}
