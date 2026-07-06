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

<style>
.project-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(280px,1fr));gap:1.5rem;margin:1.25rem 0 .5rem}
.project-card{position:relative;display:flex;flex-direction:column;max-width:520px;border:1px solid rgba(128,128,128,.22);border-radius:14px;overflow:hidden;background:var(--card-bg,transparent);color:inherit;box-shadow:0 1px 3px rgba(0,0,0,.08);transition:transform .16s ease,box-shadow .16s ease}
.project-card:hover{transform:translateY(-4px);box-shadow:0 10px 28px rgba(0,0,0,.16)}
.project-card__link{position:absolute;inset:0;z-index:2}
.project-card__link:hover{text-decoration:none}
.project-card__thumb{width:100%!important;height:190px!important;object-fit:cover;object-position:top center;display:block;border:0;margin:0!important;border-radius:0!important}
.project-card__body{display:block;padding:1rem 1.2rem 1.25rem}
.project-card__title{display:block;font-size:1.2rem;line-height:1.2;font-weight:600;margin-bottom:.12rem}
.project-card__subtitle{display:block;font-size:.85rem;color:var(--text-muted-color,#6b7280);margin-bottom:.55rem}
.project-card__desc{display:block;font-size:.95rem;margin-bottom:.6rem}
.project-card__tech{display:block;font-size:.78rem;opacity:.7}
</style>

<div class="project-grid">{%- assign projects = site.projects | sort: "order" -%}
{%- for project in projects -%}{% include project-card.html project=project %}{%- endfor -%}
</div>

More public-safe examples will be added as they clear source review.
