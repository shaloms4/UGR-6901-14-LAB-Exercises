fun main() {
    val originalPrice = 100.0
    var discountPercentage = 0.6 
    val threshold = 0.5 
    var finalPrice: Double

    if (discountPercentage > threshold) {
        println("Warning: The discount percentage is too high. Adjusting to $threshold")
        discountPercentage = threshold
    }
    
    finalPrice = originalPrice * (1 - discountPercentage)

    println("Original Price: $originalPrice")
    println("Discount Percentage: ${(discountPercentage * 100)}%")
    println("Final Price after Discount: $finalPrice")
}
