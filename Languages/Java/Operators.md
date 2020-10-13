---
title: Java operators
keywords: arithemtic, bitwise, conditional, operator
---

# Operators

### Java operators by precedence (descending)
Operator | Precedence
- | -
`expr++` `expr--` | postfix
`+expr` `-expr` `++expr` `--expr ! ~`| unary
`* / %` | multiplicative
`+ -` | additive
`<< >> >>>` | shift
`< > <= >= instanceof` | relational
`== !=` | equality
`&` | bitwise AND
`^` | bitwise XOR
`|` | bitwise OR
`&&` | Logical AND
`||` | Logical OR
`? :` | Ternary
`= += -= /= %= &= ^= != <<= >>= >>>=` | assignment

## Conditional Short Circuits

`&&` 

A boolean expression using the AND operator will evaluate to false as soon as a false value is found. Exemplified like so :
```java 
public class ShortCircuitsAND{
    public static void main(String[] args){
        System.out.println( false1() && true2() );  // -> 1, false
        System.out.println( true2() && false1() );  // -> 2, 1, false
        System.out.println(!(false1() && true2())); // -> 1, true
        System.out.println(!(true2() && false1())); // -> 2, 1, true 
    }
    private static boolean false1(){
        System.out.println("1");
        return false;
    }
    private static boolean true2(){
        System.out.println("2");
        return true;
    }
}
```

`||`
A boolean expression using the OR operator will evaluate to true as soon as a true value is found

```java 
public class ShortCircuitsOR{
    public static void main(String[] args){
        System.out.println( false1() || true2() );  // -> 1, 2, true
        System.out.println( true2() || false1() );  // -> 2, true
        System.out.println(!(false1() || true2())); // -> 1, 2, false
        System.out.println(!(true2() || false1())); // -> 2, false
    }
    private static boolean false1(){
        System.out.println("1");
        return false;
    }
    private static boolean true2(){
        System.out.println("2");
        return true;
    }
}
```

## `instanceof`

Can be used to check whether a class implements an interface type, is an instance of a subclass or is an instance of a class.

## Bitwise Operations

```java
public class BitwiseOps{
    public static void main(String... args){
        byte num      = 0b1111111;
        byte identity = 0b1111111;
        byte zero     = 0b0000000;
        byte mask     = 0b1000001;
        System.out.println(num);                // -> 127
        System.out.println(num & identity);     // -> 127
        System.out.println(num & zero);         // -> 0
        System.out.println(num >> 1);           // -> 63
        System.out.println((num << 1 ) + 1);    // -> 255
        System.out.println(num & mask);         // -> 65
    }
}
```