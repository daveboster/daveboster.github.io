---
title: bowling-game-powershell
subtitle: The Bowling Game kata, TDD in PowerShell
image: /assets/img/work/bowling-game-powershell.png
image_alt: >-
  A Pester test from the bowling kata verifying that rolling a 3 and a 4
  scores 7.
blurb: >-
  The classic Bowling Game TDD kata, implemented in PowerShell with the Pester
  framework and run in CI, as deliberate practice in test-driven design.
tech: PowerShell · Pester · TDD · GitHub Actions · MIT
order: 4
---

{% include site-shot.html src=page.image alt=page.image_alt caption="A Pester test case from the kata, verifying a simple two-roll score." %}

bowling-game-powershell is the classic Bowling Game kata, implemented in
PowerShell with the [Pester](https://pester.dev) testing framework. The kata is
deliberate practice: build a bowling score calculator one small test at a time.

## The goal

Practice test-driven development on familiar ground, in a language where TDD is
less common, and keep the whole thing runnable in CI.

## What I built

- A `Get-Bowling` scorecard implementation grown test-first with Pester.
- Test cases covering gutter games, open frames, spares, strikes, and the tenth
  frame bonus balls.
- A GitHub Actions workflow that runs the Pester suite on Ubuntu.

## Why it's here

Katas are how I keep the fundamentals sharp. This one shows test-driven design,
clear naming, and CI discipline applied to a small, complete problem, in a
scripting language rather than a typical application stack.

**Stack** · PowerShell · Pester · GitHub Actions · MIT license

[View the code on GitHub](https://github.com/daveboster/bowling-game-powershell)

---

[← Back to Work]({{ '/work/' | relative_url }})
