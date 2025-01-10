package com.example.composedemofordelete

import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable

@Composable
fun CourseComposable() {
    val student = LocalStudent.current
    Text(text = "Course: ${student.course}", style = MaterialTheme.typography.bodyMedium)

}