/*

Queue

-FIFO (First In, First Out) model: the first inserted element in the queue is the first element to be removed
-can be implemented using a fixed length array, a circular array or a linked list
-popping/pushing elements or getting the front of the queue is done in constant time. Searching is linear.

--complexity :-   https://devopedia.org/queue-data-structure


*/

import 'doubly_linked_list.dart';

class ArrayQueue {
  late List<int> queue;

  ArrayQueue(List<int> q) {
    this.queue = q;
  }

  void enqueue(int v) {
    //add at end of the array- O(1)
    this.queue.add(v);
  }

  int? dequeue() {
    //remove from first of the array
    if (this.queue.isEmpty) {
      return null;
    }
    return this.queue.removeAt(0);
  }

  int? peek() {
    //peek at index 0
    if (this.queue.isEmpty) {
      return null;
    }
    return this.queue.first;
  }

  int? head() {
    if (this.queue.isEmpty) {
      return null;
    }
    return this.queue.first;
  }

  int? tail() {
    if (this.queue.isEmpty) {
      return null;
    }
    return this.queue.last;
  }

  void clear() {
    this.queue.clear();
  }

  @override
  String toString() {
    return this.queue.toString();
  }
}

class LinkedListQueue {
  late DoubleLinkedList queue;

  LinkedListQueue(DoubleLinkedList q) {
    this.queue = q;
  }

  void enqueue(int v) {
    queue.insertAtStart(Node(v, null, null));
  }

  int? dequeue() {
    final n = queue.deleteAtEnd();
    return n!.value;
  }

  int? peek() {
    return queue.tail!.value;
  }

  void clear() {
    queue = DoubleLinkedList(null, null);
  }

  bool isEmpty() {
    return queue.head == null && queue.tail == null;
  }

  int? head() {
    if (this.isEmpty()) {
      return null;
    } else {
      return this.queue.head!.value;
    }
  }

  int? tail() {
    if (this.isEmpty()) {
      return null;
    } else {
      return this.queue.tail!.value;
    }
  }

  @override
  String toString() {
    return queue.toString();
  }
}

void main() {
  List<int> q = [1, 2, 3, 4, 5];

  final ArrayQueue queue = ArrayQueue(q);

  print("Queue using array----\n");

  //enqueue
  queue.enqueue(100);
  print(queue);
  queue.enqueue(200);
  print(queue);

  //dequeue
  queue.dequeue();
  print(queue);
  queue.dequeue();
  print(queue);

  //peek
  print(queue.peek());

  //head
  print(queue.head());

  //tail
  print(queue.tail());

  //clear
  queue.clear();
  print(queue);

  print("Queue using linked list ----\n");

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

  final LinkedListQueue llQueue = LinkedListQueue(DoubleLinkedList(head, n5));

  //enqueue
  llQueue.enqueue(100);
  print(llQueue);
  llQueue.enqueue(200);
  print(llQueue);

  //dequeue
  llQueue.dequeue();
  print(llQueue);
  llQueue.dequeue();
  print(llQueue);

  //peek
  print(llQueue.peek());

  //head
  print(llQueue.head());

  //tail
  print(llQueue.tail());

  //clear
  llQueue.clear();
  print(llQueue);
}
