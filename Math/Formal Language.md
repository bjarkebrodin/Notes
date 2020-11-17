# Formal Language

We commonly use $\lambda$ in place of the empty string.

We define a phrase-structure grammar as $G=(V,T,S,P)$ where $P$ are productions, $V$ is vocabulary, $S$ is the start symbol and $T$ is the set of terminal symbols. We denote $V - T$ as $N$, and say that $N$ is the set on nonterminal symbols.

## Chomsky hierachy

let $\alpha,\beta$ be terminals, nonterminals or empty

let $\phi$ be terminals and nonterminals

let $A,B$ be nonterminals

let $a$ be terminals

Type 0 : recursively enumerable - any form : $\alpha \rightarrow \beta$

Type 1 : context-sensitive - $\alpha A \beta \rightarrow \alpha \phi \beta$

Type 2 : context-free - $A \rightarrow \phi$

Type 3 : regular - $A \rightarrow \alpha$ and $A \rightarrow \alpha B$


## Finite State Automata

We say $M = (S,I,f,s_0,F)$ where $S$ is the set of states, $I$ is the input alphabet, $f$ is the transition function where $f: S \times I \rightarrow S$, $s_0$ is the starting state, and $F$ is the set of final states (a subset of $S$).

If there is exactly one transition for each (input,state) pair, we say the machine is deterministic, otherwise we say it is nondeterministic.