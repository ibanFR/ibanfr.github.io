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
intro:
  - title: "Welcome"
  - excerpt: "Hi there 👋 I'm Iván Fernández 👀—a passionate software engineer 💻 dedicated to fostering a safe environment 🌱 that encourages creative thinking 💡 and continuous learning."
feature_row:
  - image_path: /assets/images/pages/skillwell.jpg
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
posts_intro_row:
  - title: "Posts"
    excerpt: "Browse a list of my recent posts, including topics on BDD, DDD, XP, Lean, Scrum, technical coaching, and AI tooling. Explore practical guides, case studies, and insights across these categories."
    image_path: /assets/images/pages/georgia-de-lotz-hdQGAz1pQ_M-unsplash.jpg
---

{% include feature_row id="intro" type="center" %}

{% include feature_row %}

{% include feature_row id="posts_intro_row" type="center" %}

<style>
.feature__item img, .archive__item img, .feature__wrapper img, .feature-row .archive__item-img, .feature-row .archive__item-image, .feature-row .archive__item .archive__item-img {
  max-height: 360px;
  object-fit: cover;
  width: auto;
  display: block;
  margin-left: auto;
  margin-right: auto;
}
</style>

<div class="feature__wrapper">
   {% for post in site.posts limit:3 %}
   <div class="feature__item">
      <div class="archive__item">
         <div class="archive__item-body">
            <h3 class="archive__item-title"><a href="{{ site.baseurl }}{{ post.url}}" rel="permalink">{{ post.title }}</a></h3>
            <div class="archive__item-excerpt">
               <p>{{ post.excerpt | markdownify }}</p>
            </div>
         </div>
      </div>
   </div>
   {% endfor %}
</div>