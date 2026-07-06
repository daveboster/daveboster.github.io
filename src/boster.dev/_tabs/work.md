---
title: Work
icon: fas fa-briefcase
order: 3
---

My work has usually lived inside teams, organizations, client systems, and
product efforts where not every detail can be public. This page collects the
examples that can be shared responsibly: public repositories, writing, reusable
patterns, teaching material, and selected project summaries.

## Selected Projects

### Leonard — a family storytelling site, shipped like production software

A Jekyll site where my family records adventures and memories around *Leonard*,
an emotional-support-fry character. A personal project, held to the same
delivery standards I bring to professional work.

**The problem** · Turn scattered, real-world journaling (captured in Day One)
into a durable, published site without manual copy-paste, and keep the whole
thing reproducible and safe to deploy on a whim.

**My role** · Sole designer, builder, and maintainer.

- Built on Jekyll with a GitHub Actions pipeline: build, test, preview, deploy.
- Automated the Day One import as a purpose-built **Codex agent skill**: it
  pulls journal exports into structured posts, converts photo placeholders into
  web image links, and guards against accidental overwrites, all through a
  dry-run, review, apply, and verify workflow that keeps a human in the loop.
- Added local test and preview scripts so every change is verifiable before it
  ships.

**Why it's here** · It is small and personal, but it shows how I work when no
one is watching, and how I actually practice responsible AI-assisted
engineering: agents automate the tedium, while a dry run, a review gate, and a
build check keep judgment and responsibility with me.

**Stack** · Jekyll · Ruby 3.2 · Python · Shell · GitHub Actions · GitHub Pages ·
Codex (AI-assisted engineering)

[Visit fryventures.com](https://fryventures.com) · [View on GitHub](https://github.com/daveboster/leonard)

---

More public-safe examples will be added as they clear source review.
