---
layout: thought
title: "Extreme Programming Projects"
tags: development-process extreme-programming build-pipelines
start-date: 2022-11-18 17:00:00 CST
version: 1
---

A process for starting a greenfield or proof-of-concept project using the principles of Extreme Programming. After the first iteration of Red-Green-Refactor, I want to establish an automated build pipeline, publish test results, and code coverage results.

Create a new repository for the Proof of Concept.

## Basic process

1. Using Test-Driven Development (TDD), complete first Red-Green-Refactor; push to changes.
2. Create initial pipeline to build project; push changes;
3. Require successful build for Pull Requests into Main branch.
4. Add unit test results to pipeline.
5. Add test coverage to pipeline.
6. Continue TDD.

## Add Presentation/Service Layer

1. Start with the basic process
2. Add continuous deployment to pipeline.
3. Continue TDD

## Add Persistent Storage

1. Start with the basic process
2. Add continuous deployment to pipeline.
3. Continue TDD
