---
title: C++ Basics
keywords: gcc, functions, primitives
---

# C++ Basics

## Links & Ressources
[Language Reference](https://www.cplusplus.com/reference/)

## Compiler

Compiling C++ can be through a few different toolchains or simply through an IDE. Common compiler options are [gcc](https://gcc.gnu.org/) or [clang](https://clang.llvm.org/).

**GCC** - `g++ -std=c++0x example.cpp -o example_program`

**Clang** `clang**++ -std=c++11 -stdlib=libc++ example.cpp -o example_program`

I use the below z-shell function to quickly run c++ programs from the terminal using GCC.
```zsh
function cpprun; {
    g++ -std=c++0x $1.cpp -o $1
    ./$1
}
```

## Syntax

### Imports

```cpp
// available through 'library' qualifier
#include <library> 

// available withouth qualifier
using namespace other_library;
```

### Comments

```cpp
// I am a singe line comment
/* I am a multiline comment */
```

### Identifiers

May contain letters, digits & underscores - **CASE SENSITIVE**

## Primitive Data Types

Below is a short reference of datatypes and their **MINIMUM** sizes (note the existence of `nullptr` and `void` types).

```cpp
// TYPE                 // MIN SIZE     // TYPICAL SIZE

// Character types
char                    // 1 byte       // 1 byte
char16_t                // 2 byte       // 2 byte
char32_t                // 4 byte       // 4 byte
wchar_t                 // bigger       // size є { 2, 4 }

// Signed Integer Types
signed char             // 1 byte       // -||-      
signed short int        // 2 byte       // -||-
signed int              // 2 byte       // -||-
signed long int         // 4 byte       // -||-
signed long long        // 8 byte       // -||-

// Unsigned Integer Types
unsigned char           // -||-         // -||-
unsigned short int      // -||-         // -||-
unsigned int            // -||-         // -||-
unsigned long int       // -||-         // -||-
unsigned long long      // -||-         // -||-

// Floating Point Types
float                   // 4 byte       // 4 byte
double                  // 8 byte       // 8 byte
long double             // 8 byte       // size є { 8, 12, 16 }
```

### Variables

Variable memory location assignment does not necessarily default initialize, so declare a default upon init.

#### Declaration & initialization

Declaration w/o initialization : `<type> <identifier>;`

Assignment initialization : 
`<type> <identifier> = <value>;`

Constructor initialization :
`<type> <identifier> (<value>);`

Uniform initialization :
`<type> <identifier> {<value>};`

#### Type Inference

Usually a bad idea - `auto` works somewhat similarly to the Java keyword `var`, if there is no type to directly infer from, the `decltype()` method can be used. Example below.

```cpp
auto foo = 0;       // Inferred to be int, value 0
decltype(foo) bar;  // Declared same type as foo, no value
```

## Control Flow

### Conditionals
```cpp
if (boolean) {
  // code
} else if (boolean) {
  // code
} else {
  // code
}

switch (value) {
  case 1:
    // code
    break;
  case 2:
  case 3:
  case 4:
    // code
    break;
  default:
    // code
}
```

### Loops
```cpp
while (boolean) 
{
  // code
}

for (assignment; boolean, increment)
{
  // code
}

do
{
  // code
} while (boolean);
```

## Functions

Declare functions before use, or at least their interface, example.

```cpp
void hello();

int main()
{
  hello();
}

void hello()
{
  cout << "hello world";
}
```

Parameters that are normally passed by value (primitives), can be passed by reference using by appending `&` to the datatype in the parameter list declaration. Method return types can be overloaded in combination with parameters - as long as the name and parameterlist is unique.

## IO

```cpp
#include <iostream> // Std IO
#include <fstream> // File
```

## Classes & structs

Constructing objects and structs seem syntactically synonymous to declaration. `struct` and `class` are similar in many ways, but generally `class` is used as soon as complexity exceeds a simple grouping of related data. Formally members of a `struct` are public by default whereas `class` members are private.

```cpp
struct MyStruct 
{
  int number;
  string name;
};

class MyClass
{
private:
  int number;
  char letter;

public:
  MyClass(int num, char let);
  void print();
};

MyClass::MyClass(int num, char let) 
{
  number = num;
  letter = let;
}

void MyClass::print()
{
  std::cout << number << "" << letter;
}

int main()
{
  MyClass my (2, 'A');
  my.print();
}
```