---
title: "Copying a GitHub Repository"
date: 2026-01-20
header:
  image: /assets/images/getxo-gorrondatxe-header.jpg
categories:
  - Version Control
tags:
  - GitHub
---

This post explains how to create an independent copy of a GitHub repository with no connection to the original repository.

## Clone and push to a new repository

To create an independent copy of a GitHub repository, you can follow these steps:

1. **Clone the original repository**: Use the `git clone` command to clone the original repository to your local machine.

   ```shell
   git clone https://github.com/LearnWithLlew/TestingBetterWithApprovals.Java.git
   cd repo
    ```

2. Remove the existing remote reference to the original repository:

   ```shell
   git remote remove origin
   ```

3. **Create a new repository on GitHub**: Go to GitHub and create a new repository. 
4. **Add the new repository as a remote**: Use the `git remote add` command to add the new repository as a remote.

   ```shell
   git remote add origin https://github.com/ibanFR/testing-better-with-approvals.git
    ```
5. **Push the code to the new repository**: Use the `git push` command to push the code to the new repository.

    ```shell
    git push -u origin main
    ```