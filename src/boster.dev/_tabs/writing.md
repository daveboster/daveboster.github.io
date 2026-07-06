---
title: Writing
icon: fas fa-pen-nib
order: 1
permalink: /writing/
---

Polished writing about software, delivery, leadership, learning, and the
practice of building systems with people.

{% for post in site.posts %}
## [{{ post.title }}]({{ post.url | relative_url }})

{% if post.description %}
{{ post.description }}
{% else %}
{{ post.excerpt | strip_html | truncatewords: 40 }}
{% endif %}

{% endfor %}
