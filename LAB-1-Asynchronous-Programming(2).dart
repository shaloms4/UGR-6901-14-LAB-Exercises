Future<int> fetchNumber() {
  return Future.delayed(Duration(seconds: 2), () => 42);
}
void main() {
  print('Start of main function');
  fetchNumber().then((result) {
    print('Result: $result');
    print('End of main function');
  });
  print('Executing code while waiting for the Future to complete');
}
