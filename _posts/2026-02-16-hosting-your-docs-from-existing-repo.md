---
title: "Hosting your site's documentation from an existing repository"
date: 2026-02-14
header:
  overlay_image: /assets/images/getxo-gorrondatxe.jpg
  show_overlay_excerpt: false
categories:
  - Static Site Generators
tags:
  - Just-the-docs
---

This guide explains how to host your documentation site using the [Just the Docs Jekyll theme] in an existing 
repository.

## Copy the template files to your repository

1. Clone [just-the-docs template] repository or download the template files as a ZIP archive and extract them.
2. Create a `.github/workflows` directory at your project root if your repo doesn't already have one.
3. Copy the `pages.yml` file from the `just-the-docs-template/.github/workflows` directory to your repository's `.github/workflows` directory.
4. Create new folder named `docs` in the root of your repository.
5. Copy all remaining template files to the `docs` folder.

## Building and previewing your site locally

Assuming Jekyll and Bundler are installed on your computer:

1. Change your working directory to the root directory of your site.
2. Run `bundle install`.
3. Run `bundle exec jekyll serve` to build your site and preview it at `localhost:4000`.

## Update the `pages.yml` workflow to build and deploy your site from the `docs` folder

1. Open the `pages.yml` file in your repository's `.github/workflows` directory.
2. Set the default `working-directory` param for the build job.

    ```yaml
    build:
      runs-on: ubuntu-latest
      defaults:
        run:
          working-directory: docs
    ```

3. Set the `working-directory` param for the Setup Ruby step.

    ```yaml
    - name: Setup Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: '3.3'
          bundler-cache: true
          cache-version: 0
          working-directory: '${{ github.workspace }}/docs'
    ```

4. Set the path param for the Upload artifact step:

    ```yaml
    - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: docs/_site/
    ```

5. Modify the trigger so that only changes within the `docs` directory start the workflow. Otherwise, every change to your project (even those that don't affect the docs) would trigger a new site build and deploy.

    ```yaml
    on:
      push:
        branches:
          - "main"
        paths:
          - "docs/**"
    ```


## Licensing and Attribution


[Just the Docs Jekyll theme]: https://just-the-docs.com/
[just-the-docs template]: https://github.com/just-the-docs/just-the-docs-template