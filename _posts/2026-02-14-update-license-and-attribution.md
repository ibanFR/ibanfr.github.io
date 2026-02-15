---
title: "Updating the License and Attribution of a GitHub Repository"
date: 2026-02-14
header:
  overlay_image: /assets/images/getxo-gorrondatxe.jpg
  show_overlay_excerpt: false
categories:
  - Version Control
tags:
  - GitHub
---


This short guide explains practical steps to update a repository created from a template so you stay
respectful of the original authors and compliant with the license terms.

## Keep the original license file

Always keep the original `LICENSE` file in the repository root. Do not modify the license text itself —
that text expresses the legal grant and must remain intact. You can add your own copyright notice in the
same file, below the original copyright line(s).

Example (MIT-style):

```text
The MIT License (MIT)

Copyright (c) 2015 @emilybache
Copyright (c) 2026 Iván Fernández

Permission is hereby granted, free of charge, to any person...
```

## Acknowledge the original project in `README.md`

Add an "Acknowledgements" section that links to the original template and credits the
author(s). Keep this short and link to the original repository.

Example `README` snippet:

```markdown
## Acknowledgements

This repository was created from
the [Gilded Rose Refactoring Kata](https://github.com/emilybache/GildedRose-Refactoring-Kata)
template by [Emily Bache](https://github.com/emilybache). Thank you for the original project and for
making it available under its license.
```

## Apache 2.0: Preserve and update `NOTICE` according to the original project's instructions.

Apache requires that `NOTICE` information be
included in distributions where it's present in the original project.

## Creative Commons: Credit the original author and link to the original work

Whenever you are reusing CC licensed works, we recommend that the attribution include the Title, Author, Source, and
License.

For example, if you reuse an image from Unsplash, you can credit the photographer and link to the original image and profile:

{% include figure
popup=true image_path="assets/images/posts/markus-winkler-unsplash.jpg" 
alt="this is a placeholder image" 
caption="Photo by [Markus Winkler](https://unsplash.com/@markuswinkler?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/photos/green-and-white-braille-typewriter-9XfSFjcwGh0?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)" %}

See the [Creative Commons Attribution Best Practices](https://wiki.creativecommons.org/wiki/Best_practices_for_attribution) for more details.

## Practical checklist

- [ ] Keep the original `LICENSE` file in the repository root.
- [ ] Append your copyright line(s) below the original copyright notice in
  `LICENSE` (do not alter the license text itself).
- [ ] Add an "Acknowledgements" section to `README.md` linking to the template repo.
- [ ] If present, preserve and update `NOTICE` according to the original project's instructions.
- [ ] Add a short note to the first commit or PR message explaining that this repo was created from a
  template and linking to the original repository.

## Disclaimer

This post provides practical guidance and examples, not legal advice. For complex licensing questions or
commercial distributions, consult a lawyer or licensing expert.
