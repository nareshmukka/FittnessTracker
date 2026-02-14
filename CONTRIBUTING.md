# Contributing

## Scope

This repository contains Salesforce DX source for FitnessTracker.

## Workflow

1. Create a feature branch from `main`.
2. Keep changes focused and small.
3. Add or update tests for Apex changes.
4. Update documentation in `docs/` when architecture, data model, or security changes.
5. Open a pull request and request review from code owners.

## Salesforce Development Standards

- Prefer standard objects before introducing custom objects
- Keep Apex bulk-safe and covered by tests
- Do not use `SeeAllData=true` in tests
- Prefer UI API for LWC data access unless Apex is required

## Commit Guidance

- Use clear, imperative commit messages
- Group related metadata in a single commit
- Avoid unrelated formatting-only changes in functional pull requests
