---
title: "Configure GitHub branch protection"
date: 2026-07-12
header:
  image: /assets/images/posts/github-header.png
  teaser: /assets/images/posts/github-teaser.png
categories:
  - Version Control
tags:
  - GitHub
---

Your default branch (`main`) is the project's source of truth. Without protection, anyone with write access can rewrite its history or delete the branch entirely. This post explains why that matters and how to lock it down on GitHub.


## Why protect the default branch

A force push rewrites the commit history of `main`. Other contributors' local clones diverge from the remote, which causes conflicts and can silently lose work. CI audit trails tied to the overwritten commits vanish.

Deleting the branch removes the reference entirely: open pull requests close, and the repository has no defined default branch until someone restores it.

Both actions are hard to recover from, and blocking them requires no complex setup — normal workflows are unaffected.

## Prerequisites

You need **Admin** or **Owner** permissions on the repository.

## Protect the default branch against force pushes and deletion

1. Go to **Settings → Rules → Rulesets**.
2. Click **New ruleset → New branch ruleset**.
3. Enter the name **Protect against force pushes and deletions**.
4. Set **Enforcement status** to **Active**.
5. Under **Target branches**, add the default branch (**Include default branch**).
6. Check **Restrict deletions**.
7. Check **Block force pushes**.
8. Click **Create**.

Force pushes and deletions are now rejected. Normal pushes and PR merges continue to work.
