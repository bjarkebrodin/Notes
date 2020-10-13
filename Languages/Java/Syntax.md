---
title: java syntax
keywords: 
sources: https://docs.oracle.com/javase/specs/index.html
---

```java
// Literals
true              // boolean
0b0101            // integer
0x1a1a            // integer
1337              // integer
1337L             // long
191_102_068_000L  // long
4.0               // double
4.0f              // float
"String"          // String
'C'               // char
'\u1a1a'          // char
null              // null literal

// Typecasting
(Type)Identifier

// Numerical operators
+ - / * % ++ -- >> << >>> 
+= -= /= *= >>= <<= >>>=

// Bitwise operators
^ & ~ | &= |= ^= %= 

// Conditional operators
> < => <= == != ! ? || &&

// Single Line Comment

/*
  Multi-line comment
*/

/**
  Javadoc comment
*/

// Primitive type identifiers:
byte short char int long float double boolean

// Assignment statement:
Type Identifier = Expression;

// Standard conditional statement:
if ( expression ) { }
else if ( expression ) { }
else { }

// Switch statement:
switch ( expression ) {
  case a:
  case b:
    <...>
    break;
  case c:
    <...>
}

// Try/catch statement
try { }
catch ( Type Identifier ) { }
finally { }

// Try with ressources
try ( ressource; ressource; ... ; ) { }
catch ( Type Identifier ) { }
finally { }

// Ternary expression:
boolean ? a : b

// Basic for statement:
for ( expression; ; ) { }
for ( initiation; condition; increment ) { }

// Enhanced for statement:
for ( Type Identifier : Iterable ) { }

// While
while ( boolean ) { }

// Do..while
do { 
  <...>
} while ( boolean );

// Class declaration:
class Identifier { }
class Identifier<TypeArgs> { }

// Anonymous class:
new Identifier() { }

// Array declaration/initialization:
Type[] Identifier = new Type[i];
Type[] Identifier = new Type[]{ };
Type[] Identifier = { };

// Array access expression:
Identifier[i]

// Function:
Modifier ReturnType Identifier ( args ) { }
static <TypeArgs> Identifier ( args ) { }
public static void main ( String ... args ) { }

// Lambda expression: 
( args ) -> { }
( args ) ->  

// Enum:
enum Identifier {
  IDENTIFIER, ..., IDENTIFIER;
  <...>
}

// Interface
interface Identifier {
  <...>
}

// Annotation type declaration 
@Retention( policy )
@Target( element_type )
@interface Identifier {
  <...>
}

// Annotation use
@Identifier( args )

// Inheritance
class Identifier extends MyClass implements MyInterface { }

// Assertions
assert booleanExpression : errorString;
assert booleanExpression;
```
