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

All commit messages must follow the convention described in [.github/git-commit-instructions.md].

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

## Atlassian Rovo MCP

When connected to atlassian-rovo-mcp:
- **MUST** use Jira project key = SITE
- **MUST** use cloudId = "https://ibanfr.atlassian.net" (do NOT call getAccessibleAtlassianResources)
- **MUST** use `maxResults: 10` or `limit: 10` for ALL Jira JQL and Confluence CQL search operations.
