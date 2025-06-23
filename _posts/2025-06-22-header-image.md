---
title: "Adding a Header Image to the Site"
date: 2025-06-21T09:11:00-04:00
header:
  image: /assets/images/getxo-gorrondatxe.jpg
categories:
  - blog
tags:
  - Guide
---

Today we will try to add a header to our site using the Minimal Mistakes theme. 

## Configuration

The header image can be configured in the front matter of a page or post. Here is an example of how to set it up:

```yaml
title: "Adding a Header to the Site"
date: 2025-06-21T09:11:00-04:00
header:
  image: /assets/images/bio-photo.jpg
```
More configurations and additional options can be found in the  [Minimal Mistakes documentation].

[Minimal Mistakes documentation]: https://mmistakes.github.io/minimal-mistakes/docs/layouts/#headers

## Header Image scales to fit the width of the screen

While the `header.image` front matter sets the image, the theme's CSS often dictates how it's displayed, and by default,
it tries to scale it to fit the full width of the screen. The height scales proportionally to the width maintaining the
image's aspect ratio.

This behaviour causes the header image to take up all  the visible space on the page, which is not ideal for all 
pages of the site.

## Sample Header Images from the Minimal Mistakes theme

Here are some sample posts from the Minimal Mistakes theme that use the header image:

- [Sample post with a large image and tons of text](https://mmistakes.github.io/minimal-mistakes/layout-header-image-text-readability/)
- [Horizontal Header image](https://mmistakes.github.io/minimal-mistakes/layout/uncategorized/layout-header-image-horizontal/)

You can check the content of these posts in the [Minimal Mistakes repository](https://github.com/mmistakes/minimal-mistakes/tree/master/docs/_posts)



