---
title: Relational database normalization
tags: relational database normalization, 1nf, 2nf, 3nf, bcnf
---

# Normalization

When we revise a relational data model, such that redundancies are eliminated, we say that we are _normalizing_ the model. The goal of this is to prevent _anomalies_ during database operations. 

Consider for example if we a have relational model like this (CPR,Birthdate,Birthyear). Where only CPR is key, we notice that anomalies may arise when inserting or updating. We can legally insert e.g. (2211904993,220312,2010), but this data is however quite nonsense, since birthyear is dependent on birthdate and birthdate is dependent on CPR.
kjkj
We categorize the steps of normalization by defining different degrees of normalized forms, 1NF, 2NF, 3NF and BCNF. To define each of these we need some definitions

## Functional Dependency

For two attribute types $X$,$Y$ we say that a for functional dependency $X \rightarrow Y$, $Y$ is uniquely determined by $X$. We say that $Y$ is functionally dependent on $X$ and that there is a functional dependency from $X$ to $Y$. For example if we had a tuple (ZIP,CITY) we would have a functional dependency from ZIP to CITY because a zipcode uniquely determines a city.

A functional dependency $X \rightarrow Y$ is a _full functional dependency_ iff. the removal of any attribute type from $X$ means that the dependency no longer holds. If there is a dependency but it is not full, we say that it is partial.

If there is a functional dependency $X \rightarrow Y$ and a functional dependency $Y \rightarrow Z$, where $Y$ is not a subset of any key, we say that there is a transitive dependency $X \rightarrow Z$.

For a functional dependency $X \rightarrow Y$ we say that it is a _trivial functional dependency_ if $X \subseteq Y$.

There is a _multi-valued dependency_ $X \rightarrow \rightarrow Y$ iff. each $X$ value exactly determines a set of $Y$ values independently of the other attribues.

## Prime attribute type

If an attribute type is part of a candidate key, we say that it is a prime attribute types. 

## Normalizing the model

Starting from an arbitrary model, we can apply _normal form tests_ sequentially, once the model fails a given test, we can alter it such that it passes before moving on to the next test.

### 1NF - First normal form

Condition: every attribute type must be atomic and single-valued. That is: no attribute type can be composite or multi-valued.

I.e. a relation $R$ is in 1NF iff. there are no complex attributes
$1NF(R) \iff \neg \exists A \in R ( Complex(A) )$
A relation $R$ is NOT in 1NF if it has complex attributes.

Example of 1NF:
R = (A,B,C), A,B,C are non-complex, AB is key, A -> C

Example of NOT 1NF:
R = (A,B), B is composite or multi-valued

### 2NF - Second normal form

Condition: satisfies 1NF and every non-prime attribute is fully functionally dependent on any key.

I.e. a relation $R$ is in 2NF iff. it is in 1NF and every attribute that is not part of a key is fully dependent on any key. To reiterate, if any non-prime attribute is dependent on a key $K$, where the removal of any attribute from $K$ does NOT break the dependency, then $R$ is not in 2NF.

Example of 2NF:
R = (A,B,C), A is key, B is key, A -> C

Example of NOT 2NF:
R = (A,B,C), AB is key, A -> C

### 3NF - Third normal form

Condition: satisfies 2NF and no non-prime attribute is transitively dependent on the primary key.

Example of 3NF:
R = (A,B,C), A is key, A -> B, A -> C

Example of NOT 3NF:
R = (A,B,C), A is key, A -> B, B -> C

### BCNF - Boyce-Codd normal form

Condition: satisfies 3NF and for each non-trivial functional dependency $X \rightarrow Y$, $X$ is a superkey.

I.e whenever there is a nontrivial dependency to any attribute $X \rightarrow Y$, then $X$ is a superkey.

Example of BCNF:
R = (A,B,C,D), A is key, A -> B, A -> C, A -> D, AB -> D

Example of NOT BCNF:
R = (A,B,C,D), AB is key, A -> C, AB -> D
(A is not a superkey, thus A -> C breaks BCNF)

### 4NF - Fourth normal form (extracurricular?)

Condition: satisfies BCNF and for every non-trivial multivalued dependencies $X \rightarrow \rightarrow Y$, $X$ is a superkey.