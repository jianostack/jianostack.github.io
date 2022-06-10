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

What's an inode?

Index node is the disk block location of a file.

What's the angle between clock faces when it's 3:15?

Write a C function that returns angle between clock faces for any (hour, minute).

Write a binary tree.

How would you troubleshoot this problem - network diagram presented.

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

What does Vim stand for?
VI improved. VI stand for visual.

Tell me all the HTTP status code you know?

If you had an application that being load balanced but was giving erros like redirecting too many times or giving expired session warnings, what do you think the problem could be?

Who created Linux?

Diff between Unix and Linux?

## Why DevOps?
I enjoy creating automated tasks and making effecient use of time.

## Dockerfile RUN
The RUN instruction will execute any commands in a new layer on top of the current image and commit the results. The resulting committed image will be used for the next step in the Dockerfile.

## Dockerfile CMD
There can only be one CMD instruction in a Dockerfile.
The main purpose of a CMD is to provide defaults for an executing container (ENTRYPOINT).

## Dockerfile ENTRYPOINT
An ENTRYPOINT allows you to configure a container that will run as an executable. It will insert custom arguements into CMD.

## NAT gateway
Network Address Translation (NAT) service. It can be used to connect instances in a private subnet to services outside your VPC.
Public NAT gateways allow instances to connect to the internet.
Private NAT gateway allow instances to connect to other VPCs or on-premises networks.

## How do you challenge others with different opinions?
Listen carefully. Put myself in their shoes. Ask questions. Clarify assumptions. Defend my case with examples. Be patient.

## What is a difficult problem you have solved in DevOps?
Outgoing static IP on AWS ECS Fargate launch type.

## How do you keep up with new tech?
Security blogs (Google online security, Schneier)
DevOps (Scripting OSX, Delicious brains, Laravel news)
Leaders (Matt Mullenweg, Open Gov, Raspberry Pi news, James Clear)
Finance (Singsaver, dr wealth, woke salaryman)
Other (noobcookbook, soup diaries)

## Are curious & always learning. What are you up to right now?
Telegram bots.

## What is your biggest failure?
AWS DevOps professional exam.

## Thrive on challenge. When was the last time you failed?
Yummy bros AWS budget under estimation.

## Can deal with constant change. When were you last surprised?

## Have mastered at least one skill of your trade but you’re not defined by it. What can you teach us?

## Prepare a few short stories and highlights of your career and practice telling those stories.

Digital product
Unstoppable domains
Revisit news
Terraform on AWS
Kubernetes EKS https://github.com/kelseyhightower/kubernetes-the-hard-way
Dockerfile security root user bad
Dockerfile standards for developers

## DevOps roadmap

https://roadmap.sh/devops
