---
title: Classes & OOP in C#
keywords: class
---

# Classes

Basic c# class declaration as
  `class <identifier> { <members> }`

The `class` keyword can optionally be preceded by 
  `<attributes> <modifiers>`

Between class identifier and members, optionally add any of
  `<type-params> <constraints> <inheritance>`

### [Attributes](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/concepts/attributes/)

Classes can be annotated with attributes such as `[Serializable]`

### Modifiers 

Non-nested classes can have the following modifiers;

```cs
public    // visible everywhere
internal  // visible internally

abstract  // non-instantiable
sealed    // non-extendable

static    // non-instantiable
unsafe    //
partial   // only part of class declaration
```

### Constraints & inheritance


_Inheritance_ is done quite simply in C#, consider below snippet.

```cs
class MyClass<T> : BaseClass, ISomeIFace, IOtherIFace
    where T : IDisposable
{
  MyClass(int someParam) : base(someParam) { ... } 
}
```

Inherited and accessible class methods and properties can be accessed using the `base` prefix.

_Covariance_ permits methods to have a more derived return type than the type argument.
Because `IEnumerable<T>` is covariant, this assignment is valid. `IEnumerable<ICollection<object>> cols = new List<List<object>>();`

However since `ICollection<T>` is NOT covariant, we cannot do the following variation of above assignment (`string` in place of `object`). `IEnumerable<ICollection<object>> cols = new List<List<string>>();`

Looking at the interface declarations
`IEnumerable<out T>`, `ICollection<T>` we notice the `out` in the ienumable interface, this in fact denotes that it is covariant.

_Contravariance_ permits methods to have a more derived argument type than the type argument of the assignment. Because `IComparer<T>` is contravariant, this assignment is valid

```cs
IComparer<string> c = new Comparer<object>();

private class Comparer<T> : IComparer<T>
{
  public int Compare(T x, T y)
    => x.GetHashCode() - y.GetHashCode();
}
```

notice that `object` is less derived than `string`. For any non-contravariant generic this would not be allowed. Contravariance is denoted by the `in` in the `<in T>` type parameter declaration.

Properties can be accessed like fields, but are not variables, so they cannot be used as `ref` and `out` variables.

<!-- TL;DR -->

```cs
using static System.Reflection.MethodBase;
using System;

public class C {
  // If you want to manage internal data
  private int _number;
  public int Number
  {
    get { return _number; }
    set { _number = value; }
  }

  // Or alternatively simply use an auto field
  public string Name { get; set; }

  // Expression bodied readonly property
  private readonly string _secret;
  public string Secret => _secret;

  // Reasonable actual use
  private int _phone;
  public int Phone
  {
    get => _phone;
    set
    {
      ValidatePhoneNum(ref value);
      _phone = value;
    }
  }

  private void ValidatePhoneNum(ref int num)
  {
    if ( num > int.MaxValue || num < 0 )
    {
      throw new ArgumentException( $"invalid phone number in {GetCurrentMethod().ToString()}" );
    }
  }
}
```


### Encapsulation

[Access Modifiers](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/access-modifiers) can be used to encapsulate class members. In addition C# has a concept of method hiding, as well as method overriding which complicates virtual dispatch mechanics slightly.

### Members

Class members can be methods, properties, indexers, events, fields, constructors, overloaded operators, nested types and a finalizer.

### Field

Simple variable member of a class. Fields can be modified by `static public internal private protected new unsafe readonly volatile`

Field initializers run before constructors.

### Constant

Statically evaluated, value is literally substituted at compile-time. May be any built in numerical type.

### Properties

Properties can be accessed like fields, but are not variables, so they cannot be used as `ref` and `out` variables. In scope of the setter is 
a `value` keyword, which evaluates to the argument passed to the assignment
of the property : `Somebody.Phone = value`.

```cs
private int _phone;
public int Phone
{
  get => _phone;
  set
  {
    ValidatePhoneNum(value);
    _phone = value;
  }
}
```

## Simple Inheritance structure

```cs
class A
{
  void Do()
  {
    Console.WriteLine("Hello from A");
  }
}

class B : A {}

class Demo
{
  public static void Main(string[] args)
  {
    A b = new B();
    b.Do(); // "Hello from A"
  }
}
```

### Hiding

Class `B` could hide the `Do()` method by explicitly declaring a different method of the same signature.

### Casting

Upcasting can be done according to the liskov substitution principle. Example: `A b = new B();`

Downcasting can be done primarily in two ways: by explicit type casting or by using the `as` keyword.

```cs
A a = new B();
B b = (B)b; // Explicit type downcast
// --- or ---
A a = new B();
B b = a as B;
```

The difference between explicit cast and the `as` operator is the property of which action is taken upon failure. If `a` is indeed an instance of class `B` then the explicit cast will fail and crash, where the `as` operator will simply make the variable `null` instead.

The `is` operator is the cs equivalent of java `instanceof`. The is operator can also   