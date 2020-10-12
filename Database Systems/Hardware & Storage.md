---
title: Hardware & storage
keywords: storage
---

# Hardware & storage

TL;DR - Sequential access is faster, SSDs are fast but dodgy, 


## Utopian properties of perfect computer memory
- unlimited capacity
- instant random access
- unlimited bandwidth for sequential access
- free
- persistent, always

## Storage hierarchy

### Properties of storage layers

Layer | Access time/latency (typical) | Capacity (typical)
-|-|-
Core registers | 1 cyc | 16x8B 16x32B(SIMD)
L1 | 4 cyc | 32KB
L2 | 10 cyc | 256KB
L3 | 60 cyc | 8 MB
Main memory | 60 ns | 16GB
Hdd/ssd | 5ms | 256GB - 2TB

NB. Differs alot - persistent storage can have internal hierarchy. In distributed settings (cloud e.g.) we can have both local and remote persistent storage.

_Inclusion property_
$L1 \subset L2 \subset L3 \subset RAM \subset HDD$
Some systems don't require this at all times but usually you have this.

As you go up the layers (from core and up), the capacity increases, access time and cost decreases. 
As you go down the layers (towards the core), the access time increases. bandwidth and cost increases as well.

Storage layers do..
- localization of data objects
- caching of lower level data: inclusion
- data replacement strategies
- writing modified data (write-through/write-back)
write-through: immediate
write-back: lazy (wait until dropped from cache then write-back modification)

## Multicore storage

Each core has own register and L1, L2 caches - Typically shared L3 cache

### NUMA (Non-uniform memory access)

Multiple CPUs with cores sharing L3. RAM partitioned and split between CPUs. L3 can accessed between CPUs, RAM partitions can be accessed between CPUs. An L3 local to a cpu we say is local, if it is not we say it is remote. A RAM partition local to a cpu we say is local and remote in a likewise manner.

## Storage media

### Tape
Slow wind (up to 100 sec)
Decent bandwidth (100MB/s sequential)
Only allows sequential access (no random access)

### HDD
Magnetic _platters_ connected to a _spindle_.
_Arm_ moves all disks simultaneously, _disk heads_ read from one platter at a time.
Similar _tracks_ on all platters form a _cylinder_.
Tracks are composed of _blocks_, which is the unit or read/write.
Blocks are composed of _sectores_ of a fixed size.
We say a _sector_ is typically a 4KB block of data.
Outer edges of platter have higher bandwidth.
(nb. OS block is different concept than harddisk block)

  _CHS Addressing_: (cylinder, head, sector)

  _LBA (logical block addressing)_ : logical block number, maybe the proximity holds through mapping. i.e. $1_{LBA}, 2_{LBA} ?\rightarrow (0,0,1)_{CHS}, (0,0,2)_{CHS}$ 

Many erroneus blocks impact harddisk performance negatively.
We measure disk performance in bandwidth and disk latency.

_seek time_ : moving the disk arm to the right track
_rotational delay_ : delay before reaching desired block on track
_transfer time_ : transfer timepr block

for performance: minimize seek time & rotational delay.

Sequential read on a hdd (propagation of sequence): 
  reach the first desired block,
  read adjacent blocks on the same track,
  read blocks on the same cylinder,
  read blocks on adjacent cylinder.

### SSD

Interconnected flash chips
Efficient random access
INternal parallelism
Harddisk compatible API

We cannot overwrite a unit before erasing it first.
We garbage collect unused blocks as they accumulate.

_Write amplification_ : actual data written can be much greater than expected data written, this happens because of the property that we cannot overwrite units without first erasing it. Thus a write operation might trigger both multiple (re)writes and potentially garbage collection.

_Wear leveling_ : Some cells/blocks die over time if written to repeatedly.

_Unpredictable read/write latencies_ : garbage collection and overwrite complexity contribute to this.

### RAM

almost constant random access latency

_volatility_: will loose data on power loss

_prefetching_: sequential access is still slightly faster because hardware prefetches adjacent blocks


### Access Granularity

RAM <-> Disk : minimum one disk block fetched (4KB)

RAM <-> Cache : cache-line (64 bytes)

Cache <-> Register : 4-8 byte words (depending on architecture)

## Parallelism

_thread_ a thread of execution

_multithreading_ multiple threads share execution cycles on the same core. 
One physical core supporting multiple logical cores (hyperthreading in intel)

_multicore_ multiple threads running in parallel on multiple cores

multi-socket multicore systems exhibit _NUMA_ (non-uniform memory access). 
This means that cores has R/W access to both local and remote memory.

Implicit parallelism minimizes stall time by doing work while waiting for data transfers.

_SIMD_ Single instruction multiple data.

GPUs utilize SIMD to apply a single instruction to a whole matrix of data.


## Operating systems basics

Purpose of OS: Harware resource management

_user space_
ui/libraries 

_kernel space_
system call interface
process management | memory management
file system | network stack
device drivers
processor-dependent kernel code

Infinity core illusion is accomplished through _context-switching_

_Memory virtualization_ gives the illusion of infinite memory


## Storage hierarchy models

### Single-core storage hierarchy

```sh
        |     core      |
        | | registers | |
        | L1-I  |  L1-D | 
      |        L2         |
    |          L3           |
  |        Main Memory        |
|      Persistent Storage       |
```


### Multi-core storage hierarchy

```sh
        |     core      |        |     core      |
        | | registers | |        | | registers | |
        | L1-I  |  L1-D |        | L1-I  |  L1-D |
      |        L2         |    |        L2         |

    |                       L3                        |
  |                     Main Memory                     |
|                   Persistent Storage                    |
```

###  Multi-socket multicore storage hierarchy

```sh
        |     core      |        |     core      |             |     core      |        |     core      |       
        | | registers | |        | | registers | |             | | registers | |        | | registers | |       
        | L1-I  |  L1-D |        | L1-I  |  L1-D |             | L1-I  |  L1-D |        | L1-I  |  L1-D |       
      |        L2         |    |        L2         |         |        L2         |    |        L2         |     
    |                       L3                        |    |                       L3                        |  
  |                     Main Memory                     ||                     Main Memory                     |

|                                               Persistent Storage                                               |
```