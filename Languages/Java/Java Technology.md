---
title: Java Technology
keywords:
---

# Java Technology

https://www.oracle.com/technetwork/java/langenv-140151.html

## The Java Programming Language

Source code is written in plain text with .java extension. Source files compiled into .class files using the `javac` compiler. .class files contain Java VM _bytecode_. Java programs are then executed on the _java platform_. 

## The Java Platform

The java platform has two component: the _Java Virtual Machine_ and the _Java API_.

The _JVM_ provides the environment which executes the bytecode, and the API provides a library of prebuilt software organized in packages and classes.

Java provides 

### Development Tools

`java`    - launches code on the JVM
`javac`   - compiles code 
`javadoc` - generates documentation based on javadoc comments

### API

Big amount of prebuilt classes and software. Look stuff up when you need.

### User Interface Tools

JavaFX, Swing, Java2D. 

### Integration

- Java IDL API
- JDBC API
- JNDI API
- Java RMI
- Java RMI-IIOP

## Key Java Features
- Less code than C++
- Better code than C++
- Avoid platform dependencies
- Write once, run anywhere
- Distribute more easily : java web start

Source : [About the Java Technology](https://docs.oracle.com/javase/tutorial/getStarted/intro/definition.html)

## JVM

the java virtual machine is a virtual machine, which provides a runtime environtment in which java bytecode is executed. It can also run programs written in other languages as long as they are compiled to java bytecode.

the implementations of the JVM, JRE(_java runtime environment_) and JDK(_java development kit_) ARE platform dependent, but java itself is platform independent, since it is implemenent within the JVM which runs the java bytecode the same, regardless of which JVM implementation is installed.

#### Tasks of the JVM :
- Loads code
- Verifies code
- Executes code
- Provides runtime environment

## JRE 

the java runtime environment. also written as Java RTE, is a set of software tools used for java development, the JRE does physically exist. It contains a set of libraries + some files that JVM uses at runtime.

## JDK

the JDK is a software development environment containing JRE and development tools

![JDK](https://static.javatpoint.com/images/jdk2.png)