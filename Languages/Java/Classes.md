---
title: Java classes
keywords: interface, abstract
---

# Java Classes

## Class declarations

Classes are blueprints or prototypes for creating objects, described by a certain set of data and behaviour. Fields and methods are analogous to this idea. 

```java
class MyClass
{
    // body
}
```

## Abstract Classe & Interfaces

_Abstract classes_ model abstract concepts, typically more abstract classifications of objects. Abstract classes cannot be instantiated, meaning it is impossible to create a `new Animal()`

```java
abstract class Animal{
  private String name;
  private int age;
  
  public abstract void eat();
  // ABSTRACT METHODS HAVE NO BODY
  // All subclasses must implement the method
} 
```

_Interfaces_ are used to group utilize classes with similar interfaces, interaction that is, interfaces consist of emptybodied methods, any class that implements an interface has to implement all of its methods

# Inheritance

Inheritance refers to the idea of having classes be organized in sub and superclasses in a hierarchy, allowing classes with shared properties to share code through superclasses. Inheritance can be accomplished in java, mainly through class hierarchies and interfaces. 

## Interfaces

Interfaces in java are essentially non-instantiable classes that can contain constant class variables, method signatures, default methods, static methods and nested types. Only default and static methods may have bodies. An interface can be implemented by any class or extended by another interface. Interfaces allow multiple inheritance, that is, a single class can implement multiple interfaces. 

```java
public static void main(String[] args) {
    new Tomato().eat();
}

public interface Edible 
{
    void eat();
}

public interface Vegetable extends Edible 
{
    default void eat() {
        System.out.println("You ate something healthy, yay you");
    }
}

public class Tomato implements Vegetable 
{
    @Override
    public void eat(){
        Vegetable.super.eat();
        System.out.println("You ate a tomato");
    }
}
```

## Anonymous Classes

Are handy to use when implementing interfaces, but when a class for this purpose would be instantiated only once. This is commonly seen when eventhandlers are needed and scenarios like this.

```java
import javax.swing.*;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

public class src {
    public static void main(String[] args) {
        JLabel myLabel = new JLabel();

        myLabel.addKeyListener( new KeyListener() {
            @Override
            public void keyTyped(KeyEvent keyEvent) {
                System.out.println("You typed " + keyEvent.getKeyChar());
            }
            @Override
            public void keyPressed(KeyEvent keyEvent) {
                System.out.println("You pressed " + keyEvent.getKeyChar());
            }
            @Override
            public void keyReleased(KeyEvent keyEvent) {
                System.out.println("You released " + keyEvent.getKeyChar());
            }
        });
    }
}
```