# FitnessTracker Data Model

## Baseline Strategy

The initial data model uses Salesforce standard objects to reduce maintenance overhead
and align with native platform capabilities.

## Core Standard Objects

- `Account`: household, gym, or organization-level profile
- `Contact`: individual member/athlete profile
- `Task`: planned actions (follow-up, coaching checklist, reminders)
- `Event`: scheduled sessions, assessments, or appointments
- `ContentDocument`/Files: attachments such as plans, progress photos, waivers

## Extension Pattern

- Add custom fields on standard objects as requirements emerge
- Use lookup/master-detail only when cross-object reporting and ownership model require it
- Introduce custom objects only after validating that standard objects cannot satisfy the use case

## Naming Conventions

- Custom fields: `DomainPurpose__c` (example: `TrainingGoal__c`)
- Metadata API names remain stable after introduction
- Descriptions are required for every custom field and validation rule
