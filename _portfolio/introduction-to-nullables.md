---
title: Introduction to Nullables Learning Hour
header:
    teaser: assets/images/technical-coaching/samman_Submark_dark_blue_small-teaser.png
order: 7
---

Learn how to replace mocks with [Nullables] — a testing technique created by James Shore — for faster tests that support refactoring instead of hindering it.

This Learning Hour was created by [Lada Kesseler] as part of the [Samman Technical Coaching](https://sammancoaching.org/) programme.

I really enjoyed attending Lada's session, and I now use this Learning Hour to coach software development teams in Java and C#. I put together this adaptation to experiment with a few improvements of my own — without impacting Lada's original work. Thank you, Lada, for sharing it!

## Why Nullables

If you refactor often, you want fast tests that don't fail for the wrong reasons and don't hinder refactoring. Lada describes Nullables as one of her favourite tools for exactly that:

> Before I came across Nullables, my main approach here was refactoring toward hexagonal architecture to eliminate slow and fragile infrastructure dependencies. That works, but it can take significant effort, and it doesn't make much sense for CRUD-based apps without much domain logic.
>
> Nullables, by contrast, are something you can start applying almost immediately to gradually improve an existing test suite, and unlike mocking libraries they lead to antifragile tests.

This session gives an initial introduction to how to use them.

## Learning goals

- Understand what a Nullable is and how it differs from a mock.
- Use a ready-made Nullable to write a unit test.
- Give a class its own `createNull()` factory and use it to control and observe its behaviour.

## What you'll do

Working through a small Library kata in Java, you'll start from Mockito-based tests of a legacy `Library` class, rewrite them using a ready-made Nullable, and finally give the class its own `createNull()` factory method.

[Access Learning Hour](https://ibanfr.github.io/introduction-to-nullables-LH/){: .btn .btn--primary .btn--x-large}


[Nullables]: https://www.jamesshore.com/v2/projects/nullables
[Lada Kesseler]: https://github.com/lexler
