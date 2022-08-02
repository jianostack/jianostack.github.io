# DevOps notes

### How does DNS work?
Upon checking local cache, ISP cache, DNS cache the final source will be a root DNS.

### How do DNS servers propagate?
Domain service provider sends update to root DNS server which then propagates to DNSs, ISPs and then your local DNS cache.

### What is a container
Containers allow applications and it's dependencies to be wrapped together and deployed in the container process above the server's OS.

### CPU threads
CPU threads allow processes to be run in parallel. The number of CPU threads is double the cores of a CPU. E.g. 2 cores has 4 threads.

### MYSQL indexing pros and cons
PROS speeds up selects
CONS slows down inserts, updates and deletes. Increased RAM.

## What's an inode?
Index node is the disk block location of a file.

What's the angle between clock faces when it's 3:15?

Write a C function that returns angle between clock faces for any (hour, minute).

Write a binary tree.

What's the difference between a router and switch?

Implement a routine in C that counts number of characters in a string.

Given 100GB file and a computer with 1GB of memory, how would you sort it.

Can you make it parallel and solve it on 100 computers?

What's a priority queue?

How does BGP work?

Can DNS use TCP? In which cases DNS uses TCP?

Implement set difference in any language you like.

How does HTTP work?

How does 3 way handshake work in TCP?

What's void ?

What's the sticky bit?

What's the system call for creating files?

Order by execution time: reading disk, accessing memory, context switch, writing a cpu register.

## What does Vim stand for?
VI improved. VI stand for visual.

Tell me all the HTTP status code you know?

If you had an application that being load balanced but was giving erros like redirecting too many times or giving expired session warnings, what do you think the problem could be?

## Who created Linux?
Linus Torvalds

## Diff between Unix and Linux?
Unix came first. 

## NAT gateway
Network Address Translation (NAT) service. It can be used to connect instances in a private subnet to services outside your VPC. Public NAT gateways allow instances to connect to the internet. Private NAT gateway allow instances to connect to other VPCs or on-premises networks.
