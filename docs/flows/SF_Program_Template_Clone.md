# SF_Program_Template_Clone

## Trigger Type / Entry Criteria

- **Type:** Screen Flow
- **Launch:** Program record quick action.
- **Entry:** Source program selected and target client provided.

## Variables

- `varSourceProgramId` (Text)
- `varTargetClientProfileId` (Text)
- `varTargetTrainerProfileId` (Text)
- `varStartDate` (Date)
- `varCloneNotes` (Text)

## Element Steps

1. Screen: select source program and target details.
2. Get source `Program__c` and validate status.
3. Create new `Program__c` in `Draft` status.
4. (Future) clone child workout/nutrition records.
5. Screen confirmation with link to new program.

## Fault Handling Approach

- Fault connectors to rollback branch where possible.
- Capture exception details and source/target IDs.
- Notify admin and show user remediation guidance.

## Required Permissions

- Read on source `Program__c`.
- Create on `Program__c`.
- Read on related `Client_Profile__c` and `Trainer_Profile__c`.
