Future<int> fetchNumber() async {
  await Future.delayed(Duration(seconds: 2));
  return 42;
}
void main() async {
  print('Start of main function');
  int result = await fetchNumber();
  print('Result: $result');
  print('End of main function');
}
