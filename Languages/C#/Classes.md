---
title: Classes & OOP in C#
keywords: class
---

## Classes

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



### Encapsulation

[Access Modifiers](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/access-modifiers) can be used to encapsulate class members. In addition C# has a concept of method hiding, as well as method overriding which complicates virtual dispatch mechanics slightly.

### Members

Class members can be methods, properties, indexers, events, fields, constructors, overloaded operators, nested types and a finalizer.

### Field

Simple variable member of a class. Fields can be modified by `static public internal private protected new unsafe readonly volatile`

Field initializers run before constructors.

### Constant

Statically evaluated, value is literally substituted at compile-time. May be any built in numerical type.

## Inheritance

## Polymorphism

## Misc: enums, structs & unions