---
title: Relational database normalization
tags: relational database normalization, 1nf, 2nf, 3nf, bcnf
---

# Normalization

When we revise a relational data model, such that redundancies are eliminated, we say that we are _normalizing_ the model. The goal of this is to prevent _anomalies_ during database operations. 

Consider for example if we a relational model like this;

CPR | Birthdate | Birthyear
-|-|-


where only CPR is key, we notice that anomalies may arise when inserting or updating. We can legally insert e.g. (2211904993,220312,2010), but this data is however quite nonsense, since birthyear is dependent on birthdate and birthdate is dependent on CPR.

We categorize the steps of normalization by defining different degrees of normalized forms, 1NF, 2NF, 3NF and BCNF. To define each of these we need some definitions

## Functional Dependency

For two attribute types $X$,$Y$ we say that a for functional dependency $X \rightarrow Y$, $Y$ is uniquely determined by $X$. We say that $Y$ is functionally dependent on $X$ and that there is a functional dependency from $X$ to $Y$. For example if we had a tuple (ZIP,CITY) we would have a functional dependency from ZIP to CITY because a zipcode uniquely determines a city.

A functional dependency $X \rightarrow Y$ is a _full functional dependency_ iff. the removal of any attribute type from $X$ means that the dependency no longer holds. If there is a dependency but it is not full, we say that it is partial.

If there is a functional dependency $X \rightarrow Y$ and a functional dependency $Y \rightarrow Z$, where $Y$ is not a subset of any key, we say that there is a transitive dependency $X \rightarrow Z$.

For a functional dependency $X \rightarrow Y$ we say that it is a _trivial functional dependency_ if $X \subseteq Y$.

## Prime attribute type

If an attribute type is part of a candidate key, we say that it is a prime attribute types. 

## Normalizing the model

Starting from an arbitrary model, we can apply _normal form tests_ sequentially, once the model fails a given test, we can alter it such that it passes before moving on to the next test.

### 1NF - First normal form

Condition: every attribute type must be atomic and single-valued. That is: no attribute type can be composite or multi-valued.

### 2NF - Second normal form

Condition: satisfies 1NF and every non-prime attribute is fully functionally dependent on any key.

### 3NF - Third normal form

Condition: satisfies 2NF and no non-prime attribute is transitively dependent on the primary key.

### BCNF - Boyce-Codd normal form

Condition: for each non-trivial functional dependency $X \rightarrow Y$, $X$ is a superkey.