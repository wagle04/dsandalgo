/*
Stacks

-LIFO (Last In, First Out)
-can be implemented using arrays or linked lists

Time Complexity:
-Access Nth element : O(1) is array is used
-push : O(1)
-pop : O(1)
-top : O(1)
-search : O(n)
*/

class Stack {
  //original stack is reversed i.e. last element of array is top of stack
  //to make remove and add time complexity O(1)
  List<int>? stack;

  Stack(List<int> s) {
    this.stack = s;
  }

  void push(int i) {
    this.stack!.add(i);
  }

  int pop() {
    return this.stack!.removeLast();
  }

  int top() {
    return this.stack!.last;
  }

  int access(int index) {
    int len = this.stack!.length - 1;

    if (index < 0) {
      print("Invalid index");
      return -1;
    }

    if (index > len) {
      print("Out of index");
      return -1;
    }

    return this.stack![len - index];
  }

  bool search(int i) {
    int len = this.stack!.length - 1;

    while (len > -1) {
      if (this.stack![len] == i) {
        return true;
      }
      len--;
    }
    return false;
  }

  @override
  String toString() {
    return this.stack.toString();
  }
}

void main() {
  List<int> s = [1, 2, 3, 4, 5];

  Stack stack = Stack(s);

  //access top element
  print(stack.top());
  print(stack);

  //pop top element
  print(stack.pop());
  print(stack);

  //add element
  stack.push(6);
  print(stack);

  //access element at m
  print(stack.access(1));

  //search
  print(stack.search(1));
  print(stack.search(5));
}
