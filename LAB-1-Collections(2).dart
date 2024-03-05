void printMapKeysAndValues(Map<dynamic, dynamic> inputMap) {
  inputMap.forEach((key, value) {
    print('Key: $key, Value: $value');
  });
}
void main() {
  Map<String, int> sampleMap = {
    'apple': 5,
    'banana': 3,
    'orange': 8,
  };
  print('Map Keys and Values:');
  printMapKeysAndValues(sampleMap);
}
