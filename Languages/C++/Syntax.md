---
title: c++ syntax
keywords: imports, comments, variables
---

C++ is whitespace insensitive (between tokens) but case-sensitive.

## Identifiers

A valid identifier is in `[a-zA-Z_][a-zA-Z0-9_]*`.
That is letters, numbers and underscore but may not start with underscore.

## Imports & preamble

Libraries can be included with the include preprocessor keyword.

```cpp
#include <library>
```

Declaring the use of namespaces allow for unqualified use of library functions.

```cpp
using namespace library;
```

## Comments

```cpp
// I am a single-line comment

/*
  I am a multi-line comment
*/
```

## Variable

```cpp
/* 
Declaration:
<qualifier> <type> <identifier>;
*/
int num;
const int constant;

/*
Initialization can be done inline or through 
subsequent assignment statements
*/
int num = 42;
int num;
num = 0;

// Construction style is also a thing
int num (42);
int num {42};
```

## Pointers

Pointer types can be declared by prepending an asterisk to the variable name. The pointer type will not hold the variable value, but the memory address of the value. Obtaining the memory address of a value can be accomplished using the ampersand - the reference operator.

```cpp
int a = 1, b = a, *c = &a;
b = 5; *c = 10;
cout << "a: " << a << " b: " << b << " c:" << *c << endl;
// -> a:10 b:5 c:10
```

Note that reassigning the value of a pointer type, requires prepending an asterisk, to explicify that it is the value pointed to and not the pointer itself that should be changed. If you wish to reassign the address of the pointer this is done using the raw identifier.

## References

References are a little like pointers, except that they cannot be reassigned, and the value dereferenced by a reference can be changed using the raw identifier.

```cpp
int a = 1, &b = a, *c = &a;
b = 5; 
cout << "a: " << a << " b: " << b << " *c:" << *c << endl;
// -> a:5 b:5 c:5
*c = 10;
cout << "a: " << a << " b: " << b << " *c:" << *c << endl;
// -> a:10 b:10 c:10
```

## Primitive Arrays 

Typical array usage can be described by the following block of code.

```cpp
int A[5];
for (int c = 0; c < 5; c++) A[c] = c;
for (int c = 0; c < 5; c++) cout << A[c] << " "; 

cout << endl;

int B[5] = {0,1,2,3,4};
for (int c = 0; c < 5; c++) cout << A[c] << " "; 

cout << endl;

int C[5]; int *i = C;
for (int c = 0; c < 5; c++) *(i++) = c;
for (int c = 0; c < 5; c++) cout << C[c] << " "; 
```


## Primitive Strings

Primitive strings are 'simply' a special case of the char[].

```cpp
char name[] = "Hans";
cout << name;
```

The pointer allows us to add a few more iteration idioms when working with 0 terminated strings.

```cpp
char D[] = "01234";
for(char *c = D; *c; c++) cout << *c;

char E[] = "01234"; 
char *c = E;
while(*c) cout << *(c++);
```
this works because the last char value will be `0` and thus `*c` will be false, this approach generally does not work for all types, especially when using integer arrays this is a bad approach.

## Conditionals

`if..else if..else`, `switch` and ternary `?` as usual.
Any nonzero value is inherently 'truthy'

## Loops

`while`, `do..while` and `for` as usual - the c++ equivalent to the foreach 

```cpp
// Range-based for
for(int i : {0, 1, 2, 3, 4}) cout << i;

for(char c : "01234")
{
  if ( c == 0 ) break;
  cout << c;
}
```

## Main method

```cpp
int main(int argc, char * argv[])
{
  // ...
}

// Alternatively
int main()
{
  // ...
}
```