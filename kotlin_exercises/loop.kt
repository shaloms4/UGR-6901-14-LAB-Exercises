fun main() {
    println("Enter a string: ")
    val input = readLine() ?: ""

    if (input.isNotEmpty()) {
        var minChar = input[0]
        var maxChar = input[0]

        for (char in input) {
            if (char < minChar) {
                minChar = char
            }
            if (char > maxChar) {
                maxChar = char
            }
        }

        println("Minimum character: $minChar")
        println("Maximum character: $maxChar")
    } else {
        println("Input string is empty.")
    }
}
