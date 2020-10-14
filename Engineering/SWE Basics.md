---
title: Software engineering basics
keywords: 
---

# Software Engineering Basics

Software Engineering is a collection of techniques,
methodologies, and tools that help with the production of
a high quality software system developed with a given
budget before a given deadline while change occurs

## Why software engineering? Challenges of software

Developing quality software is hard!

From Brooks: 

_Complexity_ 
  Complexity of software leads to difficult
  communication, product flaws, bugs, mana-
  genment difficulties and much more.

_Conformity_
  Software needs to conform to the interfa-
  ces it seeks to interact with, this leads
  to added complexity.

_Changeability_
  Software is often pressured for extended 
  functionality -> requirements change as 
  the software is being developed.
  Additionally, software may outlive the 
  platform for which it was written.

_Invisibility_
  Software has no 1:1 physical manifestation that we can use to *look at a piece of software. This brings challenges in the comprehension of software systems.

## Activities of software engineering

_Modeling_, model system & application domain. This is the engineers tool for dealing with the complexities of the software. By modeling the application and solution domains we can not only better understand what we are dealing with, but also reason about our systems before we build them.

_Problem-solving_, formulate, analyze, discover, decide, specify. Many facets of software engineering include the activity of identifying, analyzing and implementing solutions to problems at hand.

_Knowledge aquisition_, collect & formalize information. A threat to the modeling activity is that any new piece of information may invalidate any amount of previously acquired knowledge. We say that knowledge acquisition is non-sequential.

_Rationale-management_, capture context of decisions for later use. When we revisit a decision we may better understand the implications of choosing differently if we have information about why the decision was made in the first place.


### Primary activities of software engineering
Specification
Development
Validation
Evolution

## Software proccess models

_Waterfall model_
  Plan-driven
  Distinct phases

_Incremental development_
  Interleaved cycles of specification, development and validation

_Reuse-oriented_
  Assemble system from existing components

_Scrum_
  Agile - do work in sprints

## Modeling

Need models of the _application domain_ to understand the domain in which we are building a system. We use application domain modeling to understand the environment we are building a system for.

Need models of the _solution domain_ to reason about possible systems to build, models are alot cheaper than software and allow us to discuss, analyze and design without having to invest in actually building.

## Engineering Activities overview

### Requirements Elicitation

Work products: system description in terms of actors and use cases.

We say an actor is an external entity interacting with the system.

In cooperation with the client, the system and its purpose is described.

Use cases, requirements

### Requirements Analysis

Work products: system model, correct, complete, consistent & unambiguous.

Analysis of use cases from previous phase, resolution of ambiguity and inconsistency. Transform into object models and dynamic models.

Class diagrams, state machine diagram, sequence diagram, (activity diagram?)

### System Design

Work products strategies, subsystem decomposition, design goals

During system design we decompose the system such that we can break into smaller teams and start building abstractions. We also select strategies such as hardware/software/data platform.

Deployment diagram, subsystem decomposition, class diagram, component diagram, package diagram.

### Object Design

Work products: Precise object model

We describe subsystem and object interfaces and select third party components. Here we try to achieve extensibility, understandability and optimality of performance.

class diagram, component diagram

### Implementation

Work products: source code

### Testing

Unit testing, integration testing, system testing, performance testing.

Work products: test suite, performance metrics, revised source code

## Management of software development

Communication
Rationale management
Configuration management
Project management