---
title: c++ types
keywords: primitives
---

C++ is strongly typed, there are several integral primitive datatypes in c++. Such as the ones listed in [basics](./basics.md) - note that a string is not a default datatype in C++, but a `char[]` is referred to as a C-string and treated as a string in some contexts.

## Integer Types

```cpp
// TYPE                 // MIN SIZE     // TYPICAL SIZE

// Character types
char                    // 1 byte       // 1 byte
char16_t                // 2 byte       // 2 byte
char32_t                // 4 byte       // 4 byte
wchar_t                 // bigger       // size є { 2, 4 }

// Signed Integer Types
char                    // 1 byte       // -||-      
short int               // 2 byte       // -||-
int                     // 2 byte       // -||-
long int                // 4 byte       // -||-
long long int           // 8 byte       // -||-

// Fixed width alternatives from cstdint
int8_t
int16_t
int32_t
int64_t

// Unsigned Integer Types
unsigned char           // -||-         // -||-
unsigned short int      // -||-         // -||-
unsigned int            // -||-         // -||-
unsigned long int       // -||-         // -||-
unsigned long long      // -||-         // -||-

// Fixed width alternatives from cstdint
uint8_t
uint16_t
uint32_t
uint64_t

// Floating Point Types
float                   // 4 byte       // 4 byte
double                  // 8 byte       // 8 byte
long double             // 8 byte       // size є { 8, 12, 16 }
```

note that floating points adhere to the IEEE floating point standard

## String and Character Types

The C-string is the default string type, the c-string is a special case of a `char[]` and is declared and used just as if it were a char[] - but in some contexts it is treated like a normal string. Note that a c-string includes a 0 valued char at the end to terminate the string.

## Structs

```cpp
struct Point
{
  double x;
  double y;
}

int main()
{
  Point origin = { 0.0, 0.0 };
}
```

## Enums

```cpp
enum number : uint8_t {ONE, TWO, THREE};
```

## Unions

Unions store the same data but allows multiple representations

