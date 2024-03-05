void exampleFunction(bool throwError) {
  try {
    if (throwError) {
      throw Exception('An error occurred!');
    }
    print('Code inside try block');
  } catch (e) {
    print('Caught an exception: $e');
  } finally {
    print('Code inside finally block');
  }
}
void main() {
  print('Example 1:');
  exampleFunction(false);  
  print('\nExample 2:');
  exampleFunction(true);   
}
