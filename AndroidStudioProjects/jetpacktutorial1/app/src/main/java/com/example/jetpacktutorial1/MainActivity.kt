package com.example.jetpacktutorial1

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MyApp {
                MessageCard("Android")
            }
        }
    }
}

@Composable
fun MyApp(content: @Composable () -> Unit) {
    MaterialTheme {
        // A surface container using the 'background' color from the theme
        Surface {
            content()
        }
    }
}

@Composable
fun MessageCard(name: String) {
    Text(text = "Hello $name!")
}

@Preview(showBackground = true)
@Composable
fun PreviewMessageCard() {
    MyApp {
        MessageCard("Android")
    }
}
