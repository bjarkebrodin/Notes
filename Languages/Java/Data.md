---
title:  java data
keywords: strictfp, float, double, integer
sources:
https://docs.oracle.com/javase/specs/jls/se11/html/jls-4.html
https://www.itu.dk/~sestoft/bachelor/IEEE754_article.pdf
https://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html
---

### Floating point data

The `strictfp` keyword enforces IEEE 754 specs for `float` and `double` variables including intermediate results. This however DOES NOT guarantee great accuracy, only uniformity across 80-bit floating point arithmetic implementations.

`float` is a primitive implementation of the IEEE 754 single-precision floating point number (32 bits), consisting of 1 sign bit, 8 exponent bits and 23 mantissa bits.

`double` is an implementation of the IEEE 754 double-precision floating point number (64 bits), sporting 1 sign bit, 11 exponent bits and 52 mantissa bits.

NB. the existence of the extended-exponent format of these data-types.

Special values are `NaN`, `-0`, `Infinity` and `-Infinity`

For precision-critical applications floating point values should be handled as integers. Consider more complex integer based approaches or libraries such as `BigDecimal`

### Integer data

Type | width
-|-
`byte` | 8 bit
`char` | 16 bit
`short` | 16 bit
`int` | 32 bit
`long` | 64 bit

For accommodating wider bit-width numbers consider `BigInteger` or more complex custom approaches.

### Complex data

`Object` is the ancestral type of all complex java data including array types.

Complex datatypes are stored with a header of varying size, depending on JVM implementation. Basic header and reference sizes for various types are as follows (may vary depending on JVM).

Type | 32-bit JVM | 64-bit JVM
-|-|-
`Object` | 12 byte | 16 byte
Array | 16 byte | 20 byte
Reference | 4/8 byte | 4/8 byte