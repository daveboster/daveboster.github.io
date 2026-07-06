---
title: Leonard
subtitle: Demo site for a custom Jekyll theme
image: /assets/img/work/leonard-home.webp
image_alt: >-
  Leonard homepage: a smiling fry character in sunglasses leaning out of a
  vintage camper on a coastal road at sunset.
blurb: >-
  fryventures.com is the live example site for newfire_theme, a custom Jekyll
  theme I designed and built with an agentic design-and-coding workflow, wrapped
  around a character world I make with my family.
tech: Jekyll · Ruby · Custom theme · Agentic engineering · CI/CD
order: 1
---

{% include site-shot.html src=page.image alt=page.image_alt url="fryventures.com" caption="The Leonard homepage, live at <a href='https://fryventures.com'>fryventures.com</a>." %}

fryventures.com is the live example site for **newfire_theme**, a custom Jekyll
theme I designed and built. It doubles as a character storytelling world I make
with my family, which makes it a real, deployed proof that the theme holds up in
the wild rather than a throwaway demo page.

## The goal

Build a reusable, self-contained Jekyll theme, and prove it with a living site
instead of a static demo.

## What I built

- **newfire_theme** — a custom Jekyll theme: layouts, includes, styling,
  navigation, and configuration designed to be reused across sites.
- The example site itself, fryventures.com, as the theme's real-world showcase.
- A GitHub Actions pipeline: build, test, preview, deploy.

## Designed and coded with agents

I built the theme and the site using an agentic design-and-coding workflow:
agents accelerate design and implementation, while I keep judgment, review, and
verification in my own hands. It is the same responsible AI-assisted engineering
described on the [Practices]({{ '/practices/' | relative_url }}) page, applied
end to end on a real project.

## Details

- A small Codex skill imports Day One journal entries into field-note posts
  through a `dry-run → review → apply → verify` flow, so automation never writes
  unreviewed changes.
- The theme keeps content, layout, and styling cleanly separated, so posts,
  pages, and navigation stay simple to maintain.

**Stack** · Jekyll · Ruby 3.2 · Custom theme (newfire_theme) · Agentic
engineering · GitHub Actions · GitHub Pages

[Visit fryventures.com](https://fryventures.com) · [View the code on GitHub](https://github.com/daveboster/leonard)

---

[← Back to Work]({{ '/work/' | relative_url }})
