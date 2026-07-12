# GitHub Copilot Instructions

**Read [../AGENTS.md](../AGENTS.md)** — it holds the shared instructions for all coding agents working in this repository.

## Commit Message Tips for Shell Usage

When committing from the shell, ensure blank lines between the commit header, body, and footer by using multiple `-m`
flags:

  ```sh
  git commit -m "feat: update Copilot plugin post" \
             -m "* Limit header image height and crop to top\n* Add custom.css and link in head.html" \
             -m "https://ibanfr.atlassian.net/browse/SITE-16"
  ```

This produces:

  ```
  feat: update Copilot plugin post

  * Limit header image height and crop to top
  * Add custom.css and link in head.html

  https://ibanfr.atlassian.net/browse/SITE-16
  ```
