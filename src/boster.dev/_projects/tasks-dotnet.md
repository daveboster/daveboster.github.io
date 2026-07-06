---
title: tasks-dotnet
subtitle: A clean-code, test-driven task app
image: /assets/img/work/tasks-dotnet.png
image_alt: >-
  An xUnit test from tasks-dotnet, Create_Task_WithTitle, written in
  Given-When-Then style.
blurb: >-
  A to-do application built as a clean-code and Extreme Programming exercise:
  test-first C# and TypeScript, unit and end-to-end tests, and CI/CD.
tech: C# · .NET · TypeScript · xUnit · Playwright · CI/CD
order: 3
---

{% include site-shot.html src=page.image alt=page.image_alt caption="A representative xUnit test from the suite, written in Given-When-Then style." %}

tasks-dotnet is a to-do application I build as a hands-on exercise in clean
coding and Extreme Programming: small, test-first steps through the
Red-Green-Refactor cycle, kept honest by unit and end-to-end tests running in CI.

## The goal

Keep a realistic application continuously shippable by growing it test-first, so
design stays simple and every change is backed by a failing-then-passing test.

## What I built

- A C# domain (`TaskService` and friends) grown with xUnit tests in
  Given-When-Then / Arrange-Act-Assert style.
- A TypeScript front end with Playwright end-to-end tests.
- A GitHub Actions pipeline that runs the tests and publishes results on every
  push.

## Practices on display

- Red-Green-Refactor: write a failing test, make it pass, then improve the design.
- Clean code and simple design over speculative abstraction.
- Unit tests for logic, Playwright for real end-to-end behavior.

I am currently modernizing this project with Claude Code, applying the same
[responsible AI-assisted engineering]({{ '/practices/' | relative_url }}) I use
elsewhere: agents accelerate the work while the tests keep it honest.

**Stack** · C# · .NET · TypeScript · xUnit · Playwright · GitHub Actions · CC0

[View the code on GitHub](https://github.com/daveboster/tasks-dotnet)

---

[← Back to Work]({{ '/work/' | relative_url }})
