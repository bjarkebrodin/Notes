---
title: Object oriented analysis & design
keywords:
---


# Analysis & Design

### Advantages of OOP
- Understanding of systems and reality
- Design stability
- Reusability of code and design
- Widely used

### OO-Analysis 
Phenomena are conceptualized
Concept <-> Object
Begreb <-> Fænomen

##### The steps of the Object oriented process :
Analysis -> Design -> Implementation
###### Analysis 
_Domain analysis_ - Understand the _problem domain_
Identify phenomena and concepts (objects and classes).
Informal specifications of concepts
Correct level of abstraction is essential to the functionality of the program. 
Information is gathered.

###### Design 
_Solution domain_ - the problem domain is modelled.
Construct precise descriptions
Formalize specifications of concepts
(Not executable yet)
Information is represented.

###### Implementation
Make it executable

### The _Verb/Noun_ approach
When describing a system to be build, this approach roughly estimates that the classes needed for the system would correspond to the nouns, and the methods needed for the classes would be the verbs associated with a given noun. 

##### CRC cards
_Class/Responsibilities/Collaborators_

Classes are listed as above with descriptions of their responsibilities and their collaborators.

In order to determine which collaborators and which responsibilities the class  could have, _scenarios_ or _use cases_ are played through. This could be imagining the context in which the class is needed and simulating what it should be able to do. By _collaborators_ is meant the other classes that the class is collaborating with. 

##### Approach

1. Describe the system
2. Find verbs/nouns
3. Use CRC cards and scenarios to generate class designs
4. Design Classes and Interfaces 
5. Write documentation for classes and interfaces

##### Collaboration
Because class designs and interfaces are well documented it is easy to collaborate, a good design can be split up, and the classes that a person isn't working on themselves can be substituted by accurate stubs, since the description of the class interface is already documented. This allows for smooth teamwork.

### The Waterfall Model
1. Problem analysis
2. design of the software
3. implementation of the software
4. unit testing
5. integration testing
6. delivery of system

Weaknesses: 
- assumes that developers understand full extent of system from the start.
- assumes that system does not change after delivery.

### Iterative development

In short analysis/desing/prototype -> implementation -> client-feedback -> restart.

Many iterative approaches do not have an end goal, they simply have iterations of working states. The idea is that software is grown through iterations of development and customer feedback.

The favorization of iterative development processes in modern software development is also largely a part of the reason why it is very important to write extendable, maintainable and readable code. Viewing a piece of software as a living, dynamic entity that should be open to new interactions without heavy and cumbersome clumps of bad code will create better code.

```java
while(!done){
  Analysis
  Design
  Prototyping
  Testing
  Feedback
}
```

## Class Design - Design Patterns

Outlines of some patterns of class design.

## MVC

Model-View-Controller is a widely used pattern for GUI application. The MVC application distributes the responsibilities of the application into its three different categories as follows:

#### Model
The model represents an object carrying data. 

#### View
The view represents the visualization of the data.

#### Controller
The controller acts on both model and view, it controls the data flow into the model object as well as updating the view whenever data changes in the model. The controller keeps the view and the model separate.
The idea is that the user interacts with the controller, which then updates the state of the model and updates the view.

## Other Patterns

### Decorator
The Decorator pattern is used to enhance or limit other classes. The idea is that a decorator is wrapped around a different class to perform some limitation, alteration or enhancement of the exhibited functionality. It 'decorates' the object it is wrapping. 

### Singleton
This pattern emulates a unique instance of a class by ensuring that only one instance can ever be created, and thus all references to the class will point to the same instance.
The main structure of a singleton class could look like this.

```java
public final class Singleton {
  private static final Singleton instance = new Singleton();
  
  private Singleton(){...}
  
  public static Singleton getInstance(){
    return instance;
  }
}
```

By making the constructor private it is ensured that no other instance of the class can ever be created, since the constricted access ensures that the instantiation of the unique object can only occur like this.

### Factory
The factory pattern abstracts the idea of a factory that can produce a range of different objects, a factory "head" class, takes an order and then produces and returns the "ordered" objects.