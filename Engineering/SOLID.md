---
title: SOLID Principles of OO design
keywords: solid, rigidity, fragility, liskov substition, 
substitution principle, dependency inversion, open/closed,
dependency management.
---

TL;DR: Classes should have one reason to change, be open
for extension but closed for modification; derived classes
should be usable through superclass interfaces; interfaces
should be segregated reasonably and dependency on implementation
instead of interface is bad.

## What is SOLID?

The _**SOLID**_ acronym summarize principles of OO 
design :
 
- Single responsibility principle _SRP_
- Open/closed principle _OCP_
- Liskov substitution principle _LSP_
- Interface segregation principle _ISP_
- Dependency inversion principle _ISP_

These are concepts that help us design better systems 
by solving common pitfalls of system design.

## How do we diagnose bad code and design

_Rigidity_ ; 
  We say that a system is rigid when
  a single local modification requires many 
  areas of the codebase to be modified.

_Fragility_ : 
  we say that code is fragile if when
  changing code in one place, code in a 
  different place may break.

_Immobility (non-reusability)_ : 
  we say that a piece of code is non-reusable
  when the generically reusable part of said 
  module is unnecessarily coupled with more 
  specific implementation.

## Key principles of OO

_Polymorphism_ ; 
  Dynamically typed languages grant polymorphism 
  for free. While statically typed languages need 
  inheritance to provide polymorphism.

_Inheritance_ ;
  Inheritance of behaviour.

_Encapsulation_ ;
  Hiding of implementation, code access control.

## Single responsibility principle

Each class should have a single reason to change. 
One should not put functionality that has multiple 
reasons to change in the same module/class.

We want to separate functionality to well mapped 
responsibilities. This can help us avoid having logic
affecting many different departments gathered in the 
same classes. 

## Open/closed principle

Open for extension; behaviour can be extended.

Closed for modification; existing code should not be 
modified when added.

## Liskov substitution principle

Derived classes should be usable through the base class 
interface, without the need for the user to know the 
difference.

## Interface segregation principle

Many client-specific interfaces are better than one
general-purpose interface.

## Dependency inversion principle

Depend upon abstractions not concretions.

## Resources

[Uncle Bob on SOLID](https://www.youtube.com/watch?v=TMuno5RZNeE)