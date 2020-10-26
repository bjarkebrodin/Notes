# Coordination & Agreement

Occuring in distributed systems, are several types of problems that require the coordination of multiple processes. Note that for the scope of this document the following assumptions are generally made:

> $A1:$ A channel $c$ between any two processes $p,q$ is a _reliable channel_. That is any message sent from $p$ to $q$ eventually arrives.

> $A2:$ A process may fail only by crashing. Since omission failures are impossible by $A1$, this removes only byzantine failures.

For many practical purposes when coordinating messages, we need mechanisms for continuously diagnosing the state of the system. For this reason, algorithms for detecting failure are elementary. We distinguish between _reliable_ and _unreliable_ failure detection. We say a realiable detector will detect processes as either _unsuspected_ or _failed_ - where an unreliable one will only be able to detect _unsuspected_ or _suspected_. 

Every process $p_i$ broadcasts to all other processes that it has not crashed, at a regular interval $T$. Given an upper bound on transmission delay $D$, we can suspect $p_i$ after $T+D$ seconds since last sign of life from $p_i$. Note that for asynchronous systems, no such bound exists, thus we instead choose an observed estimate.

## Mutual exclusion

Mutual exclusion is a common problem in concurrency: we must manage access to a critical section $C$ between concurrent processes. Distributed mutual exclusion addresses the problem of achieving mutual exclusion between processes using only messagepassing. We start by defining properties that are desirable for algorithms solving this problem.

> $P1:$ _Safety_ - given any time $t$, either $0$ or $1$ processes are in $C$

> $P2:$ _Liveness_ - any process $p$ that has requested access to $C$ is eventually allowed to enter.

> $P3:$ _Order_ - for any two processes $p,q$, if $p$ requested access to $C$ before $q$, such that $\ p_{req} \ \tiny\begin{matrix}\rightarrow \\ HB\end{matrix} \normalsize \ \ q_{req}$, then $p$ will also be allowed to enter $C$ before $q$.

#### Performance Metrics

_Bandwidth_ : amount of messages required at entry/exit
_Client delay_ :  ??
_Synchronization delay_ : delay from when one process exits $C$ until the next process enters.

### Centralized access manager

In addition to $A_1,A_2,A_3$ we add for simplicity the assumptions that any process spends finite time in $C$ once granted access, that no processes fail and that the system is asynchronous.

Choose a node $s$ to act as server, have $s$ manage access to $C$. 

```
receive ( request, sender )
    if queue is empty: grant ( sender )
    else: queue request

receive ( release )
    if queue is not empty: grant ( queue.dequeue )
```

By the assumptions it is simple to prove $P_1, P_2$, we notice however, that requests are not necessarily related by happened-before, thus we do not get $P_3$.

Bandwidth use: 3 messages pr. entry/exit _(request,grant,release)_
Client delay: Round-trip to server _(request,grant)_
Sync delay: Round-trip to server _(release,grant)_


### Ring-based

Construct a logical ring such that any process $p$ has a channel to the next process in the ring $q$.

```
receive ( token )
    if ( state == wanted ): enter C
    forward ( token )
```

Has $P_1, P_2$ trivially - however messages may be passed outside the token ring, thus we do not get $P_3$

Bandwidth: Infinity - token is continuously passed around
Client delay: $O(N)$, worst case just forwarded token
Synchronization delay: $O(N)$, worst case next process entering is same as just left


### Ricart & Agrawala



### Maekawa



## Election 



## Agreement 