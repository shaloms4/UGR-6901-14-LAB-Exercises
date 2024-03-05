void main() {
  int n = 10; 
  int first = 0;
  int second = 1;
  print('Fibonacci Sequence (first $n numbers):');
  for (int i = 0; i < n; i++) {
    print(first);
    int next = first + second;
    first = second;
    second = next;
  }
}
