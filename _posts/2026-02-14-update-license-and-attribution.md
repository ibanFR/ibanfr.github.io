---
title: "Updating the License and Attribution of a GitHub Repository"
date: 2026-02-14
header:
  overlay_image: /assets/images/getxo-gorrondatxe.jpg
  show_overlay_excerpt: false
categories:
  - blog
tags:
  - Guide
---


When you create a GitHub repository from a template, you must adhere to the original project's
license and general attribution best practices to ensure your commits are both ethical and legal.

This post explains how to update the license files and provides examples for attributions to the original project.

## Adhere to the original project's license

Retain the original `LICENSE` file in your new repository to ensure compliance with the terms of the original project.
This is crucial for respecting the intellectual property rights of the original authors and maintaining legal integrity.

1. Keep the original `LICENSE` file in your new repository to ensure that you are complying with the terms of the original
   project.
2. Add your copyright line with the original copyright line in the `LICENSE` file to acknowledge your contributions 
   while respecting the original authors' rights.

   ```markdown
   The MIT License (MIT)
   
   Copyright (c) 2026 Iván Fernández
   Copyright (c) 2015 @emilybache
   
   Permission is hereby granted, free of charge, to any person obtaining a copy...
   
   ```
   
## Acknowledge the original project in the README file

Add an "Acknowledgements" section in your `README` file that links to the original template and its creator:

```markdown

## Acknowledgements

Special thanks to **[@emilybache](https://github.com/emilybache)** for providing the The original source code and 
starting point for this repository, the [Gilded Rose Refactoring Kata](https://github.com/emilybache/GildedRose-Refactoring-Kata).
```