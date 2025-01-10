package com.example.googlemlkitdemo

import android.Manifest
import android.net.Uri
import android.os.Bundle
import androidx.activity.result.ActivityResultLauncher
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat
import androidx.core.content.PermissionChecker
import android.widget.Button
import android.widget.ImageView
import android.widget.Toast
import androidx.core.content.FileProvider
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.Build
import android.util.Log
import androidx.lifecycle.lifecycleScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.File
import java.io.InputStream

class MainActivity : AppCompatActivity() {

    private lateinit var pickImageLauncher: ActivityResultLauncher<String>
    private lateinit var captureImageLauncher: ActivityResultLauncher<Uri>
    private lateinit var imageUri: Uri
    private lateinit var gallery_image_view: ImageView
    private lateinit var camera_image_view: ImageView

    var cameraBitMap: Bitmap? = null
    var galleryBitmap: Bitmap? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        gallery_image_view = findViewById(R.id.gallery_image_view)
        camera_image_view = findViewById(R.id.camera_image_view)
        val buttonPickImage: Button = findViewById(R.id.button_pick_image)
        val buttonCaptureImage: Button = findViewById(R.id.button_capture_image)
        val buttonCompare: Button = findViewById(R.id.button_compare)

        buttonCompare.setOnClickListener {
            compareImage()
        }

        // Initialize pickImageLauncher
        pickImageLauncher = registerForActivityResult(ActivityResultContracts.GetContent()) { uri: Uri? ->
            uri?.let {
                gallery_image_view.setImageURI(it)
                galleryBitmap = uriToBitmap(it)
            }
        }

        // Initialize captureImageLauncher
        captureImageLauncher = registerForActivityResult(ActivityResultContracts.TakePicture()) { success: Boolean ->
            if (success) {
                Log.d("TAG", "Image captured: $imageUri")
                camera_image_view.setImageURI(imageUri)
                cameraBitMap = uriToBitmap(imageUri) // Set the captured image bitmap
                Log.d("TAG", "Bitmap created: $cameraBitMap")
            } else {
                Log.d("TAG", "Image capture failed")
            }
        }

        // Button to pick image from gallery
        buttonPickImage.setOnClickListener {
            if (hasStoragePermission()) {
                pickImageLauncher.launch("image/*")
            } else {
                requestStoragePermissionLauncher.launch(getStoragePermission())
            }
        }

        // Button to capture image from camera
        buttonCaptureImage.setOnClickListener {
            if (hasCameraPermission()) {
                imageUri = createImageUri()
                Log.d("TAG", "Image URI created: $imageUri")
                captureImageLauncher.launch(imageUri)
            } else {
                requestCameraPermissionLauncher.launch(Manifest.permission.CAMERA)
            }
        }
    }

    private fun createImageUri(): Uri {
        val imageFile = File(getExternalFilesDir(null), "IMG_${System.currentTimeMillis()}.jpg")
        return FileProvider.getUriForFile(this, "${applicationContext.packageName}.fileprovider", imageFile)
    }

    private fun hasStoragePermission(): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            ContextCompat.checkSelfPermission(this, Manifest.permission.READ_MEDIA_IMAGES) == PermissionChecker.PERMISSION_GRANTED
        } else {
            ContextCompat.checkSelfPermission(this, Manifest.permission.READ_EXTERNAL_STORAGE) == PermissionChecker.PERMISSION_GRANTED
        }
    }

    private fun getStoragePermission(): String {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            Manifest.permission.READ_MEDIA_IMAGES
        } else {
            Manifest.permission.READ_EXTERNAL_STORAGE
        }
    }

    private fun hasCameraPermission() = ContextCompat.checkSelfPermission(
        this, Manifest.permission.CAMERA
    ) == PermissionChecker.PERMISSION_GRANTED

    private val requestStoragePermissionLauncher = registerForActivityResult(
        ActivityResultContracts.RequestPermission()
    ) { isGranted: Boolean ->
        if (isGranted) {
            pickImageLauncher.launch("image/*")
        } else {
            Toast.makeText(this, "Storage permission denied", Toast.LENGTH_SHORT).show()
        }
    }

    private val requestCameraPermissionLauncher = registerForActivityResult(
        ActivityResultContracts.RequestPermission()
    ) { isGranted: Boolean ->
        if (isGranted) {
            imageUri = createImageUri()
            captureImageLauncher.launch(imageUri)
        } else {
            Toast.makeText(this, "Camera permission denied", Toast.LENGTH_SHORT).show()
        }
    }

    private fun uriToBitmap(uri: Uri): Bitmap? {
        return try {
            val inputStream: InputStream? = contentResolver.openInputStream(uri)
            BitmapFactory.decodeStream(inputStream)
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }

    fun compareImage() {
        lifecycleScope.launch {
            val result = withContext(Dispatchers.IO) {
                // Ensure both bitmaps are not null before calling compareFaces
                if (cameraBitMap != null && galleryBitmap != null) {
                    compareFaces(cameraBitMap!!, galleryBitmap!!)
                } else {
                    Log.d("TAG", "Bitmaps are null")
                    false
                }
            }
            withContext(Dispatchers.Main) {
                // Ensure result is not null before passing to Toast
                Toast.makeText(this@MainActivity, "Comparison result: $result", Toast.LENGTH_LONG).show()
            }
        }
    }


}
