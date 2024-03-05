void parseAndPrint(String input) {
  try {
    int parsedValue = int.parse(input);
    print('Parsed value: $parsedValue');
  } catch (e) {
    if (e is FormatException) {
      print('Error: Input is not a valid integer.');
    } else {
      rethrow;
    }
  }
}
void main() {
  parseAndPrint('123');  
  parseAndPrint('abc');  
}
