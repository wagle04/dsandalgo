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
  Node? prev;
  Node? next;

  Node(int? v, Node? p, Node? n) {
    this.value = v;
    this.prev = p;
    this.next = n;
  }

  @override
  String toString() {
    return "\nNode- " +
        this.hashCode.toString() +
        " value: " +
        this.value.toString() +
        ", prev: " +
        (prev == null ? "null" : prev.hashCode.toString()) +
        ", next: " +
        (next == null ? "null" : next.hashCode.toString());
  }
}

class DoubleLinkedList {
  Node? head;
  Node? tail;

  DoubleLinkedList(Node? h, Node? t) {
    this.head = h;
    this.tail = t;
  }

  String access(int index) {
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

  void insertAtStart(Node? n) {
    head!.prev = n;
    n!.next = head;
    head = n;
    if (n.next == null) {
      tail = n;
    }
  }

  void insertAtEnd(Node? n) {
    n!.prev = tail;
    tail!.next = n;
    tail = n;
  }

  void insertAt(int index, Node? n) {
    if (index < 0) {
      print("Invalid index");
      return;
    }

    Node? curr = head;

    while (curr != null && index > 1) {
      index--;
      curr = curr.next;
    }

    if (index > 1) {
      print("Out of index");
      return;
    }

    try {
      n!.prev = curr;
      n.next = curr!.next;
      curr.next = n;
      if (n.next == null) {
        tail = n;
      }
    } catch (_) {}
  }

  void deleteAtStart() {
    head = head!.next;
    head!.prev = null;
    if (head!.next == null) {
      tail = head;
    }
  }

  Node? deleteAtEnd() {
    Node? temp = tail;
    Node? curr = tail!.prev;
    curr!.next = null;
    tail = curr;
    return temp;
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

    while (curr != null && index > 0) {
      curr = curr.next;
      index--;
    }

    if (index > 0) {
      print("Out of index");
      return;
    }

    try {
      curr = curr!.prev;
      Node? newNode = curr!.next!.next;

      curr.next = newNode;
      newNode!.prev = curr;
      if (newNode.next == null) {
        tail = newNode;
      }
    } catch (_) {}
  }

  bool search(int v) {
    Node? curr = head;

    while (curr != null) {
      if (curr.value == v) {
        return true;
      }
      curr = curr.next;
    }
    return false;
  }

  @override
  String toString() {
    String s = "\nDouble Linked List";

    Node? curr = head;

    while (curr != null) {
      s += curr.toString();
      curr = curr.next;
    }
    return s + "\n";
  }
}

void main() {
  //doubly linked list

  Node n5 = Node(5, null, null);
  Node n4 = Node(4, null, n5);
  n5.prev = n4;
  Node n3 = Node(3, null, n4);
  n4.prev = n3;
  Node n2 = Node(2, null, n3);
  n3.prev = n2;
  Node n1 = Node(1, null, n2);
  n2.prev = n1;
  Node n0 = Node(0, null, n1);
  n1.prev = n0;

  Node head = n0;

  final DoubleLinkedList doubleLinkedList = DoubleLinkedList(head, n5);
  print(doubleLinkedList);

  //access by index
  print(doubleLinkedList.access(3));

  //insert at start
  doubleLinkedList.insertAtStart(Node(100, null, null));
  print(doubleLinkedList);

  //insert at end
  doubleLinkedList.insertAtEnd(Node(200, null, null));
  print(doubleLinkedList);

  //insert at index
  doubleLinkedList.insertAt(9, Node(300, null, null));
  print(doubleLinkedList);

  //delete at start
  doubleLinkedList.deleteAtStart();
  print(doubleLinkedList);

  //delete at end
  doubleLinkedList.deleteAtEnd();
  print(doubleLinkedList);

  //delete at index
  doubleLinkedList.deleteAt(3);
  print(doubleLinkedList);

  //search
  print(doubleLinkedList.search(4));
  print(doubleLinkedList.search(400));
}
