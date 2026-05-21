---
title: "Using GitHub Copilot"
date: 2026-03-23
header:
  overlay_image: /assets/images/getxo-gorrondatxe.jpg
  show_overlay_excerpt: false
categories:
  - AI
tags:
  - GitHub Copilot
---

This guide explains how to use GitHub Copilot to assist you in writing code more efficiently.

## What is GitHub Copilot?

GitHub Copilot is an AI coding assistant that helps you write code faster and with less effort.

For full details of what Copilot can do, see [What is GitHub Copilot?].

## Setting up Copilot

Copilot can be used through multiple interfaces. Configure the one that best aligns with your development process — or
try all of them!

### Setting up Copilot in your IDE

To start using GitHub Copilot, you need to install the GitHub Copilot extension in your IDE.
See [Installing the GitHub Copilot extension in your environment].

### Setting up Copilot for the command line

If you want to use Copilot in the command line, install the Copilot extension for the GitHub CLI.
See [Installing GitHub Copilot CLI].

### Setting up Copilot on GitHub.com

GitHub Copilot is also available directly on GitHub.com, without any local installation. You can use Copilot Chat in
the browser to ask questions, generate code, and get explanations in the context of any repository.

See [Using GitHub Copilot on GitHub.com] for more details.

## Best practices for using Copilot

To learn how to get the most out of GitHub Copilot, see [Best practices for using GitHub Copilot]
and [Prompt engineering for GitHub Copilot Chat].

## Customizing Copilot responses

GitHub Copilot can generate responses that match your personal preferences, team workflows, tools, or project
requirements—if you give it enough context. Instead of repeating this information in every prompt, you can set up custom
instructions to automatically include these details.

For more information on how to customize Copilot responses, see [About customizing GitHub Copilot responses].

### Adding personal custom instructions for GitHub Copilot

You can add personal custom instructions for GitHub Copilot in your GitHub account settings. This allows you to provide
GitHub Copilot with information about your coding style, preferences, and any specific requirements you have for the
generated code.

For example:

```markdown

## Language Preferences

- Always use **Java** for code examples unless I explicitly request another language.
- Use Java 17+ features when applicable (records, sealed classes, pattern matching).

## Response Format

- Keep explanations concise; prioritize code examples.
- Show before/after when suggesting refactors.
- Highlight potential edge cases or pitfalls.

## Code Style & Principles

### Clean Code (Robert C. Martin)

- Use meaningful, intention-revealing names for variables, methods, and classes.
- Keep functions small and focused on a single task.
- Prefer expressive code over comments; code should be self-documenting.
- Avoid magic numbers and strings; use named constants.
- Follow the Boy Scout Rule: leave code cleaner than you found it.

### KISS over DRY

- Prioritize **simplicity and readability** over eliminating duplication.
- Only extract shared code when duplication is proven problematic (Rule of Three).
- Avoid premature abstractions that add complexity.

### SOLID Principles

- **S**ingle Responsibility: Each class should have one reason to change.
- **O**pen/Closed: Classes should be open for extension, closed for modification.
- **L**iskov Substitution: Subtypes must be substitutable for their base types.
- **I**nterface Segregation: Prefer small, specific interfaces over large general ones.
- **D**ependency Inversion: Depend on abstractions, not concrete implementations.

### Domain-Driven Design (DDD)

- Use **Ubiquitous Language**: Name classes, methods, and variables using domain terminology.
- Structure code around **Bounded Contexts**.
- Distinguish between:
    - **Entities** (identity matters)
    - **Value Objects** (immutable, equality by value)
    - **Aggregates** (consistency boundaries)
    - **Domain Services** (stateless domain logic)
    - **Repositories** (collection-like persistence abstraction)
    - **Application Services** (orchestration, no domain logic)
- Keep domain logic in the domain layer; avoid anemic domain models.
- Use **Domain Events** for cross-aggregate communication.

## Code Quality Standards

When writing functions, always:

- Add descriptive Javadoc comments with @param and @return tags.
- Include input validation at method boundaries.
- Use early returns for error conditions (guard clauses).
- Use meaningful, intention-revealing variable names.
- Include at least one example usage in comments.

## Testing

- Prefer JUnit 5 with AssertJ for assertions.
- Use Given-When-Then structure in test method names.
- One assertion concept per test.

```

For more information on how to add personal custom instructions for GitHub Copilot,
see [Adding personal custom instructions for GitHub Copilot].

### Add repository-specific instructions for GitHub Copilot

Repository custom instructions let you set **shared guidance** for Copilot that applies to everyone working in the
repository.

Use them when you want Copilot to consistently follow your project conventions (stack choices, architecture, coding
standards, testing guidelines, PR expectations, etc.) without repeating that context in every prompt.

Add a file at:

* `.github/copilot-instructions.md`

Keep it short, concrete, and written as “always/never/prefer” rules. For example:

```markdown
# Repository Copilot instructions

## Tech stack

- Prefer Ruby 3.3 and Jekyll conventions used in this site.
- When editing posts, preserve front matter and existing link reference style.

## Content conventions

- Use headings in sentence case.
- Prefer short paragraphs and bullet lists.
- When adding commands, assume macOS + zsh.

## Safety rails

- Don’t change generated content under `_site/`.
- Avoid large refactors; make minimal, targeted edits.

```

If you don’t want to write it from scratch, you can ask Copilot to generate the file for you.
See: [Asking Copilot cloud agent to generate a copilot-instructions.md file](https://docs.github.com/en/copilot/how-tos/configure-custom-instructions/add-repository-instructions?tool=webui#asking-copilot-cloud-agent-to-generate-a-copilot-instructionsmd-file).

#### Commit message instructions

Add instructions to `.github/copilot-instructions.md` for GitHub Copilot to generate commit messages that follow your
team's conventions and best practices.

For example, you can include guidelines such as:

```markdown

other instructions...

---

## Commit message convention

- Use conventional commit format: type(scope): description.
- Use imperative mode: 'Add feature' not 'Added feature'.
- Keep subject line under 50 characters.
- Use types: feat, fix, docs, style, refactor, perf, test, chore, ci.
- Include scope when relevant (e.g., api, ui, auth).
- For additional details, use a well-structured body section. Use bullet points (`*`) for clarity.


```

See [Responsible use of GitHub Copilot for commit messages] for understanding its purposes, capabilities, and
limitations.

You can also create a separate file at `.github/git-commit-instructions.md` with more detailed instructions for commit
messages, and link to it from the main `copilot-instructions.md` file.

```markdown

other instructions...

---

## Commit Message Convention

All commit messages must follow the convention described in [.github/git-commit-instructions.md].
```

#### Agent Instructions

You can create an `AGENTS.md` file in the root of your repository to provide instructions to GitHub Copilot about how
you want it to respond when generating code for that repository. This file can include information about your coding
style, project structure, or any specific requirements you have for the generated code.

See [AGENTS.md] for more details on how to set up and use the `AGENTS.md` file.

## Agents

GitHub Copilot can do more than suggest code: it can also act on your behalf when you connect it to the right tools
and permissions. For example, it can help create pull requests, manage issues, or trigger deployments.

### Agent Skills

Agent skills are reusable bundles of instructions, scripts, and resources that Copilot can load when a task needs
specialized context. They help Copilot perform better in focused workflows without repeating the same setup every time.

The Agent Skills specification is an [open standard](https://github.com/agentskills/agentskills) used by a range of
different AI systems.

See [About agent skills](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills) for more information.

## Other resources

- [Stop Using /init for AGENTS.md](https://medium.com/@addyosmani/stop-using-init-for-agents-md-3086a333f380)
- [10 Must-Have Skills for Claude (and Any Coding Agent) in 2026](https://medium.com/@unicodeveloper/10-must-have-skills-for-claude-and-any-coding-agent-in-2026-b5451b013051)


[GitHub Copilot documentation]: https://docs.github.com/copilot

[What is GitHub Copilot?]: https://docs.github.com/en/copilot/get-started/what-is-github-copilot

[Installing the GitHub Copilot extension in your environment]: https://docs.github.com/en/copilot/how-tos/set-up/install-copilot-extension

[Using GitHub Copilot on GitHub.com]: https://docs.github.com/en/copilot/how-tos/copilot-chat/use-copilot-chat-in-githubcom

[Installing GitHub Copilot CLI]: https://docs.github.com/en/copilot/how-tos/copilot-cli/set-up-copilot-cli/install-copilot-cli

[Best practices for using GitHub Copilot]: https://docs.github.com/en/copilot/get-started/best-practices

[Prompt engineering for GitHub Copilot Chat]: https://docs.github.com/en/copilot/concepts/prompting/prompt-engineering

[About customizing GitHub Copilot responses]: https://docs.github.com/en/copilot/concepts/prompting/response-customization

[Adding personal custom instructions for GitHub Copilot]: https://docs.github.com/en/copilot/how-tos/configure-custom-instructions/add-personal-instructions

[AGENTS.md]: https://agents.md/

[Responsible use of GitHub Copilot for commit messages]: https://docs.github.com/en/copilot/responsible-use/copilot-commit-message-generation
