# frozen_string_literal: true

# Slugify category segments in post URLs.
#
# Jekyll's built-in `:categories` permalink placeholder only *downcases* category
# names (see Jekyll::Drops::UrlDrop#categories), so a multi-word category such as
# "Static Site Generators" produces a URL with %20-encoded spaces:
#   /static%20site%20generators/portfolio/
#
# This hook rewrites each post's permalink to use hyphenated, slugified segments
# while leaving the human-readable category names (shown in post meta,
# breadcrumbs, and category archives) untouched:
#   /static-site-generators/portfolio/
#
# Posts that declare their own `permalink` in front matter are left alone.
#
# Runs on `:site, :post_read` so that categories are already populated (they are
# not yet available at the per-document `:post_init` hook). Jekyll memoizes each
# document's URL while reading posts (when it builds the category groupings),
# so the memoized `@url` is cleared to force it to recompute from the new
# permalink. Single-word categories are unaffected (slugify == downcase).
Jekyll::Hooks.register :site, :post_read do |site|
  site.posts.docs.each do |post|
    next if post.data["permalink"]

    categories = Array(post.data["categories"]).map { |category| Jekyll::Utils.slugify(category.to_s) }
    slug = post.data["slug"] ||
           Jekyll::Utils.slugify(post.basename_without_ext.sub(/\A\d{4}-\d{2}-\d{2}-/, ""))

    post.data["permalink"] = "/#{(categories + [slug]).join("/")}/"
    post.instance_variable_set(:@url, nil) # drop the URL memoized during read
  end
end
