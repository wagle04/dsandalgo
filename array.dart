/*
Array

-continuous block of memory


Time complexity:
- Access: O(1)
- Search: O(n)
- Insertion: O(n)
- Deletion: O(n)
- Insertion at the end: O(1)
- Deletion at the end: O(1)

*/

void main() {
  final List<int> arr = [1, 2, 3, 4, 5];

  //access
  print(arr[2]);

  //search
  print(arr.contains(3));

  //insertion
  arr.insert(3, 5);
  print(arr);

  //deletion
  arr.remove(3);
  print(arr);

  //inseration at end
  arr.add(7);
  print(arr);

  //deletion at end;
  arr.removeLast();
  print(arr);
}
