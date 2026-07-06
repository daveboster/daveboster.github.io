---
title: SwiftSankeyDiagram
subtitle: A reusable SwiftUI Swift Package
image: /assets/img/work/swift-sankey-diagram.svg
image_alt: >-
  Example cashflow Sankey diagram: income sources (salary, freelance,
  investments) flowing into spending categories.
image_fit: contain
blurb: >-
  An open-source SwiftUI package for drawing Sankey diagrams from app-owned
  data, published via Swift Package Manager with tests, CI, and PNG/PDF export.
tech: Swift · SwiftUI · Swift Package Manager · iOS / macOS · MIT
order: 2
---

{% include site-shot.html src=page.image alt=page.image_alt caption="An illustrative cashflow Sankey, the kind of flow SwiftSankeyDiagram renders from an app's own data." %}

SwiftSankeyDiagram is a small, focused SwiftUI package for drawing
[Sankey diagrams](https://en.wikipedia.org/wiki/Sankey_diagram): flow
visualizations that show how quantities move between categories. It is built to
drop into an iOS or macOS app and render diagrams from data the app already
owns.

## The goal

Package Sankey rendering as a clean, reusable component so any SwiftUI app can
visualize flows without reinventing the layout math, and without the library
dictating the app's data model.

## What I built

- A SwiftUI package with a small, composable API: `SankeyNode`, `SankeyLink`,
  `SankeyDiagram`, and `SankeyDiagramStyle`.
- A clean boundary: the package handles only rendering, while host apps map
  their own types into the diagram model.
- Export to PNG and PDF through SwiftUI's `ImageRenderer`.
- Swift Package Manager distribution with semantic versioning, tests, CI
  validation, a security policy, and contributor guidelines.
- Runnable Swift Playgrounds that demonstrate income and expense visualizations.

## Design notes

- Generic over the app's data, so the same component can serve budgets,
  pipelines, energy flows, or any quantity that moves between stages.
- Styling is separated from structure through `SankeyDiagramStyle`, so the look
  can change without touching the data or layout.
- Developed with an agentic engineering workflow, documented in the repository's
  Codex Xcode integration guide, in the same responsible, human-in-the-loop way
  described on the [Practices]({{ '/practices/' | relative_url }}) page.

**Stack** · Swift · SwiftUI · Swift Package Manager · iOS / macOS · MIT license

[View the package on GitHub](https://github.com/daveboster/SwiftSankeyDiagram)

---

[← Back to Work]({{ '/work/' | relative_url }})
