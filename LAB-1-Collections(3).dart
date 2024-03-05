List<T> removeDuplicates<T>(List<T> list) {
  Set<T> uniqueItems = Set<T>();
  List<T> result = [];
  for (T item in list) {
    if (uniqueItems.add(item)) {
      result.add(item);
    }
  }
  return result;
}
void main() {
  List<int> numbersWithDuplicates = [1, 2, 3, 1, 4, 2, 5, 6, 3, 7];
  print('Original List: $numbersWithDuplicates');
  List<int> uniqueNumbers = removeDuplicates(numbersWithDuplicates);
  print('List without Duplicates: $uniqueNumbers');
}
