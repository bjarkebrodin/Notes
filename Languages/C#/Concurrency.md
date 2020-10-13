---
title: c# concurrency
keywords:
---

# C# Concurrency

_Namespaces_ :
`System.Threading.Tasks`
`System.Threading`

## Concepts

_Race condition_ : 
If the timing of concurrent thread operations can result 
in nondeterministic behaviour, i.e. if the behaviour of the
program changes based on which thread modifies some shared
state first, we call this a race condition.

_Deadlock_ :
System operations halt due to a situation where all threads
are waiting for resources locked by some other thread.

_Speculative Execution_ :
Do task using a number of different algorithms
concurrently, whichever thread finishes first 
terminates the operation.

_I/O-bound_ :
we call an operation IO-bound if it spends most of its time waiting for IO.

_Compute-bound_ :
we call an operation Compute-bound if it spends most of its time doing computations.

_Spinning_ :
Repeatedly check if condition is satisfied.

_Blocking_ :
Synchronously awaiting some input, thus blocking the thread.

_Context switching_ :
Switching from the execution context of one thread to another, occurs for example when time-sliced allocations to threads switch.

_Oversubscription_ :
more active threads than processor cores.

## Threads 

```cs
sealed class Thread {
  string Name;
  ThreadState ThreadState;
  bool IsBackground;

  Thread(ThreadStart start);
  Thread(ParameterizedThreadStart start);
 
  void Start();
  void Start(Object);

  void Join();  

  boolean IsAlive();

}
```

execution path that can run independently of others.

Threads run in a single process, sharing the same
execution environment and memory.

Threads can be instantiated simply by passing a 
a delegate to a construction of a `Thread` object.

A `Thread` cannot be restarted after end of execution.

`Join()` will wait for the thread execution to finish, 
and rejoin the executionpath so to speak.

`Sleep(int ms)` sleeps the thread for a specified time.

If `Sleep` is called with a `0` timeframe, it will relinquish any time currently allocated to it.

`Thread.Yield()` will relinquish current time allocation to other threads running on the same processor.

Detect if a thread is currently being blocked through the `ThreadState` property. (nifty bitwise comparison) :
`bool blocked = (thread.ThreadState & ThreadState.WaitSleepJoin) != 0;`

#### Locks and thread safety

_Exclusive locks_ :
a lock can be used to synchronize operations on some ressource using the `lock (object) { ... }` construct. If the object is being used by a different thread when the execution of a thread arrives at the lock block, the thread will wait or block until the lock is freed.

Beware that reckless use of locks may cause the system to deadlock.

Any try/catch wrapped outside of thread scope has no effect on execution of the thread. Apply error handling within the scope of the thread. For WPF, UWP and Win Forms there are mechanisms for subscription to global exception handling functions available.

#### Foreground/background threads

Threads default to foreground.

Foreground threads keep the application alive for as long as any foreground thread is running. Background threads do not. Any background threads still running terminate upon termination of the last foreground thread.

Whether a Thread is foreground or background can be changed or queried using the `IsBackground` property.


#### ThreadPriority

Determines how much relative execution time is allowed the thread compared to theother thread objects.

Process priority can also be tweaked, processes that do heavy computation should not have too high priority since this might block other processes. While light processes such as UI processes can respond more efficiently given high priority.

#### Signaling

Signalling can be used to communicate events between threads.

#### Threadpools

Have a pool of ready threads, cutting the overhead of assigning new threads.

Pooled threads are always background.

## Tasks

To alleviate thread problems use `Task`. Allow return values and allow continued operation upon completion of first operation. Additionally `Thread` overhead is incredibly steep.

Tasks use pooled (thus background) threads by default.
`Task.Run(operation)`

If you want a non-pooled thread for your task, use 
`Task.Factory` and `TaskCreationOptions`.

Exceptions are propagated when using tasks. This is done by wrapping the inner exception using the `AggregateException` class, the inner exception can be accessed via the `InnerException` property.
