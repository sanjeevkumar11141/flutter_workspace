package com.example.composedemofordelete

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import com.example.composedemofordelete.ui.theme.ComposeDemoForDeleteTheme


import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface

import androidx.compose.runtime.CompositionLocalProvider

import androidx.compose.ui.unit.dp
import androidx.compose.runtime.compositionLocalOf
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue

val LocalStudent = compositionLocalOf<Student> { error("No Student provided") }

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            ComposeDemoForDeleteTheme {
                // Provide the Student data
                var student by remember { mutableStateOf(
                    Student(
                        name = "John Doe",
                        course = "Computer Science",
                        address = "123 Main St",
                        fee = 1500.0
                    )
                )}

                CompositionLocalProvider(LocalStudent provides student) {
                    Surface(color = MaterialTheme.colorScheme.background) {
                        StudentScreen(
                            onUpdateStudent = { newStudent ->
                                student = newStudent
                            }
                        )
                    }
                }
            }
        }
    }
}

@Composable
fun StudentScreen(onUpdateStudent: (Student) -> Unit) {
    Column(modifier = Modifier.padding(16.dp)) {
        NameComposable()
        AddressComposable()
        FeeComposable()
        ButtonComposable(onUpdateStudent)
    }
}

@Composable
fun NameComposable() {
    val student = LocalStudent.current
    Text(text = "Name: ${student.name}", style = MaterialTheme.typography.bodyMedium)
    CourseComposable()
}



@Composable
fun AddressComposable() {
    val student = LocalStudent.current
    Text(text = "Address: ${student.address}", style = MaterialTheme.typography.bodyMedium)
}

@Composable
fun FeeComposable() {
    val student = LocalStudent.current
    Text(text = "Fee: \$${student.fee}", style = MaterialTheme.typography.bodyMedium)
}

data class Student(
    val name: String,
    val course: String,
    val address: String,
    val fee: Double
)