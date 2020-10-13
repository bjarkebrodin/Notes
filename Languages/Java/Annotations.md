---
title: Java annotations
keywords:
---

# Annotations

```java
@Override
@SurpressWarnings
@Deprecated
@SafeVarargs
@FunctionalInterface
@NonNull
@Inherited
@Schedule
@Alert
```

## Annotation Type

```java
// Declaration
@interface MyAnnotationType {
    String name;
    int val;
}

// Use
@MyAnnotationType {
    name = "Herp",
    val = 2
}
```