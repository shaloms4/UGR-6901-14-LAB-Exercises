fun analyzeString(input: String): Triple<Int, Int, Int> {
    var wordCount = 0
    var uppercaseCount = 0
    var vowelCount = 0

    for (char in input) {
        if (char.isLetter()) {
            if (char.isUpperCase()) {
                uppercaseCount++
            }
            if (char in "AEIOUaeiou") {
                vowelCount++
            }
        }
    }

    val words = input.split("\\s+".toRegex())
    wordCount = words.size

    return Triple(wordCount, uppercaseCount, vowelCount)
}

fun main() {
    val inputString = "Hello Kotlin."
    val (wordCount, uppercaseCount, vowelCount) = analyzeString(inputString)
    
    println("Number of words: $wordCount")
    println("Number of uppercase letters: $uppercaseCount")
    println("Number of vowels: $vowelCount")
}
