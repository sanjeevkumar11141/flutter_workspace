package com.example.compositionlocalproviderdemo

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.runtime.compositionLocalOf
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import com.example.compositionlocalproviderdemo.ui.theme.CompositionLocalProviderDemoTheme

val LocalAppState = compositionLocalOf { "Default State" }

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            CompositionLocalProviderDemoTheme {
                Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
                    MyApp(modifier = Modifier.padding(innerPadding))
                }
            }
        }
    }
}

@Composable
fun MyApp(modifier: Modifier = Modifier) {
    var globalState by remember { mutableStateOf("Initial Global State") }

    CompositionLocalProvider(LocalAppState provides globalState) {
        Column (modifier = modifier){
            Text("Parent Composable: ${LocalAppState.current}")
            Button(onClick = { globalState = "Updated Global State" }) {
                Text("Update Global State")
            }
            MyChildComposable()
        }
    }
}

@Composable
fun MyChildComposable() {
    Text(text = "Child Composable: ${LocalAppState.current}")
}


@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    CompositionLocalProviderDemoTheme {
       // Greeting("Android")
    }
}