# RTF_Trainer_Assignment_Share

## Trigger Type / Entry Criteria

- **Type:** Record-Triggered Flow (after save)
- **Object:** `Trainer_Assignment__c`
- **Entry:** Run when a record is created, updated, or deleted and `Client_Profile__c` + `Trainer_Profile__c` are populated.

## Variables

- `varAssignmentId` (Text)
- `varClientProfileId` (Text)
- `varTrainerProfileId` (Text)
- `varAction` (Text: INSERT/UPDATE/DELETE)

## Element Steps

1. Start on assignment lifecycle event.
2. Decision element to branch by action type.
3. Get related records for sharing targets (client/program/session).
4. Invoke Apex action (future version) to grant/revoke shares.
5. Write debug log record for observability.

## Fault Handling Approach

- Fault connectors on each data/Apex element.
- Log fault message and context to a custom error log object or platform event.
- Send admin notification email for unhandled faults.

## Required Permissions

- Read on `Trainer_Assignment__c`, `Client_Profile__c`, `Program__c`, `Training_Session__c`.
- Edit/share permission on target records (or delegated Apex-managed sharing).
- Flow runtime access for trainer/admin personas.
