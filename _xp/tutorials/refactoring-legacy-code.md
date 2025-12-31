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

Always run your tests after each change to ensure stability. This practice confirms that refactoring has not altered
expected behavior, and provides confidence to proceed with further improvements.

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

The key technique here is [Extract Method]. Identify related blocks of code, and move them into their own methods. For
example:

- A block setting up a document node.
- A loop processing elements.
- A block closing the JSON string.

Each extraction simplifies the main method, turning tangled logic into a sequence of clear steps.

Refactoring is about small, reversible improvements. After every working change, commit your code. Even if you stop
early, the code should already be in a better state. 

**Follow the Boy Scout Rule:** leave the code cleaner than you found it.
{: .notice--warning}

### Composing Methods

Once complexity is reduced, focus on composing methods — give each method a descriptive name and organize them so that
each one clearly describes what it does. This helps clarify intent and makes the code easier to reason about.

For instance, a `getJsonForDoc()` method might have three clear steps:

1. Get the node to parse using `getNode()`.
2. Process each element with `processElement()`.
3. Close the JSON string via `closeJson()`.

This makes the method self-documenting. You no longer need verbose comments — the structure and names tell the whole 
story.

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

This episode concludes the series on refactoring legacy code. Earlier parts covered the first three steps of his 
four-step process: removing clutter, reducing cyclomatic complexity, and composing methods. The final step takes these
improvements further by introducing automated tests — and seeing how they immediately surface hidden bugs.

Dave begins by introducing some further refactorings to the codebase to improve testability. I'm providing my own
summary of the key techniques he demonstrates.

#### Replace Function with Command

[Replace Function with Command] aka [Replace Method with Method Object] encapsulates behavior in command objects for better testability.

1. Extract method `toJsonString(String, Element)` to convert a Document element to JSON string.
2. Create class `DocumentElement` to represent document elements - encapsulates related data and behavior.
3. Add `DocumentElement` as parameter to `toJsonString` method.
4. Inline method `hasChildren` - make the code accessible from `toJsonString` method.
5. Convert `toJsonString` method to an instance method of `DocumentElement` - improve encapsulation and support polymorphism.
6. Extract method `hasChildren` in `DocumentElement` class.
7. Create constructor `DocumentElement(String)` - pass arguments to the command on the constructor.
8. Use `xPathString` field in `toJsonString` method - utilize instance fields for better encapsulation.
9. Safe delete `xPathString` parameter from `toJsonString` method - remove unused parameters to clean up the method signature.
10. Add `Element` parameter to `DocumentElement` constructor - ensure all necessary data is provided at instantiation.
11. Use `element` field in `toJsonString` method - utilize instance fields for better encapsulation.
12. Safe delete `element` parameter from `toJsonString` method - further clean up the method signature.
13. Introduce field `jsonString` to store the result of `toJsonString` method - maintain state within the command object.
14. Introduce field `elementName` to store the element name - move the function state into the command object.
15. Introduce field `attributes` to store the element attributes - move the function state into the command object.
16. Introduce field `title` to store the element title - move the function state into the command object.
17. Introduce field `file` to store the element filename - move the function state into the command object.
18. Extract method `processDocAttributes` in `DocumentElement` class - break down `toJsonString` methods into smaller pieces.
19. Extract method `addStateClosed` in `DocumentElement` class - compose method to handle state closing logic.
20. Extract method `closeElement` in `DocumentElement` class - compose method to handle element closing logic.
21. Extract method `processFolderAttributes` in `DocumentElement` class - break down `toJsonString` methods into smaller pieces.

#### Replace Conditional with Polymorphism

Refactoring technique to eliminate conditionals based on type codes by using subclasses and polymorphism.

1. Extract method `processElement()` in `DocumentElement` class - extract conditional statement into its own method.
2. [Encapsulate variable] `elementName` - self-encapsulate the type code.
3. [Replace Constructor with Factory Function] aka Replace Constructor with Factory Method - use factory methods to
  create an instance of `DocumentElement`.
4. Create `DocElement` subclass and add selector logic for `doc` type code value in the factory method.
5. Override the type code getter in `DocElement` class to return the literal type code value.

   Ensure the subclass is being used by altering the return value of the `getElemName()` override and testing again to
   ensure the test fails. Confirm success by restoring the correct return value and running the test again.
   {:.notice--success}

6. Create `FolderElement` subclass and add selector logic for `folder` type code value in the factory method. 
7. Override the type code getter in `FolderElement` class to return the literal type code value.
8. Remove type code field `elementName` from `DocumentElement` class - eliminate redundant type code field.
9. Add default branch in the factory method to handle unexpected type code values.
10. Make `getElementName` an abstract method and `DocumentElement` an abstract class - enforce implementation in 
    subclasses.
11. Override `processElement` method in `DocElement` class. Copy the relevant logic from the conditional statement.
12. Override `processElement` method in `FolderElement` class. Copy the relevant logic from the conditional statement.
13. Declare `processElement` method in `DocumentElement` class as abstract - enforce implementation in subclasses.
14. Safe delete `getElementName` method from `DocumentElement` class and its subclasses - clean up unused methods.
15. [Push Down Method] `hasChildren` to `DocElement` class - move method to the subclass where it's relevant.


[Continuous Delivery Training]: https://courses.cd.training/
[Refactoring Legacy Code tutorial]:https://courses.cd.training/courses/refactoring-tutorial/
[Creating a repository from a template]:https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template#creating-a-repository-from-a-template
[Extract Method]:https://refactoring.com/catalog/extractFunction.html
[Replace Function with Command]: https://refactoring.guru/replace-function-with-command
[Replace Method with Method Object]: https://refactoring.guru/replace-method-with-method-object
[Replace Conditional with Polymorphism]: https://refactoring.com/catalog/replaceConditionalWithPolymorphism.html
[Replace Type Code with Subclasses]: https://refactoring.com/catalog/replaceTypeCodeWithSubclasses.html
[Encapsulate Variable]: https://refactoring.com/catalog/encapsulateVariable.html
[Replace Constructor with Factory Function]: https://refactoring.com/catalog/replaceConstructorWithFactoryFunction.html
[Push Down Method]: https://refactoring.com/catalog/pushDownMethod.html





