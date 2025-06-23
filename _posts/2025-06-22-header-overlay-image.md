---
title: "Using a Header Overlay"
date: 2025-06-21T09:11:00-04:00
header:
  overlay_image: /assets/images/getxo-gorrondatxe.jpg
  actions:
    - label: "More Info"
      url: "https://mmistakes.github.io/minimal-mistakes/docs/layouts/#header-overlay"
categories:
  - blog
tags:
  - Guide
---

After testing the default behavior of the Minimal Mistakes plugin with header images I decided to try with Overlay 
images. 

## Configuration

To overlay text on top of a header image there are a few options. Here's a sample configuration for the front matter:

```yaml
header:
  overlay_image: /assets/images/getxo-gorrondatxe.jpg
  actions:
    - label: "More Info"
      url: "https://mmistakes.github.io/minimal-mistakes/docs/layouts/#header-overlay"
```

This configuration sets the `overlay_image` to a specific image and adds an action button labeled "More Info" that links
to the Minimal Mistakes documentation on header overlays. It also automatically generates an excerpt from the content of
the post.

More configurations and additional options can be found in the  [Minimal Mistakes documentation].

[Minimal Mistakes documentation]: https://mmistakes.github.io/minimal-mistakes/docs/layouts/#headers

