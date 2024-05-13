fun main() {
    val strings = listOf("hello", "world", "kotlin")
    val numbers = listOf(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
    
    val uppercaseList = uppercaseStrings(strings)
    println("Uppercase Strings: $uppercaseList")
    
    val filteredNumbers = filterNumbersGreaterThanValue(numbers, 5)
    println("Numbers greater than 5: $filteredNumbers")
    
    val sum = calculateSum(numbers)
    println("Sum of all numbers: $sum")
}

fun uppercaseStrings(strings: List<String>): List<String> {
    return strings.map { it.toUpperCase() }
}

fun filterNumbersGreaterThanValue(numbers: List<Int>, threshold: Int): List<Int> {
    return numbers.filter { it > threshold }
}

fun calculateSum(numbers: List<Int>): Int {
    return numbers.reduce { acc, num -> acc + num }
}
