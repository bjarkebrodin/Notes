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


### Encapsulation

[Access Modifiers](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/access-modifiers) can be used to encapsulate class members. In addition C# has a concept of method hiding, as well as method overriding which complicates virtual dispatch mechanics slightly.

### Members

Class members can be methods, properties, indexers, events, fields, constructors, overloaded operators, nested types and a finalizer.

### Field

Simple variable member of a class. Fields can be modified by `static public internal private protected new unsafe readonly volatile`

Field initializers run before constructors.

### Constant

Statically evaluated, value is literally substituted at compile-time. May be any built in numerical type.