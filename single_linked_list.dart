/*
Linked List

-are not stored at contiguous memory locations
-composed of nodes - entities that store the current element's value and an address reference to the next element
-elements are linked by pointers
-three types: singly, doubly and circular

Here's the formatted table based on the provided data:

| Operation                  | Time Complexity (Singly Linked List) | Time Complexity (Doubly Linked List) | Space Complexity |
|----------------------------|---------------------------------------|---------------------------------------|------------------|
| Accessing by Index         | O(n)                                  | O(n)                                  | O(1)             |
| Insertion at Beginning     | O(1)                                  | O(1)                                  | O(1)             |
| Insertion at End           | O(n)                                  | O(1)                                  | O(1)             |
| Insertion at Given Position| O(n)                                  | O(n)                                  | O(1)             |
| Deletion at Beginning      | O(1)                                  | O(1)                                  | O(1)             |
| Deletion at End            | O(n)                                  | O(1)                                  | O(1)             |
| Deletion at Given Position | O(n)                                  | O(n)                                  | O(1)             |
| Searching                  | O(n)                                  | O(n)                                  | O(1)             |
*/

class Node {
  int? value;
  Node? next;

  Node(int? v, Node? n) {
    this.value = v;
    this.next = n;
  }

  @override
  String toString() {
    return "\nNode-- value: " +
        this.value.toString() +
        ", next: " +
        (next == null ? "null" : next.hashCode.toString());
  }
}

class SingleLinkedList {
  Node? head;

  SingleLinkedList(Node? h) {
    this.head = h;
  }

  String access({required int index}) {
    if (index < 0) {
      return "Invalid index";
    }

    Node? curr = head;

    while (curr != null) {
      if (index == 0) {
        return curr.toString();
      }
      index--;
      curr = curr.next;
    }
    return "Out of index\n";
  }

  void insertAtStart(Node n) {
    n.next = head;
    head = n;
  }

  void insertAtEnd(Node n) {
    Node? curr = head;

    while (curr!.next != null) {
      curr = curr.next;
    }

    curr.next = n;
  }

  void insertAt(int index, Node n) {
    if (index < 0) {
      print("Invalid index");
      return;
    }

    Node? curr = head;

    while (curr != null && index > 1) {
      curr = curr.next;
      index--;
    }

    if (index > 1) {
      print("Out of index\n");
      return;
    }

    try {
      n.next = curr!.next;
      curr.next = n;
    } catch (_) {}
  }

  void deleteAtStart() {
    if (head != null && head!.next != null) {
      head = head!.next;
    }
  }

  void deleteAtEnd() {
    Node? curr = head;
    while (curr!.next!.next != null) {
      curr = curr.next;
    }

    curr.next = null;
  }

  void deleteAt(int index) {
    if (index < 0) {
      print("Invalid index");
      return;
    }

    if (index == 0) {
      deleteAtStart();
      return;
    }

    Node? curr = head;

    while (curr!.next!.next != null && index > 1) {
      curr = curr.next;
      index--;
    }

    if (index > 1) {
      print("Out of index\n");
      return;
    }

    curr.next = curr.next!.next;
  }

  bool contains(int i) {
    Node? curr = head;

    while (curr != null) {
      if (i == curr.value) {
        return true;
      }
      curr = curr.next;
    }
    return false;
  }

  @override
  String toString() {
    String s = "\nSingle Linked List";

    Node? curr = head;

    while (curr != null) {
      s += curr.toString();
      curr = curr.next;
    }
    return s + "\n";
  }
}

void main() {
  //single linked list

  Node n5 = Node(5, null);
  Node n4 = Node(4, n5);
  Node n3 = Node(3, n4);
  Node n2 = Node(2, n3);
  Node n1 = Node(1, n2);
  Node n0 = Node(0, n1);
  Node head = n0;

  final SingleLinkedList singleLinkedList = SingleLinkedList(head);
  print(singleLinkedList);

  //access by index
  print(singleLinkedList.access(index: 4));

  //insert at start
  singleLinkedList.insertAtStart(Node(100, null));
  print(singleLinkedList);

  //insert at end
  singleLinkedList.insertAtEnd(Node(200, null));
  print(singleLinkedList);

  //insert at index
  singleLinkedList.insertAt(5, Node(300, null));
  print(singleLinkedList);

  //delete at start
  singleLinkedList.deleteAtStart();
  print(singleLinkedList);

  //delete at end
  singleLinkedList.deleteAtEnd();
  print(singleLinkedList);

  //delete at index
  singleLinkedList.deleteAt(5);
  print(singleLinkedList);

  //search
  print(singleLinkedList.contains(3));
  print(singleLinkedList.contains(38));
}
