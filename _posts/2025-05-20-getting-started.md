---
title: "Getting Started with Minimal Mistakes"
date: 2025-04-19T15:34:30-04:00
categories:
  - blog
tags:
  - Jekyll
---

This is a quick start guide to help you get up and running with the [Minimal Mistakes] theme.

When you first start your Jekyll site, you will have a default layout and some sample content. This guide will help you understand how to customize your site and make it your own.

[Minimal Mistakes]: https://mmistakes.github.io/minimal-mistakes/

## Configuration
The configuration file for your Jekyll site is located in the `_config.yml` file. Here you can update the site title,
description, and other settings:
```yaml
title: My Jekyll Site
description: A simple Jekyll site using the Minimal Mistakes theme.
```
Full list of site settings can be found in the [Configuration] section of the Minimal Mistakes documentation.

[Configuration]: https://mmistakes.github.io/minimal-mistakes/docs/configuration/

## Home

The home page is the first page that visitors see when they visit your site.

By default, the home page is set to display a list of your latest posts. You can change this by modifying the
`_pages/home.md` file. For example, to update the layout to `single` and add a title:   
```yaml
---
layout: single
title: Home
permalink: /
author_profile: true
---

  Sample content for my home page. You may include the content of `README.md`
```

## Posts
You probably want to delete the sample posts that come with the theme:
- `_posts/2019-04-18-welcome-to-jekyll.md`
- `_posts/2010-03-07-post-link.md`
- etc.

You can do this by deleting the files in the`_posts` directory.

See the [Working with Posts] for more information on how to create and manage posts.

[Working with Posts]: https://mmistakes.github.io/minimal-mistakes/docs/posts/

## Navigation
The [Navigation](https://mmistakes.github.io/minimal-mistakes/docs/navigation/) menu is located in the `_data/navigation.yml` file. You can add, remove, or modify the links in this 
file to customize the navigation menu on your site.

For example, remove the "Categories" and "Tags" links from the navigation menu by deleting the following lines from the 
`_data/navigation.yml` file:

```yaml
  - title: "Categories"
    url: /categories/
  - title: "Tags"
    url: /tags/
```

## Pages
To better organize all of your pages it's recommended to centralize them into a single location `_pages/`. You can create a new page by creating a new file in the `_pages` directory. 

See [Working with Pages] documentation for more information on how to create and manage pages.

[Working with Pages]: https://mmistakes.github.io/minimal-mistakes/docs/pages/

## Collections

Collections are a way to group related content together. For example, you might want to create a collection for all 
your How-to Guides within the Diataxis framework.

To create a new `guides` collection, you need to add a new entry to the `_config.yml` file:

```yaml
collections:
  guides:
    output: true
    permalink: /:collection/:path/
```

These settings will output `index.html` files for each  document in `_guides` at 
`_site/guides/<document-filename>/`.

Set some defaults for the Front Matter of the documents in the `guides` collection:
```yaml
defaults:
  # _guides
  - scope:
      path: ""
      type: guides
    values:
      layout: single
      author_profile: false
      share: true
```

You can now create a new file `guides.md` in the `_pages` directory to list all the guides in the collection.

```yaml
---
title: Guides
layout: collection
permalink: /guides/
collection: guides
entries_layout: grid
classes: wide
---
```

And then create a how-to guide `_guides/mm-quick-start.md` with content like:
```yaml
---
title: Minimal Mistakes Quick-Start guide
---

This is a demo of a Quick-Start Guide with single page layout using the Minimal Mistakes theme.
```

See [Working with Collections] for more information on how to create and manage collections.

[Working with Collections]: https://mmistakes.github.io/minimal-mistakes/docs/collections/

## Custom sidebar navigation menu
Create a custom sidebar navigation menu for the documents of a collection by adding a new entry to the `_data/navigation.yml` file. For example, to create a custom sidebar navigation menu for the `guides` collection, add the following entry:

```yaml
docs:
  - title: Guides
    children:
      - title: "Quick-Start Guide"
        url: /guides/mm-quick-start/
```

Use Front Matter Defaults in `_config.yml` to add a sidebar navigation menu to several pages

```yaml
    defaults:
      # _guides
      - scope:
          path: ""
          type: guides
        values:
          layout: single
          author_profile: false
          share: true
          sidebar:
            nav:
              - docs
```

See [Custom sidebar navigation menu] for more details

[Custom sidebar navigation menu]: https://mmistakes.github.io/minimal-mistakes/docs/layouts/#custom-sidebar-navigation-menu

