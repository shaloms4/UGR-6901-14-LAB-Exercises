package com.example.jetpacktutorial2

import androidx.compose.runtime.Composable
import androidx.compose.ui.tooling.preview.Preview

@Composable
fun messageScreen() {
    MessageCard(Message("Android", "Jetpack Compose is awesome!"))
}

@Preview
@Composable
fun PreviewMessageScreen() {
    messageScreen()
}
