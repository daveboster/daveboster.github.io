# Codex Prompt: Professional Website Refresh

Use this prompt after the strategy and copy in
`docs/content/professional-website-refresh.md` have been reviewed.

```text
We are updating boster.dev from a proof-of-concept personal website into David
Boster's durable individual professional website.

Repository:
- Website repo: daveboster/daveboster.github.io
- Site source: src/boster.dev
- Work branch: dev/professional-website-refresh or a focused dev/... branch
- Production branch: main

Work mode:
- Do not commit directly to main.
- Use preview deployments for review.
- Do not publish or merge to production until David explicitly approves the
  concept, design, and content.

Primary goal:
Implement the approved website strategy and copy from
docs/content/professional-website-refresh.md.

Positioning:
- boster.dev is about David Boster as an individual.
- Treat NewFire Group like an employer or career-history entry only.
- Do not make boster.dev a NewFire Group marketing site, consulting funnel, or
  business referral page.
- If NewFire Group closed tomorrow, boster.dev should still read as accurate
  and useful.

Content model:
- Preserve and improve the existing Blog and Thoughts structure.
- Blog contains polished articles, essays, finished professional writing, or
  durable works.
- Thoughts contains informal notes, working ideas, learning logs, reflections,
  and material that may later become source material for Blog posts.
- A Thought can later be promoted into a Blog post after review, editing, and
  source validation.

LinkedIn consistency:
- Use boster.dev as the canonical public message.
- Keep LinkedIn recommendations aligned with the website.
- LinkedIn should be shorter and platform-native, but must not introduce a
  different professional persona.

Public-safety guardrails:
- This repository is public.
- Do not commit private career-source record IDs, private client names,
  employer-sensitive details, referral context, journal excerpts, or private
  repository details.
- Do not publish claims that are not approved in the private career-source
  claim map.
- If a claim needs review, leave it out of public pages or keep it in a
  non-published planning document.

Inputs to inspect:
- docs/content/professional-website-refresh.md
- Current src/boster.dev pages, posts, thoughts, layouts, and styles
- Current README and repository validation scripts
- Private career-source source map only if David provides it in the private
  context for the session

Implementation expectations:
- Build the new design and content on a dev branch.
- Keep the site personal, professional, readable, and restrained.
- Add or update Home, About, Work, Practices, Blog, Thoughts, and Contact
  surfaces as approved.
- Clarify Blog vs Thoughts without deleting historical content unless requested.
- Keep old posts available unless there is an explicit archive/removal decision.
- Update metadata for clearer search and social previews.

Verification:
- cd src/boster.dev && bundle exec jekyll build
- cd ../.. && bats test
- git diff --check
- If a command fails because of local environment setup, capture the exact error
  and document it in the handoff.

Deliverable:
- Commit changes to the development branch.
- Push the branch for preview when ready.
- Share the preview URL or the GitHub Actions run needed to find it.
- Do not merge to main or otherwise publish production.
```
