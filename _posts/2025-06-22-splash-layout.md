---
title: "Updating the Home Page with Splash Layout"
date: 2025-06-21T09:15:00-04:00
header:
  overlay_image: /assets/images/getxo-gorrondatxe.jpg
  show_overlay_excerpt: false
  actions:
    - label: "More Info"
      url: "https://mmistakes.github.io/minimal-mistakes/docs/layouts/#splash-page-layout"
categories:
  - blog
tags:
  - Guide
---

After a morning of exploring different configurations of header images and overlays I realized that all I needed to 
do was to use the splash layout 😂. 

## Configuration

Here's a sample configuration for the front matter for a home page using the `splash` layout:

```yaml
layout: splash
title: Welcome to my personal website!
permalink: /
header:
  overlay_image: /assets/images/getxo-gorrondatxe.jpg
  actions:
    - label: "About Me"
      url: "/about/"
excerpt: "Here you can find information about my projects, interests, and more."
```

## Feature Rows

[Feature rows] can be added to the splash page as a way to arrange content blocks containing text or image in a visually
appealing way. 

To add a feature row that contains one content block, you can use the following configuration in the front matter:

```yaml 
feature_row:
  - image_path: /assets/images/bio-photo.jpg
    alt: "customizable"
    title: "About Me"
    excerpt: "Discover my journey as a software engineer, my passions, and the principles that drive my work."
    url: "/about/"
    btn_class: "btn--primary"
    btn_label: "Read more"
```
Then you can include the feature row in your page by using the following Liquid tag:

```liquid
{% raw %}{% include feature_row %}{% endraw %}
```

[Feature rows]: https://mmistakes.github.io/minimal-mistakes/docs/helpers/#feature-row

## Minimal Mistakes Sample Splash Page

See Minimal Mistakes [sample splash page] for an example of the splash layout in action.

The code for the sample splash page is available in the [Minimal Mistakes repository].

[sample splash page]: https://mmistakes.github.io/minimal-mistakes/splash-page/
[Minimal Mistakes repository]: https://github.com/mmistakes/minimal-mistakes/blob/master/docs/_pages/splash-page.md

