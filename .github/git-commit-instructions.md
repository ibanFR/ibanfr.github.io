# Git Commit Instructions

This repository follows [Semantic Versioning (SemVer)](https://semver.org/) and uses a standardized commit message format to ensure changes are clearly communicated and version increments are consistent.

## Commit Message Format

> **Important:** You must include a **BLANK LINE** between the commit header, body, and footer. This is required for correct parsing and readability.

```
<header>
<BLANK LINE>
<optional body>
<BLANK LINE>
<footer>
```

## Commit Message Header

```
<type>: <summary>
  │         │
  │         └─⫸ Summary in present tense. Not capitalized. No period at the end.
  │
  └─⫸ Commit Type: feat|fix|refactor|test|build|ci|docs
```

### Type

| Type         | Description                                                                             |
|--------------|-----------------------------------------------------------------------------------------|
| **feat**     | A new feature                                                                           |
| **fix**      | A bug fix                                                                               |
| **refactor** | A behavior-preserving change  (neither fixes a bug nor adds a feature)                  |
| **test**     | Adding or updating tests                                                                |
| **docs**     | Documentation only changes                                                              |
| **build**    | Changes that affect the build system or external dependencies (`Gemfile`, `_config.yml` |
| **ci**       | Changes to CI configuration files and scripts (`.github/workflows/jekyll.yml`)          |

### Summary

- Use the imperative, present tense: "change" not "changed" nor "changes"
- Don't capitalize the first letter
- No dot (.) at the end
- **Include filenames in the summary when relevant**
    - Prefer: `docs: improve formatting in 01-context.md and 02-containers.md`
    - Over: `docs: improve formatting in context and containers documentation`
    - Prefer: `test: add edge case coverage in LoginPage.test.tsx`
    - Over: `test: add edge case coverage in login page tests`

## Commit Message Body

**Always include a commit message body.** Use bullet points to explain the change:

- **What changed:** Describe the specific modifications made to the codebase — **include the filename(s)** in each bullet point when relevant
- **Why it changed:** Explain the business or technical reason for this change
- **How it impacts the system:** Detail any affected modules, layers, or functionality
- **Related decisions:** Reference any architectural decisions (ADRs) or important design choices

**Example — prefer (filenames in body bullets):**

```
docs: improve formatting in 01-context.md and 02-containers.md

* Adjusted line breaks for better readability in user and dependency sections in 01-context.md
* Enhanced table formatting for clarity in 02-containers.md
* Aims to provide a more consistent and user-friendly documentation experience

https://ibanfr.atlassian.net/browse/JIRA-ID
```

**Instead of (no filenames in body bullets):**

```
docs: improve formatting in 01-context.md and 02-containers.md

* Adjusted line breaks for better readability in user and dependency sections
* Enhanced table formatting for clarity in containers documentation
* Aims to provide a more consistent and user-friendly documentation experience

https://ibanfr.atlassian.net/browse/JIRA-ID
```

## Jira Issue Link in Footer (Required)

**The Jira issue link is mandatory for all commits.** Extract the Jira issue ID from your branch name and include the full Jira issue link in the commit message footer.

* **Extract the ID:** Find the Jira ID pattern (e.g., `SITE-33`) from your branch name
* **Create the link:** Format it as the full URL: `https://ibanfr.atlassian.net/browse/JIRA-ID`
* **Append to footer:** Place the complete link as the last line of your commit message

**Example:**

```
type: summary
<BLANK LINE>
* Detail 1
* Detail 2
<BLANK LINE>
https://ibanfr.atlassian.net/browse/JIRA-ID
```
