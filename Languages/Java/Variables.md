---
title: Java variables
keywords: 
---

# Java Variables

Java has three variable types; local, instance and static, Java has two groups of data types : primitive and non-primitive ( or complex )

Type | Default Value | Default Size | Explanation | Wrapper
-----|---------------|--------------|------------|-
boolean | false | 1 bit | Can assume either true or false | Boolean
char | '/u0000' | 2 byte | 16-bit unicode character in '/u0000' to '/uffff' or { 0, 1, ... , 65535 } | Character
byte | 0 | 1 byte | 8-bit signed integer in { -128, -127, ... , 127 } | Integer
short | 0 | 2 byte | 16-bit signed integer in { -32768, -32767, ... , 32767 } | Integer
int | 0 | 4 byte | 32-bit signed integer in { -2^31, -2^31 + 1 , ... , 2^31 - 1 } | Integer
long | 0L | 8 byte | 64-bit signed integer in { -2^63, -2^63 + 1 , ... , 2^63 -1 } | Integer
float | 0.0f | 4 byte | 32-bit single precision floating point, do not use for precise values
double | 0.0d | 8 byte | 64-bit double precision floating point, do not use for precise values | Double

## Integer Literals
Using a _literal_ in your code, means typing the value directly, using integer literals can be done as seen below.
```java
int decimal     = 42;
int hexaDecimal = 0x2A;
int binary      = 0b101010;
```

## Float Literals
```java
double d1 = 123.4;
double d2 = 1.234e2;
float  f1 = 123.4f;
```

## Character and String Literals
Any UTF-16(Unicode) characters may be used in `String` and `char` literals. Wherever impossible to use a character due to IDE/system limitations use unicode escape `\u`
```java
String si = "S\u00ED";
char i = '\u00ED';
```
### Escape sequences
Sequence | Description
-|-
`\u` | Unicode
`\b` | Backspace
`\t` | Tab
`\n` | Line feed (newline)
`\f` | Form feed
`\r` | Carriage return
`\"` | Double quote
`\'` | Singe quote
`\\` | Backslash

## Underscore
Underscores can be used to separate digits in numeric literals, examples : 
```java
long creditCardNumber = 1234_5678_9012_3456L;
long socialSecurityNumber = 999_99_9999L;
float pi =  3.14_15F;
long hexBytes = 0xFF_EC_DE_5E;
long hexWords = 0xCAFE_BABE;
long maxLong = 0x7fff_ffff_ffff_ffffL;
byte nybbles = 0b0010_0101;
long bytes = 0b11010010_01101001_10010100_10010010;
```

but proper use excludes :
- At the beginning or end of a number
- Adjacent to a decimal point in a floating point literal
- Prior to an F or L suffix
- In positions where a string of digits is expected

source [Oracle Tutorial](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html)

## Class literals and null

`null` is a special case literal that can be used in place of any reference type (non-primitive). 

A class literal is any string prepended to `.class`, the class literal is used to access the object that holds the class itself. e.g. `String.class` will refer to the `Class` object that represents the `String` type.

## Variable Kinds

### Local Variables

A *local variable* is declared in the body of a method, and as such, is 'local' to the method, this means it is only visible and defined within the method scope, local variables cannot be defined with "static" keyword
```java
static void method() {
  // Local variable saywhat
  String saywhat = "Whaaa";
  System.out.println(saywhat);
}
```

### Instance Variables

An *instance variable* is declared outside the body of the method, an instance is not declared as static.
Instance variables are called instance variables because they are instance specific, meaning they are not shared across instances of the class
```java
class Tutorial{
    
    public static void main(String[] args){
        System.out.println("Java Tutorial");
    }
    
    int instanceVariable = 42;
}
```

### Static Variables

A Static variable is declared with the static keyword, a Static variable cannot be local.
Memory allocation happens only once, when the class is loaded into memory at runtime.
```java
class Tutorial {
    public static void main(String[] args) {
        System.out.println("Java Tutorial");
        String Message = Integer.toString(staticVariable);
        System.out.println(Message);
    }
    static int staticVariable = 42;
}
```

## Parameter Variables

parameter variables are variables that can be passed to a method, the parameter will be destroyed once it falls out of scope (after method execution), unless references for it is held elsewhere.

```java
method do(int times){
    while(times-- > 0) //Do stuff
}
```

## Array 
An array is a fixed size, indexed list of objects :
- An array can hold any type of object
- The values of an array can be accessed by index

```java
// Initialization
int[] numbers = new int[5]
int[] numbers = new int[]{1,2,3,4,5};

// Access/use 
numbers[0] // -> 1
numbers.length // -> 5
```

if declared by size the array will hold default values :
Type | default value
-|-
`int` | `0`
`boolean` | `false`
`double` | `0.0`
`? extends Object` | `null`

When using arrays a frequent error is using invalid indices, this must be handled with care.


## Multidimensional Arrays
Multidimensional arrays are handy for representing multidimensional data. They are the programming equivalent of matrices. 

```java
int[][] squareMatrix = new int[2][2];

int[][] picture = {
  {255, 185},
  {100,   0}
};
```
we can define functions that filter a picture, e.g. an inversion filter : 

$let \, picture \, P=
\begin{pmatrix}
  a & b \\
  c & d
\end{pmatrix}$

$inv(P) = -1 \begin{pmatrix}
  a & b \\
  c & d
\end{pmatrix} +
\begin{pmatrix}
  255 & 255 \\
  255 & 255
\end{pmatrix}$

We can program this as :

```java
int[][] invertPixels(int[][] img){
  for(int y = 0; y < img.length; y++){
    for(int x = 0; x < img[y].length; x++){
      img[y][x] = -1*img[y][x]+255;
    }
  }
  return img;
}
```

<!-- Multidim arrays eksempel : -->
<!-- Pixels i et billede -->

### Jagged Arrays

Jagged arrays can be used if we have an array of arrays of different sizes. When we initialize a multidimensional array we omit specifying the size of the inner arrays, which will then be initialized to `null` we can then later specify an autonomously sized array of items for each row

```java
int[][] SWUStudents = new int[3][];
System.out.println(SWUStudents[0]); // -> null

SWUStudents[0] = new String[]{"Hans", "Grete"};
SWUStudents[1] = new String[]{"Jens"};
SWUStudents[2] = new String[]{"Line", "Morten", "Peter"};
```

<!-- Jagged arrays eksempel : --> 
<!-- Folk på årgange af softwareudvikling -->

## Arrays vs. Collections
#### Syntax
Arrays offer a cleaner syntax, especially for multiple dimensions
```java
myArray[x][y]
myArrayList.get(x).get(y)
```
Lists offer prebuilt functionality, which can provide cleaner syntax for other frequent operations such as `.contains()` & `.remove()`

#### Specs
Parameter | Array | Collection
-|-|-
**Size**  | fixed | dynamic
**Memory** | inflexible | flexible
**Performance** | fast | not as fast
**Stores Primitives** | Yes | No
**Interface** | Minimal | Extensive

## Static Arrays methods


`Arrays.fill(T[] arr, T val)`
Will fill an array with a specified value, handy if a different value that the default is useful to have at all indices. 


`Arrays.sort(T[] arr, null | Comparator<? extends T>)` & (`parallelSort()`)
Will sort the array based on specified `Comparator` or natural ordering.


`Arrays.asList(T[] arr)`
Will return a fixed size `List` element backed by the passed array. containing the same elements as the array

`Arrays.binarySearch(T[] arr, T obj)`
Will search the array for the specified element using binarysearch and return the index it was found at. Only works on sorted arrays.

`Arrays.stream(T[] arr)`
Will return a stream of the elements of the array.

`Arrays.copyOfrange(T[], int beginIndex, int endIndex)`

## Wrapping Up...

- Instance variable is another name for field
- Class variable is another name for static variables
- Local variables are used only within methods, and their lifetimes are tied to execution of the method
- Parameter variables are used to pass options to a method, and their lifetimes are tied to execution of the method
- The java language has eight primitive data types: `int`, `byte`, `boolean`, `long`, `double`, `char`, `float`, `short`