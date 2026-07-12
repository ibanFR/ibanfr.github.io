---
title: "Overriding the default footer"
date: 2025-06-21T09:15:00-04:00
header:
  image: /assets/images/posts/jekyll-header.png
  teaser: /assets/images/posts/jekyll-teaser.png
categories:
  - Static Site Generators
tags:
  - Minimal Mistakes
---

The next thing I want to do today is removing the `Powered By Jekyll & Minimal Mistakes.` from the page footer. 

## Override the default footer

1. Copy `_includes/footer.html` from the [Minimal Mistakes theme repository] into your own site's `_includes/` folder 
(create it if it doesn't exist).
2. Edit your local copy of `_includes/footer.html`:

```html
    <div class="page__footer-copyright">{% raw %}&copy; {{ site.time | date: '%Y' }} <a href="{{ site.copyright_url | default: site.url }}">{{ site.copyright | default: site.title }}</a>.{% endraw %}</div>
```

[Minimal Mistakes theme repository]: https://github.com/mmistakes/minimal-mistakes/blob/master/_includes/footer.html