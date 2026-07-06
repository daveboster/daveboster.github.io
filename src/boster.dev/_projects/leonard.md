---
title: Leonard
subtitle: A family storytelling site, shipped like production software
image: /assets/img/work/leonard-home.webp
image_alt: >-
  Leonard homepage: a smiling fry character in sunglasses leaning out of a
  vintage camper on a coastal road at sunset.
blurb: >-
  A Jekyll family site with a Codex-powered Day One import pipeline and full
  CI/CD, treated like production software.
tech: Jekyll · Ruby · Python · Codex · GitHub Actions
order: 1
---

{% include site-shot.html src=page.image alt=page.image_alt url="fryventures.com" caption="The Leonard homepage, live at <a href='https://fryventures.com'>fryventures.com</a>." %}

Leonard is a Jekyll site where my family records adventures and memories around
*Leonard*, an emotional-support-fry character. It is a personal project, and a
place I hold to the same delivery standards I bring to professional work.

## The problem

Turn scattered, real-world journaling (captured in the Day One app) into a
durable, published site without manual copy-paste, and keep the whole thing
reproducible and safe to deploy on a whim.

## What I built

- A Jekyll site with a GitHub Actions pipeline: build, test, preview, deploy.
- A purpose-built **Codex agent skill** that imports Day One journal exports into
  structured posts. It converts Day One photo placeholders into web image links,
  detects title mismatches to guard against accidental overwrites, and applies
  conservative banner-image rules.
- Local test and preview scripts so every change is verifiable before it ships.

## Responsible AI-assisted engineering

The import skill is a working example of how I use AI-assisted engineering: an
agent handles the tedium, but the workflow keeps a human in the loop at every
step, `dry-run → review → apply → verify`. Judgment, verification, and
responsibility stay with me. This is the same practice described on the
[Practices]({{ '/practices/' | relative_url }}) page, applied to a real project.

## Why it belongs here

It is small and personal, but it shows how I work when no one is watching:
automate the tedium, make delivery repeatable, and treat even a joyful side
project as a system worth maintaining.

**Stack** · Jekyll · Ruby 3.2 · Python · Shell · GitHub Actions · GitHub Pages ·
Codex (AI-assisted engineering)

[Visit fryventures.com](https://fryventures.com) · [View the code on GitHub](https://github.com/daveboster/leonard)

---

[← Back to Work]({{ '/work/' | relative_url }})
