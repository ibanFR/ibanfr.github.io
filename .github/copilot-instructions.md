# Repository Copilot Instructions

## Summary

This is a personal technical blog and knowledge base for Iván Fernández, a Software Engineering Director. It covers
software engineering topics including BDD, DDD, XP, Lean, Scrum, technical coaching, and AI tooling. It is deployed as a
GitHub Pages static site using the **Jekyll** static site generator with the **Minimal Mistakes** theme.

---

## Tech Stack

- **Language / Runtime**: Ruby 3.1+ (CI uses Ruby 3.3)
- **Framework**: Jekyll ~> 4.3 with Minimal Mistakes theme
- **Markup**: Markdown (kramdown) with YAML front matter
- **Deployment**: GitHub Pages via GitHub Actions (`.github/workflows/jekyll.yml`)
- **Dependency manager**: Bundler 2.x (`Gemfile`, `Gemfile.lock`)

---

## Project Layout

```
_config.yml            # Main Jekyll configuration — site title, plugins, collections, defaults
Gemfile                # Ruby gem dependencies
.github/
  workflows/
    jekyll.yml         # CI/CD: build and deploy to GitHub Pages (branch: minimal-mistakes)
  git-commit-instructions.md
_data/
  navigation.yml       # Top nav and sidebar navigation menus
_posts/                # Blog posts — filename: YYYY-MM-DD-title.md
_pages/                # Static pages (about, 404, home, portfolio, etc.)
_guides/               # Guide index pages (one per topic: bdd, ddd, xp, lean, scrum, technical-coaching)
_portfolio/            # Portfolio case studies
_bdd/                  # BDD knowledge base (explanation/, reference/)
_ddd/                  # DDD knowledge base (explanation/, reference/)
_xp/                   # XP knowledge base (explanation/, tutorials/, how-to/, reference/)
_lean/                 # Lean knowledge base (explanation/)
_coaching/             # Technical coaching knowledge base (explanation/)
_scrum/                # Scrum knowledge base (explanation/)
_includes/             # Custom HTML includes (footer.html, head.html)
_cache/                # Link-preview cache (gitignored, auto-managed)
assets/                # Static assets (css/, images/, js/)
_site/                 # Build output (gitignored — never edit)
```

---

## Commit Message Convention

This repository follows [Semantic Versioning (SemVer)](https://semver.org/) and uses a standardized commit message
format to ensure changes are clearly communicated and version increments are consistent.

### Public API (for SemVer purposes)

In this repository, the public API is defined through the site interface as presented to users via GitHub Pages. Changes
to the public API include:

- **New features**: Adding or removing menu items, adding new guides, creating new pages, or any change that affects
  site navigation or structure.
- **Bug fixes**: Fixing broken links, resolving formatting issues that prevent the site from rendering properly, or
  correcting navigation problems.
- **Docs**: Adding new posts, updating content within existing pages, or improving documentation and knowledge base
  entries.

All such changes should be reflected in the commit message type and summary, and should be validated by building and
serving the site locally to ensure the public interface behaves as expected.

### Commit Message Format

```
<header>
<BLANK LINE>
<optional body>
<BLANK LINE>
<footer>
```

### Commit Message Header

```
<type>: <summary>
  │         │
  │         └─⫸ Summary in present tense. Not capitalized. No period at the end.
  │
  └─⫸ Commit Type: feat|fix|refactor|test|build|ci|docs
```

#### Type

| Type         | Description                                                                             |
|--------------|-----------------------------------------------------------------------------------------|
| **feat**     | A new feature                                                                           |
| **fix**      | A bug fix                                                                               |
| **refactor** | A behavior-preserving change  (neither fixes a bug nor adds a feature)                  |
| **test**     | Adding or updating tests                                                                |
| **docs**     | Documentation only changes                                                              |
| **build**    | Changes that affect the build system or external dependencies (`Gemfile`, `_config.yml` |
| **ci**       | Changes to CI configuration files and scripts (`.github/workflows/jekyll.yml`)          |

#### Summary

- Use the imperative, present tense: "change" not "changed" nor "changes"
- Don't capitalize the first letter
- No dot (.) at the end
- **Include filenames in the summary when relevant**
    - Prefer: `docs: improve formatting in 01-context.md and 02-containers.md`
    - Over: `docs: improve formatting in context and containers documentation`
    - Prefer: `test: add edge case coverage in LoginPage.test.tsx`
    - Over: `test: add edge case coverage in login page tests`

### Commit Message Body

**Always include a commit message body.** Use bullet points to explain the change:

- **What changed:** Describe the specific modifications made to the codebase — **include the filename(s)** in each
  bullet point when relevant
- **Why it changed:** Explain the business or technical reason for this change
- **How it impacts the system:** Detail any affected modules, layers, or functionality
- **Related decisions:** Reference any architectural decisions (ADRs) or important design choices

**Example — prefer (filenames in body bullets):**

```
docs: improve formatting in 01-context.md and 02-containers.md

* Adjusted line breaks for better readability in user and dependency sections in 01-context.md
* Enhanced table formatting for clarity in 02-containers.md
* Aims to provide a more consistent and user-friendly documentation experience
```

**Instead of (no filenames in body bullets):**

```
docs: improve formatting in 01-context.md and 02-containers.md

* Adjusted line breaks for better readability in user and dependency sections
* Enhanced table formatting for clarity in containers documentation
* Aims to provide a more consistent and user-friendly documentation experience
```

## Jira Issue Link in Footer (Required)

**The Jira issue link is mandatory for all commits.** Extract the Jira issue ID from your branch name and include the
full Jira issue link in the commit message footer.

* **Extract the ID:** Find the Jira ID pattern (e.g., `SITE-33`) from your branch name
* **Create the link:** Format it as the full URL: `https://ibanfr.atlassian.net/browse/JIRA-ID`
* **Append to footer:** Place the complete link as the last line of your commit message

**Example:**

```
type: summary

* Detail 1
* Detail 2

https://ibanfr.atlassian.net/browse/JIRA-ID
```

---

## Content Conventions

### Front matter

All posts and collection pages require YAML front matter. Posts use:

```yaml
---
title: "Post Title"
date: YYYY-MM-DD
header:
  overlay_image: /assets/images/<image>.jpg
  show_overlay_excerpt: false
categories:
  - Category
tags:
  - Tag One
  - Tag Two
---
```

### File naming

- Posts: `_posts/YYYY-MM-DD-slug.md`
- Use lowercase, hyphenated slugs.
- Sentence case for headings.

### Style

- Use headings in sentence case.
- Prefer short paragraphs and bullet lists.

---

## Safety Rails

- **Never change or commit files under `_site/`** — it is gitignored and generated at build time.
- **Never change or commit files under `_cache/`** — it is gitignored and auto-managed.
- `_config.yml` changes require a server restart (not live-reloaded).
- When adding new collection pages, ensure the collection is declared in `_config.yml` and its navigation entry exists
  in `_data/navigation.yml`.
- Avoid modifying theme gem files — the Minimal Mistakes theme is installed as a gem.
- Trust these instructions. Only search the repo if the information here is incomplete or appears incorrect.

## Verify the site starts without errors before committing.

Start the Jekyll development server and check the console output for errors:

```bash
bundle exec jekyll serve --trace 2>&1
```

- Wait for the line `Server address: http://127.0.0.1:4000` to confirm the server started successfully.
- If the build fails, read the full error output and fix the root cause before proceeding.
- Once the server is running cleanly, stop it with `Ctrl+C`.

---

### Known warnings (non-fatal)

The build emits ~230 Sass deprecation warnings from the upstream Minimal Mistakes theme (slash-division). These are
expected and safe to ignore — they come from `minimal-mistakes-jekyll` gem internals and cannot be fixed here.
