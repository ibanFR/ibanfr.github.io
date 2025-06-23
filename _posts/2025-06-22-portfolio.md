---
title: "Building a Portfolio"
date: 2025-06-21T09:16:00-04:00
header:
  overlay_image: /assets/images/getxo-gorrondatxe.jpg
  show_overlay_excerpt: false
  actions:
    - label: "More Info"
      url: "https://mmistakes.github.io/minimal-mistakes/docs/collections/"
categories:
  - blog
tags:
  - Guide
---

The last thing I want to do to replace my legacy site is to add the Portfolio section to my site. 

## Configure the Portfolio Collection

Follow the instructions for [Working with Collections]

[Working with Collections]:https://mmistakes.github.io/minimal-mistakes/docs/collections/

## Teaser Images
Teaser images are used to display a preview of the portfolio item. They can be added to the front matter of each 
portfolio item in the `_portfolio` collection. 

```yaml
---
title: Agile Development Model
header:
    teaser: assets/images/agile-development-model.png
---
```
I'd like to understand the recommended size for these images. Currently, the image as an style of `overflow: hidden;` which means that the image will be cropped to fit the container. 