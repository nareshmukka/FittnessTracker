# RTF_Training_Session_AfterSave

## Trigger Type / Entry Criteria

- **Type:** Record-Triggered Flow (after save)
- **Object:** `Training_Session__c`
- **Entry:** Run on create/update when `Session_DateTime__c` or `Status__c` changes.

## Variables

- `varSessionId` (Text)
- `varClientProfileId` (Text)
- `varTrainerProfileId` (Text)
- `varSessionStatus` (Text)

## Element Steps

1. Start after save on session changes.
2. Decision: status transition rules (Scheduled/Completed/No-show/Cancelled).
3. Create task/notification for trainers on status exceptions.
4. Optionally create follow-up metric reminder when completed.
5. Update derived summary fields (future extension).

## Fault Handling Approach

- Use fault paths to central logging subflow.
- Store failed interview context and retry hints.
- Notify admins with flow interview link.

## Required Permissions

- Read/Edit on `Training_Session__c`.
- Read on `Client_Profile__c` and `Trainer_Profile__c`.
- Create on Task/notification objects when enabled.
