package com.example.videocapturefaceangledemo

import android.Manifest
import android.content.pm.PackageManager
import android.os.Bundle
import android.util.Log
import android.util.Size
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import androidx.annotation.OptIn
import androidx.appcompat.app.AppCompatActivity
import androidx.camera.core.*
import androidx.camera.lifecycle.ProcessCameraProvider
import androidx.camera.video.*
import androidx.camera.view.PreviewView
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.lifecycle.LifecycleOwner
import com.google.mlkit.vision.common.InputImage
import com.google.mlkit.vision.face.Face
import com.google.mlkit.vision.face.FaceDetection
import com.google.mlkit.vision.face.FaceDetector
import com.google.mlkit.vision.face.FaceDetectorOptions
import java.io.File
import java.text.SimpleDateFormat
import java.util.*

class MainActivity : AppCompatActivity() {

    private lateinit var viewFinder: PreviewView
    private lateinit var instructionText: TextView
    private lateinit var buttonStartCapture: Button
    private var videoCapture: VideoCapture<Recorder>? = null
    private lateinit var faceDetector: FaceDetector
    private lateinit var outputDirectory: File
    private var frontFaceDetected = false
    private var leftFaceDetected = false
    private var rightFaceDetected = false
    private var activeRecording: Recording? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        viewFinder = findViewById(R.id.viewFinder)
        instructionText = findViewById(R.id.instructionText)
        buttonStartCapture = findViewById(R.id.buttonStartCapture)
        outputDirectory = getOutputDirectory()

        buttonStartCapture.setOnClickListener {
            startVideoCapture()
        }

        startCamera()
        setupFaceDetector()
    }

    private fun startCamera() {
        val cameraProviderFuture = ProcessCameraProvider.getInstance(this)

        cameraProviderFuture.addListener(Runnable {
            val cameraProvider: ProcessCameraProvider = cameraProviderFuture.get()
            val preview = Preview.Builder().build().also {
                it.setSurfaceProvider(viewFinder.surfaceProvider)
            }

            val recorder = Recorder.Builder()
                .setQualitySelector(QualitySelector.from(Quality.HIGHEST))
                .build()
            videoCapture = VideoCapture.withOutput(recorder)

            val cameraSelector = CameraSelector.DEFAULT_FRONT_CAMERA

            try {
                cameraProvider.unbindAll()
                cameraProvider.bindToLifecycle(
                    this as LifecycleOwner, cameraSelector, preview, videoCapture)
            } catch (exc: Exception) {
                Log.e(TAG, "Use case binding failed", exc)
            }

        }, ContextCompat.getMainExecutor(this))
    }

    private fun setupFaceDetector() {
        faceDetector = FaceDetection.getClient(
            FaceDetectorOptions.Builder()
                .setPerformanceMode(FaceDetectorOptions.PERFORMANCE_MODE_ACCURATE)
                .setLandmarkMode(FaceDetectorOptions.LANDMARK_MODE_ALL)
                .setClassificationMode(FaceDetectorOptions.CLASSIFICATION_MODE_ALL)
                .build()
        )
    }

    private fun startVideoCapture() {
        val videoCapture = videoCapture ?: return

        val videoFile = File(
            outputDirectory,
            SimpleDateFormat(FILENAME_FORMAT, Locale.US)
                .format(System.currentTimeMillis()) + ".mp4")

        val outputOptions = FileOutputOptions.Builder(videoFile).build()

        if (ActivityCompat.checkSelfPermission(
                this,
                Manifest.permission.RECORD_AUDIO
            ) != PackageManager.PERMISSION_GRANTED
        ) {
            // TODO: Consider calling
            //    ActivityCompat#requestPermissions
            // here to request the missing permissions, and then overriding
            //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
            //                                          int[] grantResults)
            // to handle the case where the user grants the permission. See the documentation
            // for ActivityCompat#requestPermissions for more details.
            return
        }
        activeRecording = videoCapture.output
            .prepareRecording(this, outputOptions)
            .withAudioEnabled()
            .start(ContextCompat.getMainExecutor(this)) { recordEvent ->
                when (recordEvent) {
                    is VideoRecordEvent.Start -> {
                        instructionText.text = "Recording started"
                        analyzeVideoStream()
                    }
                    is VideoRecordEvent.Finalize -> {
                        if (!recordEvent.hasError()) {
                            instructionText.text = "Recording successfully finished"
                        } else {
                            instructionText.text = "Recording failed: ${recordEvent.error}"
                        }
                    }
                }
            }
    }

    private fun analyzeVideoStream() {
        val imageAnalyzer = ImageAnalysis.Builder()
            .setTargetResolution(Size(1280, 720))
            .setBackpressureStrategy(ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST)
            .build()

        imageAnalyzer.setAnalyzer(ContextCompat.getMainExecutor(this)) { imageProxy ->
            processImageProxy(imageProxy)
        }

        ProcessCameraProvider.getInstance(this).get().bindToLifecycle(
            this, CameraSelector.DEFAULT_FRONT_CAMERA, imageAnalyzer)
    }

    @OptIn(ExperimentalGetImage::class)
    private fun processImageProxy(imageProxy: ImageProxy) {
        val mediaImage = imageProxy.image
        if (mediaImage != null) {
            val image = InputImage.fromMediaImage(mediaImage, imageProxy.imageInfo.rotationDegrees)
            detectFaces(image) { faces ->
                if (faces.isNotEmpty()) {
                    for (face in faces) {
                        if (!frontFaceDetected && isFrontFace(face)) {
                            frontFaceDetected = true
                            showToast("Front face detected")
                            instructionText.text = "Turn slightly to the left"
                        } else if (!leftFaceDetected && isLeftFace(face)) {
                            leftFaceDetected = true
                            showToast("Left face detected")
                            instructionText.text = "Turn slightly to the right"
                        } else if (!rightFaceDetected && isRightFace(face)) {
                            rightFaceDetected = true
                            showToast("Right face detected")
                            stopVideoCapture()
                            instructionText.text = "All angles captured"
                        }
                    }
                }
            }
        }
        imageProxy.close()
    }

    private fun stopVideoCapture() {
        activeRecording?.stop()
    }

    private fun detectFaces(image: InputImage, onFaceDetected: (List<Face>) -> Unit) {
        faceDetector.process(image)
            .addOnSuccessListener { faces ->
                onFaceDetected(faces)
            }
            .addOnFailureListener { e ->
                e.printStackTrace()
            }
    }

    private fun isFrontFace(face: Face): Boolean {
        return face.headEulerAngleY in -10f..10f
    }

    private fun isLeftFace(face: Face): Boolean {
        return face.headEulerAngleY > 10f
    }

    private fun isRightFace(face: Face): Boolean {
        return face.headEulerAngleY < -10f
    }

    private fun showToast(message: String) {
        Toast.makeText(this, message, Toast.LENGTH_SHORT).show()
    }

    private fun getOutputDirectory(): File {
        val mediaDir = externalMediaDirs.firstOrNull()?.let {
            File(it, resources.getString(R.string.app_name)).apply { mkdirs() }
        }
        return if (mediaDir != null && mediaDir.exists()) mediaDir else filesDir
    }

    companion object {
        private const val TAG = "CameraXApp"
        private const val FILENAME_FORMAT = "yyyy-MM-dd-HH-mm-ss-SSS"
    }
}




