---
title: Thoughts
icon: fas fa-lightbulb
order: 2
permalink: /thoughts/
---

Working notes, questions, fragments, and learning trails. Some may become
polished writing later; others are useful because they show the thinking while
it is still in motion.

{% assign sorted_thoughts = site.thoughts | sort: "date" | reverse %}
{% for thought in sorted_thoughts %}
{% unless thought.published == false %}
## [{{ thought.title }}]({{ thought.url | relative_url }})

{{ thought.excerpt | strip_html | truncatewords: 40 }}

{% endunless %}
{% endfor %}
