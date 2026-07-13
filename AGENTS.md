# AGENTS.md

Common instructions for any coding agent working in this repository. Tool-specific files (`.github/copilot-instructions.md`, `CLAUDE.md`) reference this file rather than duplicating its content.

## What this is

Personal technical blog and knowledge base for Iván Fernández (Software Engineering Director), covering BDD, DDD, XP, Lean, Scrum, technical coaching, software architecture, and AI tooling. It is a static site — content is Markdown (kramdown) with YAML front matter, plus theme configuration. There is no application code, test suite, or lint step.

## Tech stack

- **Runtime**: Ruby 3.1+ (CI uses Ruby 3.3)
- **Framework**: Jekyll ~> 4.3 with the Minimal Mistakes theme (installed as a gem)
- **Markup**: Markdown (kramdown) with YAML front matter
- **Dependency manager**: Bundler 2.x (`Gemfile`, `Gemfile.lock`)
- **Deployment**: GitHub Pages via GitHub Actions (`.github/workflows/jekyll.yml`)

## Commands

```bash
bundle install                         # install gems
bundle exec jekyll serve               # local dev server at http://127.0.0.1:4000
bundle exec jekyll serve --trace 2>&1  # verify build (see below)
bundle exec jekyll build               # one-off build into _site/
```

## Verify before committing

Start the dev server and confirm it builds cleanly:

```bash
bundle exec jekyll serve --trace 2>&1
```

- Wait for `Server address: http://127.0.0.1:4000` to confirm success, then stop with `Ctrl+C`.
- If the build fails, read the full error output and fix the root cause before proceeding.
- The build emits ~230 Sass slash-division deprecation warnings from the upstream `minimal-mistakes-jekyll` gem. These are expected, safe to ignore, and cannot be fixed here.

## Deployment

`.github/workflows/jekyll.yml` builds and deploys to GitHub Pages **on push to the `minimal-mistakes` branch** (this is the active working branch, not `main`).

## Project layout

```
_config.yml            # Main Jekyll config — site title, plugins, collections, defaults
Gemfile                # Ruby gem dependencies
.github/
  workflows/jekyll.yml # CI/CD: build and deploy to GitHub Pages (branch: minimal-mistakes)
  git-commit-instructions.md
_data/navigation.yml   # Top nav (main) and one sidebar menu per collection
_posts/                # Blog posts — filename: YYYY-MM-DD-slug.md
_pages/                # Static pages (about, home, 404, portfolio index)
_guides/               # Guide index pages (one per topic)
_portfolio/            # Portfolio case studies
_bdd/ _ddd/ _xp/ _lean/ _coaching/ _scrum/ _architecture/
                       # Topic knowledge bases (Diátaxis subfolders)
_includes/             # Custom HTML overrides (head.html, footer.html)
assets/                # Static assets (css/, images/, js/)
_cache/                # jekyll-linkpreview cache (gitignored, auto-managed)
_site/                 # Build output (gitignored — never edit)
```

## Content architecture

The site is organized as **Jekyll collections**, one per topic, each declared in `_config.yml` under `collections:` with per-collection `defaults:` (layout, sidebar nav, toc) applied by `type`. Knowledge-base collections follow the **Diátaxis** structure — subfolders `explanation/`, `reference/`, `tutorials/`, `how-to/`.

**When adding a new collection or page:** declare the collection in `_config.yml` (with a `defaults` scope) *and* add its sidebar menu / entry in `_data/navigation.yml`. Missing either breaks navigation.

## Content conventions

### Front matter

All posts and collection pages require YAML front matter. Posts use:

```yaml
---
title: "Post Title"
date: YYYY-MM-DD
header:
  image: /assets/images/posts/<image>.jpg
categories:
  - Category
tags:
  - Tag One
  - Tag Two
---
```

Collection pages inherit `layout`, `sidebar.nav`, `toc`, etc. from `_config.yml` `defaults` — don't repeat those per-file.

### File naming and style

- Posts: `_posts/YYYY-MM-DD-slug.md`, lowercase hyphenated slug.
- Headings in sentence case.
- Prefer short paragraphs and bullet lists.

### Images

- **Location**: post images go in **`/assets/images/posts/`**. Top-level `/assets/images/` is for site-wide assets only.
- **`feature_row` / teaser images**: use **500 × 300 px (5:3 aspect ratio)** — the Minimal Mistakes recommended teaser size. Keep every image in a given `feature_row` at the same ratio so cards render uniformly.
- **Post header images** (`header.image`): use **1280 × 320 px (4:1 aspect ratio)**. The theme renders `header.image` full-width at its natural ratio, so size the source file rather than adding custom CSS. When a post's header and teaser differ in ratio, use separate files (e.g. `-header` / `-teaser`).
- **Overlay header images** (`header.overlay_image`): **no fixed aspect ratio** — the theme renders it as a `background-size: cover` layer whose height is driven by the overlay text, so it crops per page. Use a wide, centered landscape source **≥ 1280 px wide** (≈ 1600 × 600 works well); do not size these to a specific ratio.

## Safety rails

- **Never edit or commit files under `_site/`** — gitignored, generated at build time.
- **Never edit or commit files under `_cache/`** — gitignored, auto-managed.
- `_config.yml` is **not** live-reloaded — restart the server after editing it.
- Avoid modifying Minimal Mistakes theme gem files — override via `_includes/`, `assets/`, and `_config.yml`.

## Commit convention

**Read [.github/git-commit-instructions.md](.github/git-commit-instructions.md)** — it defines the commit message format for this repository.

## Atlassian Rovo MCP

When connected to `atlassian-rovo-mcp`:

- **MUST** use Jira project key `SITE`.
- **MUST** use cloudId `https://ibanfr.atlassian.net` (do NOT call `getAccessibleAtlassianResources`).
- **MUST** use `maxResults: 10` / `limit: 10` for all Jira JQL and Confluence CQL searches.