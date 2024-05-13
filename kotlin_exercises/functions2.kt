fun findMax(numbers: List<Int>): Int? {
    if (numbers.isEmpty()) return null
    
    var max = numbers[0]
    for (number in numbers) {
        if (number > max) {
            max = number
        }
    }
    return max
}

fun filterEvenNumbers(numbers: List<Int>): List<Int> {
    return numbers.filter { it % 2 == 0 }
}

fun calculateAverage(numbers: List<Double>): Double {
    if (numbers.isEmpty()) return 0.0
    
    var sum = 0.0
    for (number in numbers) {
        sum += number
    }
    return sum / numbers.size
}

fun main() {
    val numbers = listOf(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
    val doubles = listOf(1.5, 2.5, 3.5, 4.5, 5.5)
    
    println("Maximum value in the list: ${findMax(numbers)}")
    println("List of even numbers: ${filterEvenNumbers(numbers)}")
    println("Average value of elements in the list: ${calculateAverage(doubles)}")
}
