---
title: "Hosting your site's documentation from an existing repository"
date: 2026-02-14
header:
  image: /assets/images/getxo-gorrondatxe-header.jpg
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
   
6. [Configure the publishing source for your GitHub Pages site] to `GitHub Actions` in the repository settings.


## Licensing and Attribution

When a repository contains code from multiple sources with different copyright holders, you should:

1. Preserve all original license files and attributions from each source.
2. Clearly indicate in your main README or a dedicated NOTICE/ATTRIBUTION file which parts of the repository come from which source, and under what license.
3. Do not remove or alter the copyright/license headers in the original files.
4. If you modify code from either source, note your changes and the date in the relevant files or in your attribution file


[Just the Docs Jekyll theme]: https://just-the-docs.com/
[just-the-docs template]: https://github.com/just-the-docs/just-the-docs-template
[Configure the publishing source for your GitHub Pages site]: https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site