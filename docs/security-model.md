# FitnessTracker Security Model

## Security Posture

FitnessTracker follows Salesforce least-privilege principles with explicit grants through permission sets.

## Access Model

- Organization-wide defaults (OWD) drive record baseline sharing
- Permission Sets grant object, field, and app-level access
- Permission Set Groups aggregate persona-based access bundles
- Profiles remain minimal; business entitlements live in permission sets

## Development Guardrails

- Enforce field-level security and CRUD checks in Apex where required
- Avoid `without sharing` unless there is a documented reason
- No `SeeAllData=true` tests
- Store sensitive files in controlled libraries/workspaces when applicable

## Audit and Compliance

- Track metadata changes in source control
- Require code review for access model changes
- Document all new permission sets and object/field grants in this file
