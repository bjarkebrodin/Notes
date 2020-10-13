---
title: c++ functions
keywords: pointer, reference
---

## Declare interface at top of scope

```cpp
void foo();
int main()
{
  foo();
}
void foo()
{
  cout << "foo";
}
```

Alternatively this can be done by including a header file.

## Pass arguments by reference

Passing can prevent superflous variable creation, but can be dangerous to use, since it is not clear that the argument is passed by reference and not by value.

```cpp
#include<iostream>
int increment(int & x);
int main()
{
  int a = 1;
  increment(a);
  std::cout << a; // a is now 2
}
int increment(int & x)
{
  return x++;
}
```

### Pass arguments by pointer

Same as before is accomplished, but now the side-effect is gone, it is instead explicit - this is arguably more ugly, but it forces analysis and understanding. 

```cpp
#include<iostream>
int * increment(int * x);
int main()
{
  int a = 1;
  a = increment(&a);
  std::cout << a; // a is now 2
}
int * increment(int * x)
{
  return x++;
}
```