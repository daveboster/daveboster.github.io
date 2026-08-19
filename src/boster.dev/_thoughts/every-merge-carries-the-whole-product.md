---
layout: thought
title: "Every Merge Carries The Whole Product"
tags: development-process extreme-programming continuous-delivery ai-agents
date: 2026-08-06 09:00:00 -0500
version: 2
---

*A working view on running a small product operation with AI agent
teammates, grounded in Extreme Ownership, Continuous Delivery, the Flow
Framework, and the flywheel — with an honest ledger of what our data
supports so far. Written product-agnostic on purpose: the examples
below are real events from our operation with the product specifics
removed.*

> **TL;DR — run the process like the product.** The summary I would put
> on one slide: agents did not make us faster at writing code so much
> as they changed the economics of completeness — and honest accounting
> is how we keep ourselves from believing our own story. Merge the
> whole product. Count nothing until it is banked. Keep the dream
> written down next to the data, so we will know if we are wrong.

## The Phrase I Kept Reaching For

For months I have described what we do with an old adage: "every merge
to main is releasable." I remember it growing out of both the agile and
DevOps movements — *Continuous Delivery* teaches that every commit
should produce a release candidate — though the older I get, the more
loosely I hold my memory of exactly where it came from. Wherever it
started, it undersells the bar every time I say it.

Here is the bar. If a merge does not carry its feature toggle, its
observability events, its UI tests, its security and compliance review,
and the in-product guidance a user needs to discover the change, then it
is not releasable. It is merely mergeable. Those things are not polish
applied later on the way to a release; they are what the word releasable
means. A CI pipeline can prove a change is mergeable. Only the whole
product can make it releasable.

There is also a deeper reason to want every merge releasable, and I
picked it up from combat training, not software (Willink & Charles,
2022). Value is gained from every merge, not just readiness: every
merge is an iteration, every iteration is practice, and every practice
is getting better — and being ready. The moment something turns on for
real users is the moment nothing goes according to plan; no battle plan
survives first contact, as the old warning goes (commonly credited to
Helmuth von Moltke). If we spend the whole build getting great at our
process — practice and refine, practice and refine — then when things
go south in production, the response is trained, not improvised.

This is the Extreme Programming argument — a whole team delivering
complete increments, nothing coded and thrown over a fence — and for
most of my career it lost on economics. Staffing a tester, a security
reviewer, a compliance reader, a technical writer, and an operations
mindset onto every merge was a luxury. With AI agents as teammates, the
economics inverted, and the adage deserves better language than one
overloaded word.

## A Better Vocabulary: From Mergeable To Banked

We now use a ladder instead of a single claim:

- **Mergeable** — the checks pass. The weakest claim — and for years,
  the one we ourselves meant when we said releasable.
- **Releasable** — the merge carries the whole product: behavior dark
  behind a toggle, telemetry that will prove use, tests at every layer
  the change touches, security and compliance review done, and the user
  guidance authored. It could deploy right now without a meeting.
- **Released** — it is in the delivery channel, in real hands, still
  gated by the toggle. Releasing becomes a business decision about
  audiences, decoupled from deployment.
- **Banked** — evidence of real use has arrived. Not shipped: used.

Banked has rungs of its own, and a team should define them explicitly
against its own stack. Ours look roughly like this, and the pattern
translates directly to any telemetry platform (Application Insights, New
Relic, whatever you have):

1. **First bankable** — the feature's metric shows up in the internal
   environment's telemetry after a deploy. The instrument is proven.
1. **Production bankable** — the metric shows up from production,
   behind the toggle. The whole path is proven.
1. **Banked** — a real user outside the team exercised the feature, and
   the event stream says so.
1. **Endorsed** — explicit feedback names the feature. Rare, gold.

We count completions and bankings side by side: completed shows
throughput, banked (rung three) shows realized value, and everything
delivered but not yet banked is inventory, reported as such.

So instead of the adage, here is the latest sentence I'm playing with —
it will keep changing as we learn and as we work with others:

**Merge the whole product. Count nothing until it is banked.**

## Four Books, One Operating Model

Four frameworks supply the four things an operating model needs —
accountability, mechanics, accounting, and momentum — and none of them
substitutes for the others.

**Extreme Ownership (Willink and Babin) is the accountability model.**
Two rules do most of the work. First: a failure is never terminally
attributed to "the model was bad." Root causes must land on artifacts we
own — agent instructions, handoff contracts, skills, process docs — with
a proposed fix. There are no bad agents, only bad artifacts. Second, the
cold-context check: every handoff artifact must be actionable by someone
(or something) with zero tribal knowledge. If it is not, fix the
artifact, not the agent. Around those rules sits decentralized command:
a direction-and-process role, an orchestration role, implementation
roles, and a dedicated integration role each own their lane end to end,
and the versioned process document is the commander's intent that lets a
cold session act inside its lane without asking.

**Continuous Delivery (Humble and Farley) is the mechanics.** The
distinctive move for us: decoupling deploy from release is the *first
feature of every epic*, not an afterthought. The walking skeleton — a
feature toggle plus one structured telemetry event, no product code —
merges before any behavior does, so every subsequent merge lands dark,
observable, and reversible by construction. Around that: push only
green; a deterministic merge gate (unit tests plus UI tests against
stubs) with live third-party contract tests reserved for a promotion
gate; green pull requests merge even when behind the mainline, and
integration work happens only on a real conflict; and integration is
owned by a dedicated role, so no authoring session merges its own work.
The part my experience keeps finding most true deserves to stand on its
own:

> The process itself runs under continuous delivery. Every process
> change states a hypothesis, a measure, and a revert condition.
> Features are toggle-revertible; process changes are git-revertible.

**The Flow Framework (Kersten's Project to Product) is the
accounting.** Work items are counted, never point-estimated, and we
count two things side by side: completed features and banked features.
Completed shows throughput; banked shows realized value; the gap
between them is inventory, reported honestly — together they give a
more transparent view of delivery than either could alone. We track
flow time from behavior statement to banked, flow load (work in
flight), flow distribution (features versus defects versus risk versus
debt), and change-failure rate and time to restore in the Accelerate
tradition. Cost gets measured on two hard axes and a third we are still
learning to see. For agentic flow it is tokens *and* duration — what
the work consumed, and how long agents took from beginning to end,
measured the way Flow measures features. For development as a whole
there is also the impact on the human. That axis is still fuzzy, but it
points somewhere important: agentic delivery should free attention for
the human experience — to be more human — and reading these measures is
how a developer grows into a lead developer, and a lead into a manager,
as the artifacts and the process keep iterating.

**Jim Collins's flywheel (Good to Great, revisited in Turning the
Flywheel) is the momentum.** None of this started fast. The first
walking skeleton, the first scorecard, the first retro — each felt slow
and disproportionate to its output. The flywheel is why we kept turning
anyway: every complete merge, every banked feature, every process
experiment pushes in a consistent direction, and the accumulated
momentum is what carries the operation through setbacks. The turns
compound; the wheel does not care that any single push felt small.

The product-shaped punchline Kersten would recognize: our product, our
process, and our roadmap all have the same shape now. None of them
conclude. All of them are continuous flows punctuated by milestones and
points of review. Once you see the shape repeat, "project" gets harder
for me to place — it no longer fits the original image I remember it
having.

## Why Agents Change The Economics

The counter-intuitive part deserves its own explanation, because the
objection is obvious: adding security review, compliance review,
telemetry, toggles, tests, and user guidance to *every merge* should
slow a team to a crawl. With humans, it does, which is why deferral —
test debt, dark-launch debt, docs debt — is the rational equilibrium,
and throwing work over the fence, or pushing out the work a release
ultimately needs (the UI testing, the insights), is the norm. In the
moment, it genuinely seems like the right thing to do.

It is the same shape as the old test-driven development argument. Uncle
Bob's counter-math in his TDD videos showed the discipline is not twice
as slow — closer to a 20 to 40 percent hit at first — while the team
that skips it starts faster, then slows and sheds quality as the code
grows, and the disciplined team, maintained and honed, passes them and
keeps pulling away. Completeness per merge follows the same curve: the
cost is front-loaded, and the payoff compounds.

Agents invert this twice.

First, the marginal cost of completeness collapses. Tests, telemetry
events, release notes, and guidance copy are exactly the work agents are
cheap and fast at. The definition of done stops being a tax.

Second, and deeper: agents cannot carry tribal knowledge. A fresh
session knows only what the artifacts say. Throwing work over the fence
does not merely grind against XP values — it mechanically fails, because
whatever was not written down is gone, and there is nobody on the other
side of the fence to remember it. The overhead humans experience as
ceremony is the medium agents think in. Agents do not just make
completeness affordable; they make incompleteness unsustainable.

Surfers train for being held under by a wave: the worst response is
panic, so you relax, slow your breathing, get oriented. A looming
deadline used to trigger the same instinct in me that the wave does —
push the UI tests, push the telemetry, get to the surface. After a lot
of training the pull is weaker, though I still feel it. But when
nothing gets deferred, a deadline stops equaling pressure, because we
are ready to go at any moment; the only question left is what fits
inside the time. And we are never done anyway — after the deadline
passes, we keep moving. The flywheel keeps turning.

That is the whole argument. What follows is the part I think most
write-ups skip: the ledger. Strong claims deserve one, sorted by how
much the data actually backs them.

## Aspiration

The latest description of what we think is possible.

- A very small human team plus agent teammates, where every merge
  carries the whole product and release is a pure business decision.
- A velocity calculation that accounts for banked features alongside
  completed ones, with delivered-but-unbanked work visible as inventory
  and deliberately driven down.
- The whole XP team, finally staffable — test writers, security
  reviewers, compliance readers, docs writers, and an integration owner
  available on demand — with the human supplying intent, judgment, and
  the customer's voice.
- Every role still human, and more important than ever. QA and SDETs,
  security, writers, product, developers all remain; what changes is
  that the humans in those roles focus on honing the role itself, the
  way leaders focus on process while tactical workers focus on syntax
  and changes. The ratio math dissolves — a team closer to one of each
  can deliver what used to take multiple teams of eight to ten, and
  fewer people means communication and change move faster. More of what
  we love, together across roles instead of in isolation.
- An ownership culture where every failure lands on an artifact we can
  fix and no failure is written off as the tooling's fault.
- The operating model itself under continuous delivery: process changes
  landing the moment friction is diagnosed, each one an experiment with
  a revert condition, with retros doing synthesis rather than gating.
- In-product guidance managed as its own small product — an onboarding
  corpus users encounter piece by piece — authored at design time, not
  bolted on after.

## Current Data Results

What the latest data shows us. These are real events, generalized.

- **Banked is real, not aspirational.** The newest features show
  production use by people outside the team — records created, documents
  generated, reports printed — visible in the event stream from
  non-development installs. The finish line of the ladder is being
  crossed, not just defined.
- **The measurement caught our own drift.** Our work-in-flight target
  was set when capacity was smaller. Practice quietly grew to several
  concurrent streams; the flow-load metric surfaced the gap between the
  stated target and observed behavior, and forced the honest question —
  reset the ceiling, or declare the metric descriptive. A measure that
  can embarrass you is working.
- **Per-merge deep review produced churn, and we changed it.** Running
  deep security and compliance review agents inside every authoring
  loop generated repeated iteration against ambiguous, judgment-call
  findings with no path to a ruling. We moved the deep pass to a single
  pre-merge integration gate: findings are documented once, ambiguous
  calls escalate to a human for a ruling, and anything real is filed as
  an ordinary bug through the normal fix cycle. The fast, diff-scoped
  review stays in the authoring loop. Diagnosing the churn was data;
  the fix is an experiment with its own measure.
- **Attribution survived concurrency.** Since instrumenting, every
  process change has carried a dated hypothesis, measure, and revert
  condition, and several have run at once without losing track of which
  change caused what. Retro-gated batching of process changes turned
  out to be the bottleneck; continuous change with retro-as-synthesis
  has held.
- **The verification stack got its authoring order from a real
  integration.** Building against a third-party service, the sequence
  that worked was outside-in: characterize the live sandbox first with
  thin, repeatable contract tests; build a stub faithful to that
  characterization; write the full behavioral spec against the stub;
  then let unit tests drive the code. The live tests stay out of the
  merge gate — they verify the one assumption the stub bakes in, at
  promotion time.
- **Ritual before automation held its value.** Anything with release
  consequences stayed human-confirmed until it had been done by hand
  enough times to know what good looks like — and the one-shot
  automations that followed inherited a known-good ritual instead of a
  guess. Collins and Hansen would call it firing bullets, then
  cannonballs.

## Current Data Speculation

What we speculate, but do not yet have enough data to conclude.

- **Completeness per merge is net cheaper than deferral.** Lived
  experience says yes; the confound is that we changed many things at
  once. The falsifiable version is a change-failure rate and rework
  share that stay flat or fall as throughput rises, measured across
  successive epics.
- **Review findings as artifact-quality telemetry.** The volume and
  kind of security and compliance findings per batch should be a proxy
  for the quality of the prompts, skills, and specs that produced the
  work — a feedback signal for what to improve. The mechanism is
  running; the correlation is not yet established.
- **The banking ladder generalizes.** First-bankable in an internal
  environment, production-bankable behind a toggle, banked on real use:
  we believe any team with decent telemetry can adopt this as its
  definition of done. We have one operation's worth of evidence.
- **Moving deep review to the integration gate improves flow time.**
  Churn visibly dropped; whether end-to-end flow time actually improved
  awaits a few more measured cycles.
- **Token cost per banked feature is a decision-grade number.** The
  trend is legible enough to be interesting; blind spots in collection
  keep it out of the results bucket.

## No Insight

What we have yet to measure, to know whether the results support the
dream.

- **Failure metrics under real fire.** Change-failure rate and time to
  restore are defined, with severity conventions, but the exposure
  window is young. We cannot yet distinguish "the process prevents
  failures" from "we have not shipped enough to be hurt."
- **The behind-the-mainline merge policy's failure mode.** Merging
  green work without rebasing carries a named revert condition — a
  semantic conflict green checks miss. It has not triggered. We do not
  know whether the risk is small or merely unexposed.
- **More humans.** The model currently runs with one human setting
  intent. Whether decentralized command holds with several humans
  sharing the artifacts is deliberately staged and unmeasured.
- **Guidance efficacy.** In-product walkthrough tips ship with
  features, but tip telemetry has not landed, so we cannot say whether
  the guidance banks as changed user behavior.
- **Inventory dynamics.** Delivered-but-never-banked work is defined
  and reportable, but too few epics have closed to show a trend worth
  trusting.
- **The integration role's ceiling.** A single integration owner has
  been an accelerant at current volume. At what pull-request volume it
  becomes the constraint is unknown.
- **The full cost picture.** Token accounting still has named blind
  spots; cost per banked feature is directional until they close.

## Run The Process Like The Product

The summary I would put on one slide: agents did not make us faster at
writing code so much as they changed the economics of completeness —
and honest accounting is how we keep ourselves from believing our own
story. The dream is written down next to the data, in separate buckets,
so we will know if we are wrong.

If you want to try this, start with the vocabulary and the symmetry.
Stop saying releasable when you mean mergeable. Define your banking
ladder against your own telemetry. And run your process the way you run
your product: toggled, observed, measured, and revertible.

## References

- Jocko Willink and Leif Babin, *Extreme Ownership*.
- Jez Humble and David Farley, *Continuous Delivery*.
- Mik Kersten, *Project to Product* (the Flow Framework).
- Nicole Forsgren, Jez Humble, and Gene Kim, *Accelerate* (the failure
  metrics).
- Kent Beck, *Extreme Programming Explained*.
- Jim Collins, *Good to Great* and *Turning the Flywheel* (the
  flywheel).
- Jim Collins and Morten T. Hansen, *Great by Choice* (fire bullets,
  then cannonballs).
- Robert C. Martin, the Clean Coders video series, TDD episodes (the
  initial-cost versus long-run-speed math; specific episode reference
  still to be located).
- Willink, J. (Host). Charles, E. (Director). (2022, July 27). Modern
  Combatives. How We Fight, How We Train, How We Live. w/ Dean Lister
  (No. 344) [Audio podcast episode]. In Jocko Podcast.
  <https://jockopodcast.com/2022/07/27/344-modern-combatives-how-we-fight-how-we-train-how-we-live-w-dean-lister/>
  (timestamp for the in-text reference still to be located).
- [Extreme Programming Projects](/thoughts/extreme-programming-projects/)
  — the earlier argument this article extends.
- [Clean Code for AI Agents](https://akitaonrails.com/en/2026/04/20/clean-code-for-ai-agents/)
  — the cold-context artifact discipline.

---

*Version 2.0 — last updated August 6, 2026. Thoughts are living
articles; this one will keep evolving as the data comes in.*

*The first version of this article was written by me; I then used AI to
refine the structure and help me improve my writing skills.*
