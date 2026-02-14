# SF_New_Client_Onboarding

## Trigger Type / Entry Criteria

- **Type:** Screen Flow
- **Launch:** Utility bar/App page action for intake staff.
- **Entry:** New client intake when contact/account are known or need creation.

## Variables

- `varAccountId` (Text)
- `varContactId` (Text)
- `varPrimaryTrainerProfileId` (Text)
- `varGoalsSummary` (Text)
- `varMedicalNotes` (Text, admin-only screen component)

## Element Steps

1. Screen 1: capture account/contact basics.
2. Upsert account/contact records.
3. Screen 2: assign primary trainer and capture goals.
4. Create `Client_Profile__c` with status `Active`.
5. Optional screen to create initial `Program__c` and first `Training_Session__c`.
6. Confirmation screen with generated record links.

## Fault Handling Approach

- Fault routes on all create/update elements.
- Display friendly error plus reference code.
- Persist context for support in an error logging object.

## Required Permissions

- Create/Edit on Account, Contact, `Client_Profile__c`.
- Create on `Program__c` and `Training_Session__c` for optional step.
- FLS for `Medical_Notes__c` restricted to admin-only users.
