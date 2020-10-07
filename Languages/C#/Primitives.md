---
title: C# Primitives 
tags: primitives, int, bitwise operators, string
---

## Numerical types

### Floating point primitives

```cs
float, double, decimal
```

`decimal` is designed for base 10 precision, but can still accumulate rounding error. `float` and `double` are simply single- and double-precision IEEE floating points.

### Integer primitives

```cs
/* signed : */ sbyte, short, int, long
/* unsign : */ byte, ushort, uint, ulong
```

Integral types can be converted implicitly in most cases otherwise an explicit type cast might be needed.

Division on the integral types default to integer division. Overflow on integral types exhibit 'runaround' behaviour. Overflow can be forced to throw an `OverflowException` by using the `checked` keyword.

#### Bitwise operations

```cs
~  // not
|  // or
&  // and
^  // xor
<< // left shift
>> // right shift
```

The `&` and `|` operators double as conditional operators when used on boolean values, BUT they DO NOT short-circuit making them somewhat useless.

### Numeric suffixes

```cs
float f = 1.0F;
double d = 1D;
decimal m = 1.0M;
uint i = 1U;
long l = 1L;
ulong ul = 1UL;
```

### Numeric prefixes

```cs
long ipv4 = 192_168_1_1;
long ipv4 = 0xC0_A8_01_01;
long ipv4 = 0b0110110_01101101_10010010_01110110
```

## Strings

Verbatim string literals can be achieved by prefixing the literal with @, example :

```cs
string slashes = @"\n\"; // verbatim '\n\'
```

To represent `"` in a verbatim string the char can be repeated twice. 

```cs
string dquotes = @"<xml version=""1.0"">";
```

Interpolated strings.

```cs
int x = 42;
string s = $"the answer is {x}";
```
string does not support `<` and `>` for comparison. 

## Arrays

C# support normal C-esque array syntax, and also a slightly lighter version.

```cs
int[,] matrix2x2 = new int[2,2];
int[][] matrix2x2 = new int[2][2];
int[][] matrix2xY = new int[2][];
```

Do note that there are reasonable differences between the 2.

### Parameters

#### Optional parameter

```cs
void print (string output = "default" ) 
{
  Console.WriteLine(output);
}
```

### Paramater passed by reference

```cs
void increment (ref int x )
{
  x++;
  // any variable passed as argument
  // will now have been incremented
}
```

for variables that do not need to pass definite assignment when used as a parameter the `out` keyword can be used instead of the `ref`. This can also be used to shorthand multiple return values.

```cs
static void randomPoint(out int x, out int y)
{
    Random r = new Random();
    x = r.Next();
    y = r.Next();
}
public static void Main (string[] args)
{
    randomPoint(out int x, out int y);
    Console.WriteLine($"{x}, {y}");
}
```