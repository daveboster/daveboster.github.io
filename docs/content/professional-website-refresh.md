# Professional Website Refresh

Status: draft strategy and copy package
Branch: `dev/professional-website-refresh`
Production policy: do not publish or merge until David approves the concept,
design, and content.

## Strategic Recommendation

Make boster.dev the canonical public professional home for David Boster as an
individual.

The site should be durable across employers, titles, consulting entities, and
project contexts. NewFire Group can appear as one role in the career timeline,
but the site should not depend on NewFire Group as a brand, sales funnel, or
business referral path.

The site should answer four questions quickly:

1. Who is David professionally?
2. What kinds of software and technology problems does he help with?
3. How does he work with people and teams?
4. What body of work supports that message?

The current polished-writing and Thoughts structure should stay. Writing is for
polished, durable articles and essays. Thoughts is for working ideas, learning
notes, and raw material that may become polished writing later.

## Theme Direction

Use Chirpy as the target Jekyll theme direction.

Chirpy fits the refreshed site because it is text-focused, supports a durable
writing workflow, and gives Writing and Thoughts room to grow through categories,
tags, archives, search, dark/light mode, and an avatar-driven sidebar. It should
be adapted to David's individual professional positioning rather than used as a
generic developer-blog template.

Implementation notes:

- Preserve the existing content distinction between Writing and Thoughts.
- Map polished Writing entries into Chirpy's normal post model.
- Decide whether Thoughts should become a custom collection, a category, or a
  clearly labeled section before migration.
- Keep Home, About, Work, Practices, and Contact as first-class professional
  surfaces, even though Chirpy's default structure is writing-centered.
- Prototype the Chirpy migration on a preview branch before replacing the
  current production site.

## Profile Image Direction

Use the attached candid seated photo as the preferred profile image candidate
for the Chirpy sidebar/avatar treatment.

The photo feels personal and approachable, which fits the individual-first site
direction better than a corporate headshot. Before publishing, create a web
optimized square crop and review it in Chirpy's actual sidebar at desktop and
mobile sizes.

Public repo rule: do not commit the image file into this public repository until
David explicitly approves making that photo public in the website source and
preview branch.

## Positioning Statement

Candidate homepage positioning:

> I help organizations turn complex software, delivery, and technology problems
> into systems that are more understandable, more maintainable, and more useful
> to the people who depend on them.

Candidate supporting language:

> My work sits at the intersection of hands-on software engineering,
> architecture, delivery systems, product thinking, and technical collaboration.
> I have worked across contributor, architect, manager, consultant, and
> independent-builder roles, but the common thread is practical: understand the
> problem, improve the system, and help the people around the work move with
> more clarity.

Review note: publish only after private claim review in career-source.

## Recommended Sitemap

| Page | Purpose | Publish Priority |
| --- | --- | --- |
| Home | Fast individual positioning, current focus, proof points, and next links. | 1 |
| About | Career narrative, operating principles, and how the pieces fit together. | 1 |
| Work | Public-safe body of work, selected projects, talks, writing, and repositories. | 1 |
| Practices | Core working practices: architecture, clean code, delivery, DevOps, product collaboration, and AI-assisted engineering. | 2 |
| Writing | Polished articles and durable public work. | Existing, improve |
| Thoughts | Working notes, ideas, and reflections that may later become Writing material. | Existing, clarify |
| Contact | Individual professional contact path. | 1 |

## Draft Page Copy

### Home

H1:

> David Boster

Lead:

> Software architect, hands-on technical collaborator, and systems-minded
> problem solver.

Body:

> I help teams make software work better: clearer architecture, healthier
> delivery systems, stronger engineering practices, and technology decisions
> that stay connected to real organizational needs.
>
> My background crosses software development, architecture, DevOps, technical
> leadership, product collaboration, business technology strategy, and
> independent product work. I am most useful when the problem is bigger than one
> code change and still concrete enough that someone needs to make progress.

Primary links:

- About
- Work
- Practices
- Writing
- Thoughts
- Contact

Proof-point candidates for private review:

- Platform transformation and modernization experience.
- Clean Coding, XP, TDD, refactoring, pairing, and simple design.
- CI/CD, deployment automation, feature flags, and release safety.
- Cloud, DevOps, GitHub, Azure, AWS, Octopus Deploy, TeamCity, and related
  delivery tooling.
- Hands-on collaboration with developers, architects, DevOps, and product
  stakeholders.
- Responsible AI-assisted engineering as a current working practice.

### About

Candidate introduction:

> I am a software professional in Omaha, Nebraska with a career spanning
> hands-on development, architecture, technical leadership, business technology,
> and independent product work.
>
> Titles have changed over time: developer, systems engineer, architect,
> teacher, manager, consultant, founder, and builder. The consistent pattern is
> that I work close to the details while staying connected to the larger system:
> the people, business needs, delivery flow, technical constraints, and long-term
> maintainability of the work.

Candidate working style:

> I care about making software delivery more human, more effective, and more
> achievable. That means clear communication, steady improvement, strong
> engineering habits, and enough hands-on practice to collaborate credibly with
> the people doing the work.

Review note: keep family/personal details optional and intentionally scoped. The
site can be personal without making the professional homepage depend on family
or private life context.

### Work

Purpose:

> This page should show the body of work behind the homepage claims. It should
> favor reviewed, public-safe examples over exhaustive career history.

Candidate sections:

- Selected public projects
- Software delivery and DevOps work
- Architecture and modernization work
- Technical leadership and developer enablement
- Writing, talks, and teaching
- Current learning and experiments

Candidate intro:

> My work has usually lived inside teams, organizations, client systems, and
> product efforts where not every detail can be public. This page collects the
> examples that can be shared responsibly: public repositories, writing,
> reusable patterns, teaching material, and selected project summaries.

Review note: do not list private repository names, client names, employer
security details, journal entries, or sensitive project details without explicit
public review.

### Practices

Candidate intro:

> These are the practices I return to when software work gets complicated.
> Tools change. Team shapes change. The useful habits stay recognizable.

Candidate sections:

- Clean code and simple design
- Test-driven development and refactoring
- Pairing, coaching, and technical collaboration
- Continuous delivery, feature flags, and release safety
- Architecture and platform modernization
- Product thinking and stakeholder collaboration
- Responsible AI-assisted engineering

Candidate AI-assisted engineering language:

> I use AI-assisted engineering as a way to sharpen thinking, accelerate
> exploration, improve documentation, and work through implementation options
> with more feedback. I treat these tools like other engineering tools: useful
> when applied with judgment, verification, and clear responsibility.

Review note: do not imply specific production experience with any named AI tool
unless the private source map supports it.

### Writing

Definition:

> Writing entries are polished, durable pieces of writing. They should be edited,
> source-aware, and useful to someone other than future me.

Candidate page intro:

> Polished writing about software, delivery, leadership, learning, and the
> practice of building systems with people.

Writing acceptance criteria:

- Has a clear audience and point.
- Has been edited for public readability.
- Uses citations or links when referencing outside work.
- Does not expose private client, employer, or personal information.
- Can stand as a finished public artifact.

### Thoughts

Definition:

> Thoughts are working notes. They can be rough, incomplete, exploratory, or
> personal reflections that may later become Writing entries.

Candidate page intro:

> Working notes, questions, fragments, and learning trails. Some may become
> polished writing later; others are useful because they show the thinking while
> it is still in motion.

Thoughts acceptance criteria:

- Clearly labeled as working material.
- No unresolved placeholder text that looks accidental.
- No private information that should not be public.
- Roughness is intentional, not neglected.

### Contact

Candidate intro:

> The best way to reach me is through the contact paths listed here. I am open
> to thoughtful conversations about software, delivery, technical collaboration,
> architecture, product work, and professional opportunities.

Review note: decide whether contact should point to email, LinkedIn, GitHub, or
a dedicated form before implementation.

## Writing And Thoughts Editorial Model

Use this promotion path:

1. Capture raw idea in `docs/content/ideas-backlog.md` or as a private note.
2. Draft as a Thought if it is useful to publish while still exploratory.
3. Promote to Writing only after the idea has a clear audience, edited structure,
   source checks, and privacy review.
4. Link the Writing entry back to the originating Thought when that history adds
   value.

Content rules:

- Writing is polished.
- Thoughts are intentionally rough but not careless.
- Private career evidence stays private until reviewed.
- Older posts can remain historical, but should be framed as archive material
  if they no longer represent the current public message.

## Public-Safe Source Map Stub

This repository is public. Do not commit the private career-source claim map
here.

Maintain the real internal source map in the private career-source repository.
The private map should link each claim below to reviewed source record IDs or
mark it as `needs review`.

| Public Claim Candidate | Website Use | Public Repo Status |
| --- | --- | --- |
| David Boster is a software architect and hands-on technical collaborator. | Home, About | Needs private source review |
| David works across software engineering, architecture, delivery systems, product thinking, and technical collaboration. | Home, About | Needs private source review |
| David cares about software delivery experiences that are more human, effective, and achievable. | Home, About, Practices | Needs private source review |
| David has experience with clean coding, XP, TDD, refactoring, pairing, and simple design. | Practices | Needs private source review |
| David has experience with CI/CD, release safety, deployment automation, and DevOps practices. | Practices, Work | Needs private source review |
| David has worked across contributor, architect, manager, consultant, and independent-builder contexts. | About | Needs private source review |
| David uses AI-assisted engineering responsibly as a current working practice. | Practices | Needs private source review |
| Public repositories and writing can demonstrate selected parts of David's body of work. | Work | Needs public link review |

## Public-Safety Review List

Do not publish without explicit review:

- Private client names or client-identifying project details.
- Employer-sensitive implementation, security, deployment, or business details.
- Private repository names, language statistics, issue history, or project
  metadata.
- Referral context from job opportunities.
- Journal excerpts or personal notes.
- Claims based only on imported resumes, LinkedIn exports, or raw notes without
  durable reviewed records.
- Tool-specific AI claims that are not supported by reviewed source records.

## LinkedIn Alignment

Website is the canonical public message. LinkedIn should become the compressed
profile version.

### Candidate LinkedIn Headline

> Software architect and hands-on technical collaborator helping teams improve
> software delivery, platform modernization, and engineering practices.

Alternative:

> Software architect | Technical collaborator | Delivery systems, clean code,
> DevOps, platform modernization, and responsible AI-assisted engineering.

### Candidate LinkedIn About

> I help teams make software work better: clearer architecture, healthier
> delivery systems, stronger engineering practices, and technology decisions
> connected to real organizational needs.
>
> My work has crossed hands-on software development, architecture, DevOps,
> technical leadership, business technology strategy, and independent product
> work. I am most useful when the problem is larger than one code change but
> concrete enough that a team needs to make practical progress.
>
> I care about software delivery experiences that are more human, more
> effective, and more achievable. That shows up in clean code, testing,
> refactoring, pairing, release safety, platform modernization, and technical
> collaboration with the people closest to the work.

Review note: this is draft profile copy only. Update LinkedIn after the website
message is approved.

### LinkedIn Consistency Checklist

- Headline matches the homepage lead.
- About section uses the same core language as boster.dev, in shorter form.
- Current role does not make the whole profile depend on NewFire Group.
- Experience entries support the same individual story rather than separate
  personas.
- Featured links point to boster.dev, selected public work, and polished Writing
  posts.
- Skills match visible practices: software architecture, software development,
  technical leadership, DevOps, CI/CD, clean code, TDD, cloud, product
  collaboration, and AI-assisted engineering after review.

## Implementation Backlog

Do these only after strategy and copy review:

1. Create the private career-source claim map for approved public copy.
2. Refresh the homepage around the new individual-first positioning.
3. Add About, Work, Practices, and Contact pages.
4. Update Writing and Thoughts index copy to clarify their editorial roles.
5. Triage visible Thoughts for placeholders and archive/update decisions.
6. Update site metadata for clearer search and social previews.
7. Design a more polished visual system while keeping the site readable and
   personal.
8. Build locally and run repository validation.
9. Push the development branch and use the preview deployment for review.
10. Publish to production only after explicit approval.

## Acceptance Criteria For This Strategy Phase

- boster.dev is individual-first and employer-independent.
- NewFire Group is not used as the site brand, funnel, or primary call to
  action.
- Writing and Thoughts remain first-class sections with clearer roles.
- LinkedIn alignment is planned from the same canonical message.
- Private source mapping is explicitly kept out of the public website repo.
- No production content changes are made before concept and copy approval.
