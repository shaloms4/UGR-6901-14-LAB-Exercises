import kotlin.random.Random

fun main() {
    val passwordLength = 8 
    val password = generateRandomPassword(passwordLength)
    println("Generated Password: $password")
}

fun generateRandomPassword(length: Int): String {
    val passwordChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_=+<>?[]{}|"
    val password = StringBuilder()

    repeat(length) {
        val randomIndex = Random.nextInt(passwordChars.length)
        val randomChar = passwordChars[randomIndex]
        password.append(randomChar)
    }

    return password.toString()
}
