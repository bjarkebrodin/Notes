---
title: Java collections
keywords: 
---

# Collections

## Interfaces of Java Collections

### The `Collection` Interface
A group of objects, no assumptions are made about the order of contents or whether duplicate elements are allowed. Below is part of the collection interface.
```java
public interface Collection<E> extends Iterable<E>
  int size();
  boolean isEmpty();
  boolean add(E e);
  boolean remove(Object o);
  default Stream<E> stream();
  Iterator<E> iterator();
  // Some more stuff...
```
For the full interface go see ; [Collection (Java SE 11 & JDK 11 )](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Collection.html)


### The `List` Interface
An ordered collection (sequence), that is, an indexed list of objects. The user has precise control over where in the list each element is inserted. Lists allow duplicates and null elements. Some implementations of `List` may have operation time proportional with the integer size of the index,`LinkedList` for instance, so it is typically preferable to iterate over the elements by iterator rather than iterating over each element by index.

```java
public interface List<E> extends Collection<E>
  void add(int index, E element);
  E get(int index);
  E remove(int index);
  int indexOf(Object o);
  int lastIndexOf(Object o);
  ListIterator<E> listIterator();
  List<E> subList(int fromIndex, int toIndex);
  // Some more stuff ...
```

Full interface available at ; [List (Java SE 11 & JDK 11 )](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/List.html)

### The `Set` Interface
No duplicate elements allowed, may or may not be ordered, models the mathematical set. Formally this means that there can be no two elements e1, e2 in the same `Set` such that `e1.equals(e2)`.Consequently, there can also only be a single null value. Some implementations prohibit null elements. 
See more ; [Set (Java SE 11 & JDK 11 )](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Set.html)


### The `Queue` Interface
Designed for holding elements prior to processing. Typically elements are ordered in a FIFO pattern (but not necessarily). Queues provide additional insertion, extraction and inspection operations.
```java
public interface Queue<E> extends Collection<E>
  boolean add(E e);   // Throws exception on failure
  boolean offer(E e); // Equivalent to add, but throws no exception.
  E remove();         // Throws exception on failure
  E poll();           // Equivalent to remove, but throws no exception.
  E element();        // Throws exception on failure
  E peek();           // Equivalent to element, but throws no exception.
```
See more ; [Queue (Java SE 11 & JDK 11 )](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Queue.html)


### The `Deque` Interface
Short for "Double Ended Queue". Can be used either as a FIFO queue or a LIFO (Last-in-first-out) stack. New implementation of the legacy `Stack` interface. The idea of the `Deque` is that there is provided easy access to the "ends" of the collection. The traditional interface of the stack is push,pop,peek, `Deque` however, recommends use of new methods, while it does support this legacy interface. Interface is similar to that of the queue, it is however qualified whether the operation should be performed on the head or the tail. A few examples seen below.

```java
public interface Deque<E> extends Queue<E>
  void addFirst(E e);     // Throws exception on failure
  void addLast(E e);      // Throws exception on failure
  boolean offerFirst(E e);// Throws no exception.
  boolean offerLast(E e); // Throws no exception. 
  // Etc....
```

More info ; [Deque (Java SE 11 & JDK 11 )](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Deque.html)


### The `Map` Interface

Maps keys to values. No map can contain duplicate keys, each key can be mapped to at most one value, that value can however be a collection datatype. Maps are also known as dictionaries in previous Java iterations and other programming languages. 

```java
public interface Map<K, V>
  boolean containsKey(Object key);
  boolean containsValue(Object value);
  V get(Object key);
  V put(K key, V value);
  V remove(Object key);
  // And MUCH more...
```

See more ; [Map (Java SE 11 & JDK 11 )](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Map.html)

## Implementations of Java Collections

### `List` Implementations

#### `ArrayList` 
Provides`size, isEmpty, get, set, iterator, listIterator` operations with $O(1)$ time complexity.
Provides an `add` operation with $O(n)$ time complexity where $n$ is the amount of elements being added.
All other operations of the `ArrayList` implementation run roughly in linear time.
The `ArrayList` is backed by an array storing its objects, but always ensures capacity.
See more @ ; [ArrayList (Java SE 11 & JDK 11 )](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/ArrayList.html)

#### `LinkedList`
Typically provides better performance than the `ArrayList` on insertion or deletion. Also implements the `Deque` and `Queue` interfaces.
See more @ ; (https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/LinkedList.html)


<br>

Code ;
These performances tests are a little ad-hoc, but should serve the purpose of illustrating the pattern, they can however be perfected.
<br>

Operation | `ArrayList` | `LinkedList`
-|-|-
Insertion | 657ms | _35ms_
Traversal w. Iterator | 6ms | _3ms_
Traversal by index | _3ms_ | 5548ms
Removal w. Iterator | 706ms | _7ms_
Removal by index | _2ms_ | 5ms

#### Concluding on `List` implementations
When the context or system requires frequent access, removal or traversal by index, it seems plausible that the `ArrayList` will offer the best performance. If however many insertions or deletions are to be processed it seems well worth considering the `LinkedList` implementation. Generally the idea that the `ArrayList` provides good performance for all indexed operations is very cohesive with the its class name, which is nice.


### `Set` Implementations

#### `HashSet`
Described by Oracle as "the best all-round set implementation". 
HashSet makes no guarantees for the ordering of the set, or whether it will change during the lifetime of the instance. 
Provides $O(1)$ operations for `add, remove, contains, size` methods.
Provides $O(n)$ iteration.
More @ ; [HashSet (Java SE 11 & JDK 11 )](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/HashSet.html)

#### `TreeSet`
Ordered implementation of the `Set` interface. 
Elements are ordered by natural order or a `Comparator` can be specified at construction. 
Provides $log(n)$ operations `add, remove, contains`
More ; [TreeSet (Java SE 11 & JDK 11 )](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/TreeSet.html)

#### `LinkedHashSet`
Set implementation that maintains insertion order. 
Note that if an element is reinserted into the set, it will retain the same position as it had before attempting this.
Provides slightly slower operations compared to the regular `HashSet`.
Details ; [LinkedHashSet (Java SE 11 & JDK 11 )](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/LinkedHashSet.html)

<br>

Several more set implementations, such as `EnumSet` do exits, these are however the general purpose implementations.

#### Concluding on the `Set` interface
There a few implementations to choose from, generally the `HashSet`is the default choice, but if ordering is needed the `TreeSet` provides this utility. In situations where maintaining insertion order can be useful the `LinkedHashSet` may prove beneficial.

### `Deque` Implementations
[Deque Implementations (The Java™ Tutorials > Collections > Implementations)](https://docs.oracle.com/javase/tutorial/collections/implementations/deque.html)
#### `ArrayDeque`

Is the go-to implementation for the `Deque` or legacy `Stack` functionality. The `Linked List` implements the `Deque` interface as well, but consumes more memory and offers slower performance.
Details ; [ArrayDeque (Java SE 11 & JDK 11 )](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/ArrayDeque.html)

### `Map` Implementations
The `Map` implementation purposes and specs much mirror those of the `Set` implementations.
[Map Implementations (The Java™ Tutorials > Collections > Implementations)](https://docs.oracle.com/javase/tutorial/collections/implementations/map.html)
#### `HashMap`
If iteration order is irrelevant this is generally the go to implementation. Provides fast performance but do not allow duplicate keys. A `HashMap`can be constructed with a default capacity if it is anticipated that it will store a lot of references, this will improve performance. Many keys with identical hashCodes will slow down the performance.
[HashMap (Java SE 11 & JDK 11 )](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/HashMap.html)

#### `TreeMap`
Sorted by the ordering of keys (natural order or specified by `Comparator`). 
[TreeMap (Java SE 11 & JDK 11 )](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/TreeMap.html)

#### `LinkedHashMap`
Maintains insertion order by keys the same way the `LinkedHashSet` does. 
[LinkedHashMap (Java SE 11 & JDK 11 )](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/LinkedHashMap.html)

#### Concluding on the `Map` implementations

The `HashMap` is generally the default choice unless storage by order is desired. If storage by order is needed depending on which order, either the `LinkedHashMap` or the `TreeMap` can be used instead. Note that the `TreeMap` usually has a higher cost of operation than both the `HashMap` and the `TreeMap`.


## Conclusion

Concluding this exploration of the `Collections` framework of Java, there are several very useful classes for storing objects in collections, if more advanced behaviour than that of an `Object[]` is needed.

If array-like behaviour with added functionality is needed the `List` interface provides a very similar interaction through `ArrayList` and `LinkedList`. The `ArrayList` generally outperforms in traversal and access, where the `LinkedList` excels in deletion and insertion, since the `ArrayList` will have to rearrange itself entirely upon just a single deletion, where the `LinkedList` can simply adjust its references.

If high-performance operations on collections are needed, or the behaviour of a mathematical set, ordered or not, is desired the `Set` interface provides both the unordered, well-performing `HashSet` or the two options for ordered sets, `TreeSet` or `LinkedHashSet`. 

In situations where a `Stack` or a `Queue` is needed, the `Deque` interface provides the needed functionality. The `ArrayDeque` generally being the favourable choice, the `LinkedList` does however also implement this interface, so in any situation where BOTH the `List` and the `Deque` interfaces could be useful on the same collection, this class offers some utility.

If objects are to be stored in Key/Value pairs, the `Map` interface offers some options. The performance and specifications much mirroring those of the `Set` interface, the three general types of `Map`; `HashMap`, `TreeMap` and `LinkedHashMap` provide ordering of the keys in identical manner to their `Set` equivalent. A `Map` can usually be constructed with a loadfactor and an initial capacity, these can affect performance greatly.

