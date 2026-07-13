---
title: "Copying a GitHub Repository"
date: 2026-01-20
header:
  image: /assets/images/posts/github-header.png
  teaser: /assets/images/posts/github-teaser.png
categories:
  - Version Control
tags:
  - GitHub
---

This post explains how to create an independent copy of a GitHub repository with no connection to the original repository.

## Clone the original repository

Use the `git clone` command to clone the original repository to your local machine, then change into its directory:

```shell
git clone https://github.com/LearnWithLlew/TestingBetterWithApprovals.Java.git
cd TestingBetterWithApprovals.Java
```

## Remove the existing remote

Remove the remote reference that points back to the original repository so future pushes don't reach it:

```shell
git remote remove origin
```

## Delete the git history

To make the copy fully independent, delete the existing git history by removing the `.git` directory:

```shell
rm -rf .git
```

## Initialize a new repository

Initialize a fresh git repository and create the first commit:

```shell
git init
git add .
git commit -m "Initial commit"
```

## Create a new repository on GitHub

Go to GitHub and create a new, empty repository. Do not initialize it with a README, `.gitignore`, or license so it stays empty and ready to receive your code.

## Add the new repository as a remote

Use the `git remote add` command to point your local repository at the new GitHub repository:

```shell
git remote add origin https://github.com/ibanFR/testing-better-with-approvals.git
```

## Push the code to the new repository

Use the `git push` command to push the code to the new repository:

```shell
git push -u origin main
```
