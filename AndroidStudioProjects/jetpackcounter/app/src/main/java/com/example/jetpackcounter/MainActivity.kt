import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.layout.Column
import androidx.compose.material.Button
import androidx.compose.material.Text
import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            CounterApp()
        }
    }
}

@Composable
fun CounterApp() {
    var count by remember { mutableStateOf(0) }

    Column(
        modifier = Modifier.fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Text(
            text = count.toString(),
            modifier = Modifier.padding(bottom = 16.dp),
            textAlign = TextAlign.Center,
            color = Color.Black,
            fontSize = 32.dp
        )
        Row {
            CounterButton(text = "-") { count-- }
            CounterButton(text = "+") { count++ }
        }
        Spacer(modifier = Modifier.height(16.dp))
        Button(onClick = { count = 0 }) {
            Text(text = "Reset")
        }
    }
}

@Composable
fun CounterButton(text: String, onClickAction: () -> Unit) {
    Button(onClick = onClickAction, modifier = Modifier.padding(horizontal = 8.dp)) {
        Text(text = text)
    }
}
