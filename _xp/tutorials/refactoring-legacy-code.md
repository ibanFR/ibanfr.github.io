---
title: Refactoring Legacy Code
---

This is a free video tutorial on refactoring legacy code by Continuous Delivery Training.

It covers techniques and best practices for improving and maintaining legacy codebases, making them more manageable and
easier to work with.

## Continuous Delivery Training

[Continuous Delivery Training] offers a variety of courses focused on software development practices, including
Continuous Integration, Continuous Delivery, DevOps, and Agile methodologies.

Their courses are designed to help developers and teams improve their skills and adopt best practices in software
development.

{% linkpreview "https://courses.cd.training" %}

## Sign up and access the tutorial

Navigate to the list of courses and select the Refactoring Legacy Code tutorial.

{% linkpreview "https://courses.cd.training/courses/refactoring-tutorial/" %}

The course includes 5 lessons, providing 1 hour of practical video content.

Enroll for free to create an account and access the Refactoring Legacy Code tutorial.

{% include figure popup=true image_path="assets/images/xp/tutorials/enroll-refactoring-legacy-code-tutorial.png"
alt="Enroll to Refactoring Legacy Code screenshot" caption="Enroll to Refactoring Legacy Code Tutorial" %}

The Continuous Delivery Training leaves your enrollment active for 1 month, which is usually enough time to complete the
tutorial.

## GitHub Repository

The code examples for the tutorial are available on GitHub as a template repository:

{% linkpreview "https://github.com/davef77/RefactoringBadCode" %}

You can generate a new repository with the same directory structure and files as the template.

See GitHub's documentation for [Creating a repository from a template].

## Four Steps to Refactoring

Dave outlines four key steps to refactoring legacy code safely:

1. Removing Clutter
2. Reducing Complexity
3. Composing Methods
4. Refactoring to Testability

## Part 1: Approval Testing and Removing Clutter

{% include video id="p-oWHEfXEVs" provider="youtube" %}

### Approval Testing

Approval Testing is a technique used to verify that the behavior of a system remains unchanged after refactoring.

It involves capturing the current output of the system and comparing it to the output after changes have been made.

How it works:

- Capture the output of the code under test.
- Save this “approved” output to disk.
- On subsequent runs, compare the new output to the approved one.
- If they match, the test passes. If not, the test fails.

This is especially useful when dealing with legacy code, where the original intent and functionality may not be well
documented and traditional unit testing is difficult.

Dave demonstrates:

- Creating an approval test for a class `XMLToJSON`.
- Using sample input data based on comments in the original code.
- Running the test to confirm expected behavior.

Afterward, he checks code coverage – achieving ~66% method coverage and ~85% line coverage, which he considers
sufficient to proceed with cautious refactoring.

### Removing Clutter

The first step in refactoring is cleaning up unnecessary code and comments:

- Delete redundant comments: Those that merely restate what the code does.
- Remove dead code: Unused or commented-out sections.
- Simplify variable names: Rename variables to be self-explanatory (e.g., `url` → `urlToTOC`).
- Extract small methods: For clarity, such as converting inline logic into helper methods (e.g., `hasChildren()`).

After cleaning up, he reruns the approval tests – confirming everything still works. Code coverage even improves
slightly (from ~85% to ~89%).

### Summary & Key Lessons

- Approval Testing provides a strong safety net for refactoring legacy code without changing behavior.
- Removing Clutter improves readability, reduces noise, and clarifies structure.
- Version Control is essential for maintaining stability through small, incremental changes.
- Work in Tiny Steps: Commit after each successful test to maintain a safe rollback point.

## Part 2: Reducing Complexity and Composing Methods

{% include video id="NCjwUptCaLU" provider="youtube" %}

### Reducing Complexity

### Composing Methods

## Part 3: Refactoring to Testability

{% include video id="3iirETgRaRc" provider="youtube" %}

### Refactoring to Testability


[Continuous Delivery Training]: https://courses.cd.training/
[Creating a repository from a template]:https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template#creating-a-repository-from-a-template





