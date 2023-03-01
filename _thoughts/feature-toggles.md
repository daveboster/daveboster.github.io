---
layout: thought
title: "Feature Toggles"
tags: thoughts
date: 2022-12-05 09:00:00 -0600
published: false
version: 1
---

Feature Toggles, along with supporting services like Optimizely have shown to provide the some greate benefits for use with "Legacy" platforms.

> **Legacy Code** - code without adequate unit test coverage, that you would be willing to be your wages a refactor won't break the code.
>
> **Adequate unit test coverage** - as close to 100% as possible;
>
> - You should be willing to be half your wages that a change won't break the existing functionality.
> - I have not seen a project where this has been less than 80%; if you have an example, please let me know.
>
> **Legacy Platform** - a software platform, usually consisting of mostly *legacy code*, which cannot consistently deliver value to users in production through software changes without negatively impacting users.

Here are some notes about how Feature Toggles have helped support in order to work towards making a "legacy platform" into an "innovative platform," without having to perform a substancial rewrite or start from scratch. Examples to follow later.

- changing existing legacy code for critical functions and performance
- progressive delivery - allowing users to see a feature as it is being developed; the antithesis of this is to 'wait for X sprints or X quarters' before we can receive feedback from actual users (not user-acceptance-test folks) **in production**.
  - it's important to understand these terms are not the same: progressive delivery, feature toggles, trunk-based development. It's possible they may represent circles of a Venn diagram.
- no need for the *release notes dance*, allowing 'deployments' and 'feature releases' to be independent and not tightly-coupled; i.e. public release notes, demos, and feature announcements can occur without having to stop deployments.
  - if there's any issue following deployments, there should be little to question, just rollback. This is preemptive triaging.
- supports developers committing changes daily
  - it's hard to submit changes to the main branch when you're not finished.
  - dark launches can also provide developers with an environment they feel safe and comfortable deploying changes more frequently.
- roll-out a fix or feature to one user vs the world (entire user-base).
  - find users/clients who want to test new functionality (they exist); if there's any issues you only have to coordinate with a small group of users vs an system-wide announcment.
- Deployment vs Code Changes
  - issues introduced with a deployment can halt all teams and specific root causes (outside of everything in the release) can be expensive to identify (if not impossible).
  - if a deployment has an issue, thus rolled back asap, all the changes in the release need to be reverted to ensure teams are working on a stable code-base
    - this is where sunk biases/fallacy come to play and have fun.
- Targeted Blockage Removal
  - is one user or client having a performance problems with legacy code that would take an "epic" to be able safely change?
    - Good! You can do something about this.
    - Implement a feature toggle, put on your Extreme Programming hero outfit (at least start with TDD).
    - Create a feature toggle (commit)
    - Start your Red-Green-Refactor for the functionality needed by that client (commit between each R-G-R).
    - Ask the client if they would be willing to preview the enhancement (build trust and investment) and remove the blockage.
- Move faster, not slower... by that I mean deploy more frequently, at least a few times a week
  - if deployments are expensive, error prone, or a thing of dread, then embrace the situation and get great at it (see thought on importance of practicing and live-training).
  - deploy more frequently, but with fewer changes for each deployment.
  - don't hold onto changes until they are done...
    - have a large number of changed files you want to commit b/c you held onto them forever?
    - Good! Now break them up into managable commits and do one per-day... practice how you could have done this incrementally.
- complaints about feature toggles? painful, too hard to manage, too many, or not able to keep track?
  - Good! Just like with pain of frequent deployments, start practicing.
  - Using an in-ability to be proficent at or master a technique does not make the technique bad or not applicable.
