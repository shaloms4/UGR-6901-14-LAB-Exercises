fun main() {
    val distanceValueKm = 20.0 
    val unitFrom = "kilometers"
    val unitTo = "miles"
    val distanceValueMiles = convertKmToMiles(distanceValueKm)
    println("$distanceValueKm $unitFrom is equal to $distanceValueMiles $unitTo")
}
fun convertKmToMiles(km: Double): Double {
    return km * 0.621371
}
