/*

Graphs

A graph is a non-linear data structure representing a pair of two sets: G={V, E}, where V is the set of vertices (nodes), and E the set of edges (arrows). 
Nodes are values interconnected by edges - lines that depict the dependency (sometimes associated with a cost/distance) between two nodes.
 There are two main types of graphs: directed and undirected. In an undirected graph, the edge (x, y) is available in both directions: (x, y) and (y, x). 
 In a directed graph, the edge (x, y) is called an arrow and the direction is given by the order of the vertices in its name: arrow (x, y) is different from arrow (y, x).

-the degree of a node in an undirected graph is the number of its incident edges;
-the internal/external degree of a node in a directed graph is the number of arrows that direct to/from that node;
-a chain from node x to node y is a succesion of adjacent edges, with x as its left extremity and y as its right;
-a cycle is a chain were x=y; a graph can be cyclic/acyclic; a graph is connected if there is a chain between any two nodes from V;
-a graph can be traversed and processed using Breadth First Search (BFS) or Depth First Search (DFS), both done in O(|V|+|E|), where |S| is the cardinal of the set S; Check the links below for other essential info in graph theory.


Here are the two most common ways to represent a graph :

Adjacency Matrix
Adjacency List


*/

import 'dart:collection';

class Node {
  late int _node;
  Node(int n) {
    this._node = n;
  }
  int node() => _node;

  @override
  String toString() {
    return "N${_node.toString()}";
  }

  @override
  bool operator ==(Object other) {
    if (other is Node) {
      return this._node == other._node;
    }
    return false;
  }
}

class Edge {
  late Node _source;
  late Node _destination;

  Edge(Node n1, Node n2) {
    this._source = n1;
    this._destination = n2;
  }

  @override
  String toString() {
    return "E ${_source.toString()}->${_destination.toString()}";
  }

  @override
  bool operator ==(Object other) {
    if (other is Edge) {
      return (this._source == other._source &&
              this._destination == other._destination) ||
          (this._source == other._destination &&
              this._destination == other._source);
    }
    return false;
  }
}

class Graph {
  late HashSet<Node> _nodes;
  late HashSet<Edge> _edges;
  late HashMap<Node, HashSet<Node>> _adjacentList;
  late HashMap<Node, int> _adjacentMatrixIndex;
  late List<List<int>> _adjacentMatrix;

  Graph(HashSet<Node> n, HashSet<Edge> e) {
    this._nodes = n;
    this._edges = e;

    _adjacentList = HashMap();
    _adjacentMatrixIndex = HashMap();

    int i = 0;
    for (Node x in this._nodes) {
      _adjacentMatrixIndex[x] = i;
      i++;
    }

    createAdjacentMatrix(this._nodes.length);

    for (Edge e in this._edges) {
      addEdgeToAdjacentList(e);
      addEdgeToAdjacentMatrix(e);
    }
  }

  void createAdjacentMatrix(int l) {
    _adjacentMatrix =
        List<List<int>>.generate(l, (index) => List<int>.generate(l, (i) => 0));
  }

  void addEdgeToAdjacentMatrix(Edge e) {
    int x = _adjacentMatrixIndex[e._source]!;
    int y = _adjacentMatrixIndex[e._destination]!;

    _adjacentMatrix[x][y] = 1;
    _adjacentMatrix[y][x] = 1;
  }

  String printAdjacentMatrix() {
    String s = "\nAdjacent Matrix-\n  ";
    s += this._adjacentMatrixIndex.keys.toString() + "\n";
    for (int i = 0; i < this._adjacentMatrix.length; i++) {
      s += this._adjacentMatrixIndex.keys.toList()[i].toString() +
          this._adjacentMatrix[i].toString() +
          "\n";
    }

    return s;
  }

  void addEdgeToAdjacentList(Edge e) {
    Node s = e._source;
    Node d = e._destination;

    if (_adjacentList[s] == null) {
      _adjacentList[s] = HashSet.from([d]);
    } else {
      _adjacentList[s]!.add(d);
    }

    if (_adjacentList[d] == null) {
      _adjacentList[d] = HashSet.from([s]);
    } else {
      _adjacentList[d]!.add(s);
    }
  }

  void removeEdgeFromAdjacentList(Edge e) {
    Node s = e._source;
    Node d = e._destination;

    _adjacentList[s]!.remove(d);
    _adjacentList[d]!.remove(s);
  }

  bool containsNode(Node n) {
    for (Node x in this._nodes) {
      if (n == x) {
        return true;
      }
    }
    return false;
  }

  bool containsEdge(Edge e) {
    for (Edge x in this._edges) {
      if (e == x) {
        return true;
      }
    }
    return false;
  }

  void addNode(Node n) {
    if (!containsNode(n)) {
      this._nodes.add(n);
      this._adjacentList[n] = HashSet();
    }
  }

  void addEdge(Edge e) {
    if (!containsEdge(e)) {
      this._edges.add(e);
      addEdgeToAdjacentList(e);
    }
  }

  void removeEdge(Edge e) {
    removeEdgeFromAdjacentList(e);

    for (Edge x in this._edges) {
      if (x == e) {
        this._edges.remove(x);
        break;
      }
    }
  }

  void removeNode(Node n) {
    for (Node x in this._nodes) {
      if (x == n) {
        this._nodes.remove(x);
        break;
      }
    }

    List<Edge> edgesWithNodes = [];

    for (Edge e in this._edges) {
      if (e._source == n || e._destination == n) {
        edgesWithNodes.add(e);
      }
    }

    for (Edge e in edgesWithNodes) {
      removeEdge(e);
    }

    this._adjacentList.remove(n);
  }

  String printAdjcentList() {
    String s = "Adjacent List-\n";

    for (final x in _adjacentList.keys) {
      s += x.toString() + "--[";
      for (final y in _adjacentList[x]!) {
        s += y.toString() + " ";
      }
      s += "]\n";
    }

    return s;
  }

  @override
  String toString() {
    String s = "\nGraph\nNodes-\n";

    for (Node n in _nodes) {
      s += n.toString() + "\n";
    }
    s += "Edges-\n";
    for (Edge e in _edges) {
      s += e.toString() + "\n";
    }

    return s + printAdjcentList() + printAdjacentMatrix();
  }
}

void main() {
  Node n1 = Node(1);
  Node n2 = Node(2);
  Node n3 = Node(3);
  Node n4 = Node(4);
  Node n5 = Node(5);

  HashSet<Node> nodes = HashSet.from([n1, n2, n3, n4, n5]);
  HashSet<Edge> edges = HashSet.from([
    Edge(n1, n2),
    Edge(n1, n5),
    Edge(n2, n5),
    Edge(n3, n4),
    Edge(n2, n3),
  ]);

  Graph graph = Graph(nodes, edges);

  print(graph);

  //add node
  Node n6 = Node(6);
  graph.addNode(n6);
  graph.addEdge(Edge(n6, n2));
  graph.addEdge(Edge(n6, n1));
  graph.addEdge(Edge(n6, n3));
  print(graph);

  graph.removeEdge(Edge(n6, n2));
  print(graph);

  graph.removeNode(n6);
  print(graph);

  BFS(graph, n5);

  DFS(graph, n5);
}

void BFS(Graph g, Node startNode) {
  print("BFS traversing----\n");
  List<Node> visitedList = [];

  DoubleLinkedQueue<Node> queue = DoubleLinkedQueue<Node>();

  queue.add(startNode);

  Node currentNode = startNode;

  while (queue.isNotEmpty) {
    currentNode = queue.first;
    HashSet<Node>? childNodes = g._adjacentList[currentNode];
    if (childNodes != null) {
      for (Node n in childNodes) {
        if (!contains(visitedList, n) && !contains(queue.toList(), n)) {
          queue.add(n);
        }
      }
    }
    Node visitedNode = queue.removeFirst();
    visitedList.add(visitedNode);
    print(visitedNode);
  }
}

void DFS(Graph g, Node startNode) {
  print("\nDFS traversing----\n");
  List<Node> visitedList = [];

  Stack stack = Stack([]);

  Node currentNode = startNode;
  stack.push(currentNode);

  while (stack.isNotEmpty()) {
    currentNode = stack.pop();
    HashSet<Node>? childNodes = g._adjacentList[currentNode];
    if (childNodes != null) {
      for (Node n in childNodes) {
        if (!contains(visitedList, n) && !contains(stack.stack, n)) {
          stack.push(n);
        }
      }
    }
    visitedList.add(currentNode);
    print(currentNode);
  }
}

bool contains(var list, Node n) {
  for (Node x in list) {
    if (x == n) {
      return true;
    }
  }

  return false;
}

class Stack {
  //original stack is reversed i.e. last element of array is top of stack
  //to make remove and add time complexity O(1)
  List<Node>? stack;

  Stack(List<Node> s) {
    this.stack = s;
  }

  void push(Node i) {
    this.stack!.add(i);
  }

  Node pop() {
    return this.stack!.removeLast();
  }

  Node top() {
    return this.stack!.last;
  }

  Node? access(int index) {
    int len = this.stack!.length - 1;

    if (index < 0) {
      print("Invalid index");
      return null;
    }

    if (index > len) {
      print("Out of index");
      return null;
    }

    return this.stack![len - index];
  }

  bool search(Node i) {
    int len = this.stack!.length - 1;

    while (len > -1) {
      if (this.stack![len] == i) {
        return true;
      }
      len--;
    }
    return false;
  }

  bool isNotEmpty() {
    return this.stack!.length != 0;
  }

  @override
  String toString() {
    return this.stack.toString();
  }
}
