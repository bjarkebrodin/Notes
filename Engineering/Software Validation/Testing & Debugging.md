---
title: Software testing & debugging
keywords:
---

# Testing & Debugging

Testing is the systematic process of executing a program with the intent of finding errors.
$-$ (”The Art of Software Testing” (Chap. 2), Glenford J. Myers, 1979)

### The "Pesticide" Paradox 
The more you test a software the more immune it becomes to your tests.
$-$ (B.Beizer, “Software Testing Techniques”, 1990)

**Programming** utilizes _constructive thinking_, **Testing** utilizes _destructive thinking_.
It is usually a good idea to have someone else test your code/software

Testing is a process that is never completed, it can never prove absence of errors. It can however document confidence in the program and thus a degree of quality assurance. 

There are several main types and categories of testing.

## Unit Testing
The unit test, is a test of a singular part of the program, this could be a method, class or package for example.
Unit testing is essential to any development projects bigger than very small, since it is a very good tool to help minimize bugs and errors early on. This is very valuable since it will minimize costly bugs at later stages. 
Having established unit tests is also a huge advantage when putting together the units, since the prewritten tests can be run again in _regression_ tests if changes are made to the units at a later point. This will minimize the amount of new bugs introduced while correcting prior bugs. Unit tests are also a good tool for localizing bugs.

##### Methodology in unit testing
1. Write the test before the method,  or test every method while it is being written.
2. A unit test per unit.

## System Testing ( "Integration Test" )
Tests that the assembled application is doing what it is supposed to be doing. Not necessarily good at localizing mistakes, and the errors it does discover are usually discovered late in the development process. This type of test is good for estimating whether or not the application works.

## Regression Testing
Automized and saved tests that help ensure that everything still works after changes are introduced.

Regression tests should be done; 
- Everytime the program is developed further.
- Anytime functionality is added
- Anytime anything is maintained
- Anytime anything is refactored or put together

## Performance Testing
The act of testing the speed of execution of a method or unit.


## Whitebox vs Blackbox testing

#### Whitebox testing
Also referred to as "structural testing" or "internal testing" is the process of testing the code and the inner designs of the application.

#### Blackbox testing
Also "behavioural testing", "external testing", "input-output testing" is the process of testing the specification or intention of the software. The specs and the use of the application is whats being measured.

## Types of Errors

Syntactical errors : result in error messages from IDE
Semantic errors : can result in error messages, compiletime errors or even runtime errors.
Logic errors : can result in runtime errors, but usually they have only the subtle consequence that the program looks like its working, but really it is producing the wrong result.

## Building Test Cases

Aggressive testing is good testing, a good tester breaks the software as much as possible.
Test cases should be build systematically, there should be one representative test case for a class of errors, e.g. one test case that tests division by zero. Test cases should include typical as well as extreme cases. 

- Wrong amount of arguments
- Wrong type of arguments
- Null arguments
- Empty arguments
- Unexpected arguments
- Valid arguments
- Simple arguments
- Complex arguments
- Inverse arguments
- Variants of same
- All valid cases
- Border cases
- Empty Collections
- Collections with 1 element
- Typical/Minimal/Min-1/Maximal/Max+1 inputs
- Around powers of two, assumed data type for holding input

_Positive tests_ refers to tests that are expected to produce success
_Negative tests_ refers to tests that are expected to produce failures or errors

### Equivalence Testing
Classes of input can be partitioned meaningfully utilizing the idea of equivalence class. Where a set of input is equivalent in some regard, we can treat any input of that class the same, and simply test the class. 

Common partitions for testing could be ;
###### Numbers 
- Positive, Negative, Zero
- zero, one, many
###### Lists
- Length-0, length-1, length-2+
- Ascending elements, descending elements, unsorted