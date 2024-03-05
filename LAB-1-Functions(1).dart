double calculateAverage(List<num> numbers) {
  if (numbers.isEmpty) {
    throw ArgumentError("The list cannot be empty.");
  }
  num sum = numbers.reduce((value, element) => value + element);
  double average = sum / numbers.length;
  return average;
}
void main() {
  List<num> numberList = [5, 10, 15, 20, 25];
  double result = calculateAverage(numberList);
  print('Average: $result');
}
