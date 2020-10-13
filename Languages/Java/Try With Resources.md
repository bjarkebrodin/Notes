---
title:
java try with resources

sources:
https://www.baeldung.com/java-try-with-resources
---

Try with resources can be used to simplify syntax wherever the resources used in the try block implement the `AutoCloseable` interface.

```java
try ( var ressource = declaration ) {
  // Something 
} catch ( ... ) {

} // Optional 'finally' block
```

If a resource initialized before the try block is effectively final or final, the resource can be used in the try block by using a variable expression as argument to the block. 

```java
var ressource = declaration;
try ( ressource ) {
...
```

Being able to use resources declared outside can prove useful for constructs involving multiple resources.

```java
var input = new Input();
var output = new Output();

try ( input; output ) {
  output.write(input.read);
} catch ( IOException e ) {
  // Handle
}
```