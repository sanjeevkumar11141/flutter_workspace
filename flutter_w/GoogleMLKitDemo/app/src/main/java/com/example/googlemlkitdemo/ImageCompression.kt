package com.example.googlemlkitdemo

import android.graphics.Bitmap
import android.graphics.Rect
import android.util.Log
import com.google.mlkit.vision.common.InputImage
import com.google.mlkit.vision.face.Face
import com.google.mlkit.vision.face.FaceDetection
import com.google.mlkit.vision.face.FaceDetectorOptions
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import com.google.android.gms.tasks.Task
import kotlinx.coroutines.suspendCancellableCoroutine
import kotlin.coroutines.resume
import kotlin.coroutines.resumeWithException

suspend fun compareFaces(image1: Bitmap, image2: Bitmap): Boolean {
    // Create face detector options
    val options = FaceDetectorOptions.Builder()
        .setPerformanceMode(FaceDetectorOptions.PERFORMANCE_MODE_ACCURATE)
        .build()
    val detector = FaceDetection.getClient(options)

    // Create InputImage instances
    val inputImage1 = InputImage.fromBitmap(image1, 0)
    val inputImage2 = InputImage.fromBitmap(image2, 0)

    // Detect faces in both images
    val faces1 = withContext(Dispatchers.IO) {
        detector.process(inputImage1).await()
    }
    val faces2 = withContext(Dispatchers.IO) {
        detector.process(inputImage2).await()
    }

    // Assuming one face per image
    val face1 = faces1.firstOrNull()
    val face2 = faces2.firstOrNull()

    return if (face1 != null && face2 != null) {
        // Basic comparison based on bounding box similarity
        val similarityThreshold = 0.8 // Adjust threshold as needed
        val boundingBoxSimilarity = calculateBoundingBoxSimilarity(face1.boundingBox, face2.boundingBox)
        boundingBoxSimilarity >= similarityThreshold
    } else {
        Log.e("FaceComparison", "No faces found in one or both images")
        false // No faces found in one or both images
    }
}

private fun calculateBoundingBoxSimilarity(box1: Rect, box2: Rect): Double {
    // Calculate intersection area
    val intersectionWidth = minOf(box1.right, box2.right) - maxOf(box1.left, box2.left)
    val intersectionHeight = minOf(box1.bottom, box2.bottom) - maxOf(box1.top, box2.top)
    val intersectionArea = if (intersectionWidth > 0 && intersectionHeight > 0) {
        intersectionWidth * intersectionHeight
    } else {
        0
    }

    // Calculate union area
    val unionArea = box1.width() * box1.height() + box2.width() * box2.height() - intersectionArea

    // Calculate similarity based on intersection over union (IoU)
    return if (unionArea == 0) {
        0.0
    } else {
        intersectionArea.toDouble() / unionArea
    }
}

suspend fun <T> Task<T>.await(): T = suspendCancellableCoroutine { continuation ->
    addOnCompleteListener { task ->
        if (task.isSuccessful) {
            continuation.resume(task.result)
        } else {
            continuation.resumeWithException(task.exception ?: Exception("Unknown task exception"))
        }
    }
}

// Usage example (make sure this runs in a coroutine scope)
/*
val result = compareFaces(bitmap1, bitmap2)
Log.d("FaceComparison", "Are faces similar? $result")
*/
