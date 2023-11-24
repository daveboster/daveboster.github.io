# How Fascinating! ＼(๏◡๏)／

[![Boster.dev CI/CD](https://github.com/daveboster/daveboster.github.io/actions/workflows/bosterdev-deploy.yml/badge.svg?branch=main)](https://github.com/daveboster/daveboster.github.io/actions/workflows/bosterdev-deploy.yml)

[Boster.dev](https://boster.dev): one developer's minimal viable solution for growth through transparency and the relentless pursuit of mastery in their craft. 🙂

## Overview

Websites can be as simple or complex as the author intends, however, over time original aspirations tend to take a back seat to the shiny technical details and capabilities. This site was originally created to explore GitHub Pages as a possible way to help software developers build their own "equity", establish a personal brand, and grow confidence. It's my hope to stay focused on the original intent with a little help from our friends and disciplines.

Guided by [Clean Coding](https://cleancoders.com/) and [Extreme Programming (XP)](https://en.wikipedia.org/wiki/Extreme_programming) principles and practices, the website continues to grow to include additional disciplines such as [Site Reliability Engineering (SRE)](https://sre.google/), [DevOps](https://en.wikipedia.org/wiki/DevOps).

| Area | Details |
| :--- | :------ |
| Methodology | [Extreme Programming (XP)](https://en.wikipedia.org/wiki/Extreme_programming) |
| CI/CD | [GitHub Actions](https://docs.github.com/en/actions) |
| Vulnerability Monitoring | [Dependabot](https://docs.github.com/en/code-security/dependabot) |
| Observability | [New Relic](https://newrelic.com/) |
| Hosting | [Azure Static Web Apps](https://learn.microsoft.com/en-us/azure/static-web-apps/) |
| Framework | [GitHub Pages](https://docs.github.com/en/pages) / [Jekyll](https://jekyllrb.com/) |

## Contribution Guide (Software Process)

There are a few options for developing changes to this project.

### Option 1: Commit to main

1. Within the editor of choice, commit changes directly to the `main` branch.
2. The continuous delivery pipeline will automatically build and deploy the changes to the [production environment (Boster.dev)](https://boster.dev).

### Option 2: Create a Pull Request

1. Create a new branch from `main` with a descriptive name.
2. Within the editor of choice, commit changes to the new branch.
3. Create a pull request from the new branch to `main`.
4. The continuous deployment pipeline will automatically build and deploy changes to a preview environment (see [Review pull requests in pre-production environments](https://learn.microsoft.com/en-us/azure/static-web-apps/review-publish-pull-requests) for details).
5. When a pull request is closed (cancelled, completed), the preview environment is removed.
6. Approved pull requests merged into `main` will automatically build and deploy the changes to the [production environment (Boster.dev)](https://boster.dev).
