package com.example.composedemofordelete

import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier

@Composable
fun ButtonComposable(onUpdateStudent: (Student) -> Unit) {
    Button(onClick = {
        val newStudent = Student(
            name = "Vijay",
            course = "MCA",
            address = "Noida",
            fee = 1000.0
        )
        onUpdateStudent(newStudent)
    }) {
        Text(text = "Change Student Data")
    }
}