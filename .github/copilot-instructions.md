# Copilot Instructions for ibanfr.github.io

## Project Overview

This is a **Jekyll static site** using the **Minimal Mistakes** theme (`minimal-mistakes-jekyll` gem, v4.28.0). It serves as a personal portfolio and knowledge-base site for software engineering practices including BDD, DDD, XP, Scrum, Lean, and Technical Coaching.

**Live site:** <https://ibanfr.github.io/>

## Tech Stack

| Component          | Detail                                                |
|--------------------|-------------------------------------------------------|
| Static site generator | Jekyll ~4.3 (Ruby)                                 |
| Theme              | [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/) (`minimal-mistakes-jekyll`) |
| Ruby version       | 3.3 (CI), 3.2+ works locally                         |
| Markdown engine    | kramdown                                              |
| Dependency manager | Bundler (via `Gemfile`)                               |
| CI/CD              | GitHub Actions (`.github/workflows/jekyll.yml`)       |

### Jekyll Plugins

Configured in `_config.yml` under `plugins:` and in `Gemfile`:

- `jekyll-paginate` – blog post pagination
- `jekyll-sitemap` – automatic sitemap generation
- `jekyll-gist` – GitHub Gist embedding
- `jekyll-feed` – Atom feed generation
- `jemoji` – GitHub-style emoji rendering
- `jekyll-include-cache` – cached includes for performance
- `jekyll-linkpreview` (~0.7.0) – generates rich link previews from URLs (⚠ requires network access at build time)

## Repository Structure

```
├── _config.yml          # Main Jekyll configuration
├── Gemfile              # Ruby dependencies
├── _data/
│   └── navigation.yml   # Top nav + sidebar navigation menus
├── _includes/           # Custom theme overrides (head.html, footer.html)
├── _pages/              # Static pages (home, about, guides, portfolio, archives)
├── _posts/              # Blog posts (date-prefixed markdown files)
├── _bdd/                # BDD collection (explanation/, reference/)
├── _coaching/           # Technical Coaching collection (explanation/)
├── _ddd/                # DDD collection (explanation/, reference/)
├── _guides/             # Guides collection (standalone guides)
├── _lean/               # Lean collection (explanation/)
├── _portfolio/          # Portfolio collection (project showcases)
├── _scrum/              # Scrum collection (explanation/)
├── _xp/                 # XP collection (explanation/, tutorials/, how-to/, reference/)
├── assets/
│   ├── css/             # Custom CSS (linkpreview.css)
│   └── images/          # All images, organized by topic subdirectories
└── .github/
    └── workflows/
        └── jekyll.yml   # CI/CD: build + deploy to GitHub Pages
```

## Branching and Deployment

- **Default/deployment branch:** `minimal-mistakes` (GitHub Actions deploys from this branch)
- The CI workflow triggers on pushes to `minimal-mistakes` and on `workflow_dispatch`
- The build command in CI is: `bundle exec jekyll build --baseurl "${{ steps.pages.outputs.base_path }}"`

## How to Build Locally

```bash
# Install dependencies
bundle install

# Build the site (output goes to _site/)
bundle exec jekyll build

# Serve locally with live reload
bundle exec jekyll serve
```

### Known Build Issue: `jekyll-linkpreview` Requires Network Access

The `jekyll-linkpreview` plugin fetches metadata from external URLs at build time. In sandboxed or network-restricted environments, the build **will fail** with errors like:

```
Liquid Exception: Failed to open TCP connection to <hostname>:443
```

**Workaround:** The plugin caches results in a `_cache/` directory. If a pre-populated `_cache/` directory exists, the build can succeed without network access. Without it, the only option is to build in an environment with internet access, or temporarily remove `{% linkpreview %}` tags from the affected files.

**Files using `{% linkpreview %}`:**
- `_posts/2025-07-03-link-preview.md`
- `_xp/tutorials/refactoring-legacy-code.md`
- `_scrum/explanation/artifacts.md`
- `_bdd/explanation/formulation.md`
- `_bdd/explanation/discovery.md`
- `_bdd/reference/bdd-sample-repos.md`
- `_ddd/explanation/ddd-starter.md`
- `_ddd/explanation/ddd-explanation.md`
- `_ddd/reference/sample-repos.md`

## Content Conventions

### Blog Posts (`_posts/`)

**Filename pattern:** `YYYY-MM-DD-title-in-kebab-case.md`

**Typical front matter:**
```yaml
---
title: "Post Title"
date: YYYY-MM-DD
categories:
  - Category Name
tags:
  - tag1
  - tag2
header:
  overlay_image: /assets/images/image-name.jpg
  show_overlay_excerpt: false
---
```

Default layout values for posts are set in `_config.yml` under `defaults:` and include: `layout: single`, `author_profile: true`, `read_time: true`, `comments: true`, `share: true`, `related: true`, `toc: true`. You do **not** need to repeat these in individual post front matter.

### Collections

There are 8 collections configured in `_config.yml`: `guides`, `portfolio`, `ddd`, `bdd`, `xp`, `lean`, `coaching`, `scrum`.

**Collection item front matter (minimal):**
```yaml
---
title: "Item Title"
---
```

**Collection items with sidebar navigation** (`bdd`, `ddd`, `xp`, `lean`, `coaching`, `scrum`) automatically get sidebar nav from `_config.yml` defaults — the `sidebar.nav` key maps to a key in `_data/navigation.yml`.

**Portfolio items** use an `order` field and optional `header.teaser`:
```yaml
---
title: "Project Title"
header:
  teaser: assets/images/image.png
order: 3
---
```

**Guide items** also use an `order` field for sorting:
```yaml
---
title: "Guide Title"
header:
  teaser: /assets/images/image.jpg
order: 1
---
```

### Collection index pages

Each collection has an index page in `_pages/` (e.g., `_pages/guides.md`, `_pages/portfolio.md`) with layout `collection`, `entries_layout: grid`, and `sort_by: order`.

Some collections also have an in-collection index file (e.g., `_bdd/bdd-collection.md`) with `layout: collection` and `hidden: true`.

### Navigation

All navigation is defined in `_data/navigation.yml`:
- `main` – top navigation bar (Home, Guides, Portfolio, Posts, About)
- Named sidebar menus (`bdd`, `ddd`, `xp`, `scrum`, `lean`, `coaching`) used by collection items

When adding a new page to a collection with sidebar navigation, also add its entry to `_data/navigation.yml` under the corresponding sidebar menu.

### Images

Store images in `assets/images/` in a subdirectory matching the content area (e.g., `assets/images/xp/`, `assets/images/posts/`). Reference them in front matter or markdown using site-relative paths like `/assets/images/subdir/image.jpg`.

## Custom Theme Overrides

Only two include files override the Minimal Mistakes theme:

- **`_includes/head.html`** – adds Font Awesome preload, custom `linkpreview.css`, Atom feed link, and the copy-code-button feature flag
- **`_includes/footer.html`** – custom footer with social icons and copyright

There are **no custom layout files** — all layouts come from the Minimal Mistakes theme gem.

## Configuration Reference

Key `_config.yml` settings:
- `theme: minimal-mistakes-jekyll`
- `permalink: /:categories/:title/`
- `paginate: 5`
- `search: true`
- `enable_copy_code_button: true`
- `collections:` defines all 8 collections with `output: true`
- `defaults:` sets per-type front matter defaults (layouts, sidebars, author profiles)

## Testing and Validation

There are **no automated tests or linters** configured for this repository. Validation is done through:
1. Successful `bundle exec jekyll build` (the CI build step)
2. Visual inspection of the generated `_site/` output

## Tips for Agents

- **Do not run the Jekyll build in sandboxed environments** unless you have network access or a populated `_cache/` directory. The `jekyll-linkpreview` plugin will cause the build to fail.
- When adding new content, follow the existing front matter patterns closely. The defaults in `_config.yml` handle most layout settings automatically.
- When adding a new collection item with sidebar navigation, remember to update `_data/navigation.yml`.
- The `.gitignore` excludes `_site/`, `.sass-cache/`, `.jekyll-cache/`, `.jekyll-metadata`, `vendor/`, `Gemfile.lock`, `.idea/`, and `_cache/`.
- The `_pages/` directory is explicitly included for processing via `include: [_pages]` in `_config.yml`.
- Permalink structure uses categories: a post in category "Version Control" with title "my-post" will be at `/version%20control/my-post/`.
