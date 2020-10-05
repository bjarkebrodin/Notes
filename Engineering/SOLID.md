---
title: SOLID Principles of OO design
tags: solid, rigidity, fragility, liskov substition, 
substitution principle
---

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

Closed for modification; existing code should not be modified when added.

## Liskov substitution principle

Where a superclass is expected a subclass can be provided.

## Interface segregation principle

## Dependency inversion principle


## Sources

[Uncle Bob on SOLID](https://www.youtube.com/watch?v=TMuno5RZNeE)

<!-- Slides 2/10/2020 -->