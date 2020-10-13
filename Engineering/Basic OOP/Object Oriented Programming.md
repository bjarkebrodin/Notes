---
title: basic OOP concepts
keywords:
---

# Object Oriented Programming

## Objects

Real worlds things, or 'objects', can typically be described through some information about it's _state_, and it's _behaviour_. The _state_ is typically defined through some information describing the object, this could be it's size, weight, location, color, anything. The _behaviour_ is typically defined through verbs, things that an object can _do_ or tasks it can perform. 

In object oriented programming we identify real world objects, and translate them to mathematical/programmatical models. The _state_ of an object we store in _fields_  or _variables_, and the _behaviour_ of an object we model through _methods_ or _functions_. We choose a level of abstraction, that appropriately let's us make a functioning, usable and efficient model, to accomplish some task.

### Advatanges of object modelling
- Modularity: Independent maintenance of object
- Information-hiding: enables encapsulation
- Code re-use: object classes can be reused in new contexts whenever appropriate
- Pluggability: objects can be replaced easily by other objects, allowing for easy maintenance of applications

## Classes

When multiple objects share characteristics we can classify them. The way we do this, is by specifying a class. When we specify a class, we create an object type, that we can later _instantiate_. _Instantiating_ a class, means creating an _instance_ of the class, that is, a specific _object_ held in a location in memory. We say that any instance of an object is defined by it's _state_, which is the values of it's fields. 

_Fields_ or _Instance Variables_ : variables that hold information about a specific instance, these variables define the state of that specific object. The lifetime of an instance variable is tied to the lifetime of the instance itself.

_Class Variables_ or _Static Variables_ : variables that hold information shared across all objects of a class. Does not have different locations in memory across different instances. 

_Local Variables_ or _Method Variables_ : variables used within methods or functions, this type of variable, has a lifespan only as long as the execution of the enclosing scope.

A class is essentially a blueprint for a more or less specific type of objects.

## Inheritance

Inheritance is the concept of organizing classes in hierarchies, that make sense logically and programatically. For example, you may have objects of different kinds that however share certain properties. To avoid code duplication and clean up our code, we may benefit from using inheritance wherever applicable. 

Interfaces, Classes or Abstract classes can be utilized in order to achieve inheritance in Java.

## Packages

'A package is a namespace that organizes a set of related classes and interfaces' - [Oracle tutorial](https://docs.oracle.com/javase/tutorial/java/concepts/package.html). Packages can be thought of as analogous to folders in a file system, or can be used to structure an application into micro-services. 

## Wrapping Up ...
- An object can be described through state and behaviour, the things that describe the object and the things it can do
- A software object is modelled by storing the state in fields or variables, and enabling behaviour through methods or functions
- Internal data can be hidden using encapsulation
- A class is essentially a blueprint for objects of a more or less specific type 
- Classes can be structured in hierarchies wherever appropriate, using inheritance with classes, abstract classes & interfaces
- Classes can be namespaced logically, like folders in a filesystem, by using packages