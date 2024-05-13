fun main() {
    println("Enter the first number:")
    val number1 = readLine()?.toDoubleOrNull()
    
    println("Enter the second number:")
    val number2 = readLine()?.toDoubleOrNull()
    
    if (number1 == null || number2 == null) {
        println("Invalid input. Please enter valid numbers.")
        return
    }
    
    println("Enter the operation (addition, subtraction, multiplication, division):")
    val operation = readLine()?.toLowerCase()
    
    val result = when (operation) {
        "addition" -> number1 + number2
        "subtraction" -> number1 - number2
        "multiplication" -> number1 * number2
        "division" -> {
            if (number2 == 0.0) {
                println("Error: Division by zero.")
                return
            }
            number1 / number2
        }
        else -> {
            println("Invalid operation. Please enter a valid operation.")
            return
        }
    }
    
    println("Result: $result")
}
