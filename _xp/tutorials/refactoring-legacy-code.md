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

## Sign up and access the tutorial

Navigate to the list of courses and select the [Refactoring Legacy Code tutorial].

Enroll for free to create an account and access the Refactoring Legacy Code tutorial.

{% include figure popup=true image_path="assets/images/xp/tutorials/enroll-refactoring-legacy-code-tutorial.png"
alt="Enroll to Refactoring Legacy Code screenshot" caption="Enroll to Refactoring Legacy Code Tutorial" %}

**Note:** The Continuous Delivery Training leaves your enrollment active for 1 month, which is usually enough time to 
complete the tutorial.
{: .notice--warning}

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

### Removing Clutter

The first step in refactoring is cleaning up unnecessary code and comments:

- Delete redundant comments: Those that merely restate what the code does.
- Remove dead code: Unused or commented-out sections.
- Simplify variable names: Rename variables to be self-explanatory (e.g., `url` → `urlToTOC`).
- Extract small methods: For clarity, such as converting inline logic into helper methods (e.g., `hasChildren()`).

Always run your tests after each change to ensure stability. This practice helps catch regressions early, confirms that
refactoring has not altered expected behavior, and provides confidence to proceed with further improvements.

Automated tests act as a safety net, allowing you to make incremental changes and quickly identify issues, making the
refactoring process safer and more efficient.

{% capture notice-text %}

- **Approval Testing provides a strong safety net** for refactoring legacy code without changing behavior.
- **Removing Clutter improves readability**, reduces noise, and clarifies structure.
- **Version Control is essential** for maintaining stability through small, incremental changes.
- **Work in Tiny Steps**: Commit after each successful test to maintain a safe rollback point.

{% endcapture %}

<div class="notice--info">
  <h4 class="no_toc">Summary & Key Lessons:</h4>
  {{ notice-text | markdownify }}
</div>


## Part 2: Reducing Complexity and Composing Methods

{% include video id="NCjwUptCaLU" provider="youtube" %}

### Reducing Complexity

Once you’ve cleared away obvious clutter, focus on reducing cyclomatic complexity — the number of paths through your
code. Deeply nested loops and conditionals often signal that your code is too complex.

The key technique here is [Extract Method]. Identify related blocks of code, move them into their own methods, and give
those methods descriptive names.

This helps clarify intent and makes the code easier to reason about. For example:

- A block setting up a document node becomes `getNode()`.
- A loop processing elements becomes `processElement()`.
- A block closing the JSON string becomes `closeJson()`.

Each extraction simplifies the main method, turning tangled logic into a sequence of clear steps.

Refactoring is about small, reversible improvements. After every working change, commit your code. Even if you stop
early, the code should already be in a better state. 

**Follow the Boy Scout Rule:** leave the code cleaner than you found it.
{: .notice--warning}

### Composing Methods

Once complexity is reduced, focus on composing methods — organizing them so that each one clearly describes what it
does. 

For instance, a `getJsonForDoc()` method might have three clear steps:

1. Get the node to parse.
2. Process each element.
3. Close the JSON string.

This makes the method self-documenting. You no longer need verbose comments — the structure and names tell the story.

{% capture notice-text %}

- **Reduce cyclomatic complexity** by extracting methods and naming them clearly.
- **Use small, safe steps** — refactor incrementally and test often.
- **Leverage simple refactorings** like Rename and Extract Method for big impact.
- **Compose methods to tell a story** — make your code self-documenting.
- **Leave the code better than you found it** every time you make a change.
- **Aim for progress, not perfection** — good refactoring is incremental, not revolutionary.

{% endcapture %}

<div class="notice--info">
  <h4 class="no_toc">Summary & Key Lessons:</h4>
  {{ notice-text | markdownify }}
</div>

## Part 3: Refactoring to Testability

{% include video id="3iirETgRaRc" provider="youtube" %}

### Refactoring to Testability

This episode concludes the series on refactoring legacy code. Earlier parts covered the first three steps of his 
four-step process: removing clutter, reducing cyclomatic complexity, and composing methods. The final step takes these
improvements further by introducing automated tests — and seeing how they immediately surface hidden bugs.

Dave begins by introducing some further refactorings to `processElement(String, Element)` method to improve testability.


[Continuous Delivery Training]: https://courses.cd.training/
[Refactoring Legacy Code tutorial]:https://courses.cd.training/courses/refactoring-tutorial/
[Creating a repository from a template]:https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template#creating-a-repository-from-a-template
[Extract Method]:https://refactoring.com/catalog/extractFunction.html





