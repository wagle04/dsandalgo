/*

In hashing, large keys are converted into small keys by using hash functions. The values are then stored in a data structure called hash table. 
The idea of hashing is to distribute entries (key/value pairs) uniformly across an array. Each element is assigned a key (converted key). 
By using that key you can access the element in O(1) time. Using the key, the algorithm (hash function) computes an index that suggests where an entry can be found or inserted.

Hashing is implemented in two steps:

1.An element is converted into an integer by using a hash function. This element can be used as an index to store the original element, which falls into the hash table.
2.The element is stored in the hash table where it can be quickly retrieved using hashed key.

To achieve a good hashing mechanism, It is important to have a good hash function with the following basic requirements:

Easy to compute: It should be easy to compute and must not become an algorithm in itself.

Uniform distribution: It should provide a uniform distribution across the hash table and should not result in clustering.

Less collisions: Collisions occur when pairs of elements are mapped to the same hash value. These should be avoided.


Collision resolution techniques:-
1) In open hashing/separate chaining, each element of the hash table is a linked list. the linked list is extended as new entries comes.
2) In closed hashing, instead of in linked lists, all entry records are stored in the array itself. no extension as new entries comes. when collison
occurs, next empty slot is searched. three types
  i) linear : H(key,i)=(Hash(key)+i)modTableSize
  ii) quadrtic: H(key,i)=(Hash(key)+c1⋅i+c2⋅i^2)modTableSize
  iii) double hashing: H(key,i)=(Hash1(key)+i⋅Hash2(key))modTableSize

https://www.educative.io/answers/hash-table-collision-resolution


*/

class HashMap {
  late List<String?> _values;

  HashMap(int size) {
    _values = List.generate(size, (index) => null);
  }

  int _hash(String key) {
    return key.length;
  }

  set(String key) {
    int index = _hash(key);
    if (_values[index] == null) {
      _values[index] = key;
    } else {
      print("Collision\n");
    }
  }

  String? get(String key) {
    int index = _hash(key);
    return _values[index];
  }

  bool contains(String key) {
    int index = _hash(key);
    return _values[index] != null;
  }

  List<String> keys() {
    List<String> result = [];
    for (String? s in _values) {
      if (s != null) {
        result.add(s);
      }
    }
    return result;
  }
}

void main() {
  HashMap hashMap = HashMap(10);

  //add to hash map
  hashMap.set("a");
  print(hashMap.keys());

  //add to hash map
  hashMap.set("ab");
  print(hashMap.keys());

  //add to hash map
  hashMap.set("abc");
  print(hashMap.keys());

//collision
  hashMap.set("abd");
  print(hashMap.keys());

//contains
  print(hashMap.contains("ab"));

  print(hashMap.get("ab"));
}
