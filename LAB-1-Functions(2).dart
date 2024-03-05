double calculateAverage(List<double> numbers) {
  if (numbers.isEmpty) {
    throw ArgumentError("The list cannot be empty.");
  }
  double average = numbers.reduce((a, b) => a + b) / numbers.length;
  return average;
}
void main() {
  List<double> numberList = [5.0, 10.0, 15.0, 20.0, 25.0];
  double result = calculateAverage(numberList);
  print('Average: $result');
}
