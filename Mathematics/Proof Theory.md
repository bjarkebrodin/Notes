# Proof Theory

## Principle of Mathematical Induction

Let $P(n)$ be a property defined for $n \in Z$ then

$(P(a) \land \forall k \ge a (P(k) \rightarrow P(k+1))) \rightarrow \forall n \ge a (P(n))$

### Method of proof

For a statement of the type $\forall n \ge a ( P(n))$ where $n,a\in Z$

__Step 1__: Show $P(a)$ *(base case or basis step)*
__Step 2__: Suppose that $P(k)$ is true, for some arbitrary $k$ such that $k >= a$ *(we call this the inductive hypothesis)*
__Step 3__: Using the inductive hypothesis show that $P(k+1)$ is also true. Having done all these steps we have can invoke the principle of induction, and will have proven $\forall k \ge a (P(k) \rightarrow P(k+1))$.