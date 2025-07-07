---
title: Domain-Driven Design Starter Modelling Process
---

A step-by-step guide for learning and practically applying each aspect of Domain-Driven Design (DDD) - from orienting
around an organisation's business model to coding a domain model.

{% linkpreview "https://github.com/ddd-crew/ddd-starter-modelling-process" %}


## The Process

The modelling process is composed of 8 steps which can be grouped into 4 distinct phases:

1. Align & Understand
2. Strategic Architecture
3. Strategy & Org Design
4. Tactical Architecture

{% include figure popup=true image_path="/assets/images/ddd/ddd-starter-modelling-process-colored.png" alt="DDD Starter Modelling Process image" %}

Watch the talk by Maxime Sanglan-Charlier on DDD Europe conference for an introduction of the DDD Starter Modelling
Process.

{% include video id="qeir72soorI" provider="youtube" %}

This process is not an all-or-nothing deal. You can apply the ideas from DDD as much or as little as you feel is beneficial to the project you're working on.
{: .notice--info}

## Align & Understand

In order to design, build, and evolve software systems most effectively, our decisions need to create the optimal
business impact, which can only be achieved if we are aligned to the business goals, as well as supporting the users
current and potential future needs.

### Understand

Understand the organisation's business model, the needs of its users, and its short, medium, and long-term
goals.

1. Create a short product or feature brief to frame and constrain the project.
2. Identify key capabilities and high level goals and objectives of the project.

#### Opportunity Canvas

The opportunity canvas will ask you to understand the problem you’re solving and the user you’re solving it for.

{% include figure popup=true image_path="/assets/images/ddd/opportunity_canvas.jpg" alt="Opportunity Canvas image" %}

{% linkpreview "https://jpattonassociates.com/opportunity-canvas/" %}

### Discover

Discover the domain visually and collaboratively spreading domain knowledge through the whole team to create a shared
understanding of the product to build.

It enables the developers to build a software system aligned to the domain which can be more flexible to incorporate
future business changes.

#### User Story Mapping
User story mapping is a collaborative technique to discover the domain and its key concepts, as well as the
relationships between them. It is a great way to align the team on the problem space and the solution space.

{% linkpreview "https://jpattonassociates.com/story-mapping/" %}

## Strategic Architecture

Strategic Domain-driven Design (DDD) has become an established practice for system decomposition and service
identification in recent years. 

{% include video id="Q_0XW46IlHY" provider="youtube" %}

### Decompose

How to decompose software systems into cohesive modules (or components and services) that are loosely coupled is one of
the classic questions and challenges in software engineering. 

Achieving high cohesion within the services and loose coupling between them is crucial to keep the application scalable
and maintainable.

We decompose a large problem domain into sub-domains (loosely-coupled parts of the domain) for a few key reasons:

- Reduced cognitive load, so that we can reason about parts of the domain independently.
- Identifying loose-coupling and high-cohesion in the domain which carries over to our software architecture and
  team structure.
- Give development teams autonomy, so that they can work on separate parts of the solution

{% include figure popup=true image_path="/assets/images/ddd/decompose.png" alt="Opportunity Canvas image" %}

## Strategy & Org Design

Define sub-domains - parts of the domain you want to invest on - and the most suitable organisation design and team 
structure.

### Strategize

Strategically map out your sub-domains to identify core domains: the parts of the domain which have the greatest
potential for business differentiation or strategic significance.

{% linkpreview "https://vladikk.com/2018/01/26/revisiting-the-basics-of-ddd/" %}

#### Core Domain Charts

{% linkpreview "https://github.com/ddd-crew/core-domain-charts" %}






