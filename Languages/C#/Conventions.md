---
title: C# conventions
tags: Code conventions, C#
---

# C# Conventions

## Solution Structure

A very basic c# solution project structure as follows;

```
MySolution
|__MySolution.sln  
|__MyProject
   |__MyProject.csproj
   |__MyClass.cs
|__MyProject.Tests
   |__MyProject.Tests.csproj
   |__MyClassTests.cs
```

Test projects are are named the same as their respective project, but suffixed `.Tests` - Test classes are name the same as their respective class, but suffixed `Tests.cs` in place of `.cs`.

## Naming conventions

Methods in upper CamelCase

Properties in upper CamelCase

Private fields in _ prefixed _camelCase

Variables and fields in normal camelCase

Opening curlybrackets on newlines

Classnames in CamelCase

Interfaces in upper CamelCase prefixed with an I


## Layout conventions ([See Microsoft Guide](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/inside-a-program/coding-conventions))

Default code editor settings. (smart-indent, 4char tabs as spaces).

Only one statement per line.

Only one declaration per line.

Continuation lines indented one tab

At least one blank line between method defs and properties

Use explicit parentheses

Use implicit typing on the left when type is obvious on the right

Concise array declaration preffered e.g. `int[] numbers = {1,2,3};`

### Try/catching

Simplify try/catches wherever possible using `using IDisposable` construct instead.

```cs
try
{
  ...
}
catch (e..)
{
  ...
}
finally 
{
  ...
}
```

### If/else

```cs
if ()
{
  ...
}
else if ()
{
  ...
}
else
{
  ...
}
```

### Switching

Note that cases need to be mutually exclusive, or the compiler will be unhappy.

Standard c# switch

```cs
switch (variable)
{
  case valueA:
    ...
    break;
  case valueB:
    ...
    break;
  default:
    ...
    break;
}
```

Fallthrough c# switch

```cs
switch (variable)
{
  case valueA:
  case valueB:
    ...
    break;
  default:
    ...
    break;
}
```

c# switch with typing and `when`

```cs
switch (someObject)
{
  case int num when num >= 0:
    DoStuffWith(num);
    break;
  case int num when num < 0:
    DoOtherStuffWith(num);
    break;
  case string str when str.Length > 0:
    DoStringThing(str);
    break;
  default:
    ...
    break;
}
```