# Content Freshness Audit - 2026-06-23

## Scope

This audit covers the content freshness next step after the idea backlog
migration. The goal is not to rewrite content in-place, but to identify active
content work that is specific enough to track in GitHub issues.

Reviewed:

- homepage/about copy
- published posts
- published thoughts
- unpublished thought drafts
- migrated ideas backlog

## Findings

### Homepage and About Copy

The homepage is still directionally useful, but it reads like an early personal
site introduction rather than a current public profile.

Evidence:

- The phrase `professional software developer [manager]` looks like an unresolved
  placeholder.
- `whose works I continue study today` should be revised.
- The page explains why the site exists, but it does not clearly say what a
  visitor should understand about Dave today.
- The site-wide description is memorable but not descriptive for search or social
  previews.

Recommended active work:

- Create a content work issue to refresh the homepage/about positioning.

### Published Posts

The posts are mostly historical and can stay that way, but they would benefit
from clearer framing.

Evidence:

- `Getting to know GitHub Pages` is useful as a historical first-post artifact.
- `Hi, I'm Dave, nice to meet you!` duplicates the homepage title and uses older
  self-description that may no longer match the current public profile.
- `Healthcare, technology, and lessons yet to be learned` is a substantive post
  that may need a current-status note before further promotion.

Recommended active work:

- Review whether old introductory posts should be framed as archive/history,
  updated, or left alone.
- If the healthcare post is updated, research current facts at the time of the
  edit rather than relying on this audit.

### Published Thoughts

Several thoughts are useful seeds, but some visible pages still read like working
notes.

Evidence:

- `My Programmer's Oath` contains multiple `Placeholder to elaborate...` sections.
- `Incidental and Informal Learning Theory` contains `future backlink should go
  here` and `More to come as I unpack this.`
- `Engineering Leadership` has a `Thought Backlog` section embedded in the
  published page.
- Some thoughts use `start-date` instead of `date`, which makes their generated
  metadata less clear than the dated thoughts.

Recommended active work:

- Create a content work issue to triage published thoughts into keep/update/archive
  decisions and clean up visible placeholder language.

### Unpublished Drafts

The unpublished draft area needs a light cleanup so future Codex sessions can
trust what is intentional.

Evidence:

- `_thoughts/_template.md` is unpublished but has an invalid-looking date value:
  `2022-12- 09:00:00 -0600`.
- `_thoughts/feature-toggles.md` is unpublished and contains several rough-draft
  typos and incomplete sections.

Recommended active work:

- Create a content work issue to either promote, rewrite, or move unpublished
  drafts back into the ideas backlog.

### Ideas Backlog

The ideas backlog is now the right place for raw writing ideas. No immediate
issue should be created for every backlog item.

Recommended active work:

- Use the backlog only when selecting a concrete draft or revision.
- Keep active issues limited to content work that has acceptance criteria.

## Proposed Issues

1. Refresh homepage and public profile copy.
2. Triage published thoughts for placeholder and freshness cleanup.
3. Triage unpublished drafts and decide promote, rewrite, or backlog.

## Verification

This audit is a content planning artifact. No site behavior changes are made by
this document.
