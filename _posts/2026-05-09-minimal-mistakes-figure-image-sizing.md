---
title: "Minimal Mistakes figure image sizing"
date: 2026-05-09
categories:
  - Jekyll
  - Minimal Mistakes
tags:
  - figures
  - images
  - responsive design
---

Minimal Mistakes does not prescribe a strict required resolution for `figure` images. The theme examples point to a
responsive approach: use images large enough for the content area, then let the layout scale them down as needed.

## What the docs show

- A large example image is shown at **1200px wide** and remains contained within the content area.
- Figure gallery examples use **600x300** thumbnails with **1200x600** linked originals.
- For grouped images, the docs recommend `figure` with the `half` or `third` classes rather than a fixed pixel rule.

## Practical takeaway

If you want a figure to look sharp across desktop and retina displays, use an image that is at least as wide as the main
content column, with a larger source available when the figure is meant to open or display in more detail.

## Sources

- [Markup: Another Post with Images - Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/markup-more-images/)
- [Markup: Image Alignment - Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/markup/markup-image-alignment/)
- https://mmistakes.github.io/minimal-mistakes/post%20formats/post-image-caption/
- https://mmistakes.github.io/minimal-mistakes/post%20formats/post-image-standard/
- https://mmistakes.github.io/minimal-mistakes/docs/helpers/#figures

---
To optimize this image for the **Minimal Mistakes** Jekyll theme, you need to consider how the theme handles header
images, thumbnails, and feature images.

Since the uploaded image is a vertical book cover, it is best used as a **teaser** or a **sidebar** image rather than a
wide hero banner. Below are the recommended specifications and how to implement them.

---

## 🛠 Recommended Specifications

| Usage Type           | Dimensions (Width × Height) | Aspect Ratio | Format      |
|----------------------|-----------------------------|--------------|-------------|
| **Header**           | 1280 x 720px                | 16:9         |             |
| **Teaser/Thumbnail** | 400 × 533 px                | 3:4          | WebP or JPG |
| **Sidebar Image**    | 300 × 400 px                | 3:4          | WebP or JPG |
| **Feature (Wide)**   | 1200 × 400 px*              | 3:1          | WebP or JPG |

> **Note:** For "Minimal Mistakes," standard web resolution is **72 DPI**. Since this is a book cover, I recommend
> keeping it as a teaser. Cropping this specific image to a wide banner (1200px) would cut off the title or the artwork.

1. Resizes input.jpg to fill at least 1200x675 while keeping aspect ratio (-resize 1200x675^)
2. Crops/extends from the center to exactly 1200x675 (-gravity center -extent 1200x675)

---

## 🚀 How to Implement in Jekyll

Once you have resized and saved the image into your `/assets/images/` folder, add it to your post's **YAML front matter
**:

### As a Teaser Image (Home Page/Archive)

```yaml
---
title: "Learning Design Patterns"
excerpt: "A deep dive into the Gang of Four classic."
header:
  teaser: /assets/images/design-patterns-teaser.jpg
---

```

### As a Sidebar Image

```yaml
---
sidebar:
  - title: "Recommended Reading"
    image: /assets/images/design-patterns-sidebar.jpg
    image_alt: "Design Patterns Book Cover"
    text: "The foundational text for OOP."
---

```

---

## 💡 Optimization Tips

1. **Use WebP:** Convert the `.jpg` to `.webp`. It usually reduces file size by **25–30%** without losing quality, which
   helps your Jekyll site build faster and rank better on PageSpeed Insights.
2. **Compression:** Use a tool like **TinyJPG** or **ImageOptim** to strip unnecessary metadata.
3. **Naming Convention:** Avoid spaces. Use `design-patterns-cover.jpg` instead of `Design Patterns Cover.jpg` to
   prevent broken links in Linux-based hosting environments like GitHub Pages.

Which part of the site are you planning to place this image on? I can give you the specific CSS if you're trying to do
something custom!
