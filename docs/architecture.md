# FitnessTracker Architecture

## Overview

FitnessTracker is a Salesforce DX project structured for source-driven development.
The baseline architecture follows standard Salesforce layers:

- Data layer: standard objects plus additive custom fields/metadata
- Service layer: Apex classes for domain logic and integrations
- Presentation layer: Lightning Web Components (LWC) and standard Lightning pages
- Security layer: permission sets and field/object security controls

## Repository Structure

- `force-app/main/default/`: Salesforce source metadata
- `docs/`: Architecture, data model, and security documentation
- `scripts/`: Optional helper scripts for local automation

## Design Principles

- Prefer standard objects first (`Account`, `Contact`, `Task`, `Event`, `ContentDocument`/Files)
- Keep Apex bulk-safe and testable
- Use UI API in LWC whenever possible before custom Apex controllers
- Keep metadata modular and package-friendly
