void throwErrorFunction() {
  throw Exception('An error occurred!');
}
void main() {
  try {
    throwErrorFunction();
  } catch (e) {
    print('Caught an exception: $e');
  } finally {
    print('Finally block executed');
  }
}
