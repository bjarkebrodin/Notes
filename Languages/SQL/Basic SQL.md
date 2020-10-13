---
title: basic SQL DML - select and boolean operators
keywords: SQL, select, from, where, operators
---

# Basic SQL DML - Select statement and operators

TL;DR do stuff with statements and clauses, `join` executes before `where`

## The Select Statement

The select statement is used to retrieve data 
The basic syntax of the statement is of the form 

```sql
select 
  columns
from   
  table
where  
  conditions
```

The `distinct` keyword can optionally be applied to eliminate duplicate rows

an sql statement is mandatorily terminated with a semicolon.

## Operators

### Boolean operators

  `= != <> < > <= >=`
  `A AND B` 
  `A OR B`
  `A between B and C`
  `A in B`
  `exists A`
  `NOT A`
  `A is NULL`
  `A is NOT NULL`

  Strings:
  `A = B  A <> B` (case insensitive)
  `A like B` (case insensitive)
  `%` (sql) : `.*` (regex)
  `-` (sql) : `.` (regex)

  Note that both `NULL = NULL` and `NULL <> NULL` are false

### Aritmetic operators
  `+ - / % * ()` 


## Common clauses

### Order By

`order by column asc/desc` Orders the rows as specified
order by can be applied to multiple columns in different directions,
below statement will order by firstname descending then by last name ascending

```sql
order by
  first_name desc,
  last_name asc
```

### Limit

`limit C offset O` Limits results to C rows starting at Oth row

### Inner Join

Simply written as `join`, joins two tables on a set of conditions

```sql
select
  column
from
  table
join
  other_table
on
  conditions
```

### (outer) Left/right/full join

outer left/right join joins the tables in a slightly different way.

If we say `A left outer join B on C` we will get the same rows we would
get from `A join B on C`, but aditionally, whenever C doesnt hold, we will 
keep the row from A intact, with null values in the attributes from B.

If we use `A right outer join B on C`, it works like the left outer join,
with the difference being that here when C doesnt hold, we instead keep the
row from B intact, with null values in the attributes from A.

If we use `A full outer join B on C` we get both the properties of left/right
outer joins

A last type of join is the `A cross join B` which has no on clause, and simply produces the cartesian products of A and B.

## Aggregation functions 

  `Count()`
  `Min()`
  `Max()`
  `Avg()`
  `Sum()`

## Group by ... having ...

The group by having construct can be used to aggregate statments locally.

## Order of execution
1. `from join`
2. `where`
3. `group by`
4. `having`
5. `select`
6. `distinct`
7. `order by`
8. `limit offset`