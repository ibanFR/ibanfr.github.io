---
layout: splash
title: Welcome to my personal website!
permalink: /
header:
    overlay_image: /assets/images/bio-photo.jpg
    actions:
      - label: "About Me"
        url: "/about/"
excerpt: "Here you can find information about my work, software development guides, and more."
intro_row:
  - title: "Welcome"
  - excerpt: "Hi there 👋 I'm Iván Fernández 👀—a passionate software engineer 💻 dedicated to fostering a safe environment 🌱 that encourages creative thinking 💡 and continuous learning."
main_row:
  - image_path: /assets/images/pages/skillwell.jpg
    alt: "me"
    title: "About Me"
    excerpt: "Discover my journey as a software engineer, my passions, and the principles that drive my work."
    url: "/about/"
    btn_class: "btn--primary"
    btn_label: "Read more"
  - image_path: assets/images/pages/guides.png
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
posts_row:
  - title: "Posts"
    excerpt: "Browse a list of my recent posts, including topics on AI assisted development, technical 
    coaching, and extreme programming. Explore practical guides, case studies, and insights across these categories."
    image_path: /assets/images/pages/posts.jpg
    url: "/posts/"
    btn_class: "btn--primary"
    btn_label: "Read the posts"
---
<style>
.feature__item img,
.archive__item img,
.feature__wrapper img,
.feature-row .archive__item-img,
.feature-row .archive__item-image,
.feature-row .archive__item .archive__item-img {
  width:100%;
  width: 398px;         /* or any fixed value, e.g., 100% for responsive */
  height: 298px;        /* or any fixed value */
  object-fit: cover;
  display: block;
  margin-left: auto;
  margin-right: auto;
}

</style>

{% include feature_row id="intro_row" type="center" %}

{% include feature_row id="main_row" %}

{% include feature_row id="posts_row" type="center" %}

{% for post in site.posts limit: 4 %}
    {% include archive-single.html type="grid" %}
{% endfor %}