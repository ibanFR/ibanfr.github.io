---
layout: splash
title: Welcome to my personal website!
permalink: /
header:
    overlay_image: /assets/images/getxo-gorrondatxe.jpg
    actions:
      - label: "About Me"
        url: "/about/"
excerpt: "Here you can find information about my projects, interests, and more."
intro:
  - excerpt: "Hi there 👋 I'm Iván Fernández 👀—a passionate software engineer 💻 dedicated to fostering a safe environment 🌱 that encourages creative thinking 💡 and continuous learning."
feature_row:
  - image_path: /assets/images/bio-photo.jpg
    alt: "me"
    title: "About Me"
    excerpt: "Discover my journey as a software engineer, my passions, and the principles that drive my work."
    url: "/about/"
    btn_class: "btn--primary"
    btn_label: "Read more"
  - image_path: /assets/images/compass.jpg
    alt: "guides"
    title: "Guides"
    excerpt: "A curated collection of guides covering modern software engineering practices — including 
    BDD, DDD, TDD, and more."
    url: "/guides/"
    btn_class: "btn--primary"
    btn_label: "Explore the guides"
  - image_path: /assets/images/portfolio.jpg
    alt: "portfolio"
    title: "Portfolio"
    excerpt: "A selection of my recent projects, showcasing practical solutions, creative thinking, and a hands-on approach to software engineering."
    url: "/portfolio/"
    btn_class: "btn--primary"
    btn_label: "Discover my work"
---

{% include feature_row id="intro" type="center" %}

{% include feature_row %}   