---
title: "Adding Link Previews to your Jekyll Site"
date: 2025-07-03
header:
  image: /assets/images/posts/jekyll-header.png
  teaser: /assets/images/posts/jekyll-teaser.png
categories:
  - Static Site Generators
---

This post explains how to add link previews to your Jekyll site using a Jekyll plugin.

## Link Previews

Link previews are a great way to enhance the user experience on your Jekyll site by providing a visual representation of
links. This can be particularly useful for blog posts, documentation, or any content that references external resources.

## Jekyll Plugin Linkpreview

The [jekyll-linkpreview] plugin allows you to easily add link previews to your Jekyll site. It fetches metadata from the
linked page and generates a preview card that includes the title, description, and an image if available

[jekyll-linkpreview]: https://github.com/ysk24ok/jekyll-linkpreview

## Installation

1. Add the plugin to your `Gemfile`:

   ```ruby
   gem "jekyll-linkpreview", "~> 0.7.0"
   ```

2. Install it:

   ```bash
   bundle install
   ```

3. Enable it in `_config.yml` under `plugins`:

   ```yaml
   plugins:
     - jekyll-linkpreview
   ```

4. Restart the server — `_config.yml` is not live-reloaded.

## Usage

Add the `linkpreview` tag anywhere in a post or page, passing the URL you want to preview:

```liquid
{% raw %}{% linkpreview "https://github.com/ysk24ok/jekyll-linkpreview" %}{% endraw %}
```

At build time the plugin fetches the linked page's Open Graph metadata and renders a card with its title, description, and image. You can pass a literal URL as above or a variable holding one.

## GitHub Actions

Because the metadata is fetched **at build time**, the machine running the build needs network access to each linked page. Locally that is automatic; in CI it works as long as the plugin is installed via Bundler, which the standard [GitHub Actions] Jekyll workflow already handles with `bundle install`.

To avoid re-fetching every link on each build, the plugin caches the retrieved metadata under `_cache/` (gitignored in this repo). In CI that directory starts empty, so previews are fetched fresh on every run. If builds get slow or a linked site rate-limits requests, persist the cache between runs with [`actions/cache`] keyed on `_cache/`.

[GitHub Actions]: https://docs.github.com/en/actions/learn-github-actions/introduction-to-github-actions
[`actions/cache`]: https://github.com/actions/cache