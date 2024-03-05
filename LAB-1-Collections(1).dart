int findHighestNumber(List<int> numbers) {
  if (numbers.isEmpty) {
    throw ArgumentError("The list cannot be empty.");
  }
  int highestNumber = numbers.reduce((a, b) => a > b ? a : b);
  return highestNumber;
}
void main() {
  List<int> numberList = [5, 10, 15, 20, 25];
  int result = findHighestNumber(numberList);
  print('Highest Number: $result');
}
