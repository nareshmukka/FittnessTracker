public with sharing class FT_AssignmentSharingService {
  public static void handleAfterInsert(
    List<Trainer_Assignment__c> newAssignments
  ) {
    if (newAssignments == null || newAssignments.isEmpty()) {
      return;
    }
    processAssignments(newAssignments, null, TriggerOperation.AFTER_INSERT);
  }

  public static void handleAfterUpdate(
    List<Trainer_Assignment__c> newAssignments,
    Map<Id, Trainer_Assignment__c> oldMap
  ) {
    if (newAssignments == null || newAssignments.isEmpty()) {
      return;
    }
    processAssignments(newAssignments, oldMap, TriggerOperation.AFTER_UPDATE);
  }

  public static void handleAfterDelete(
    List<Trainer_Assignment__c> oldAssignments
  ) {
    if (oldAssignments == null || oldAssignments.isEmpty()) {
      return;
    }
    processAssignments(oldAssignments, null, TriggerOperation.AFTER_DELETE);
  }

  private static void processAssignments(
    List<Trainer_Assignment__c> assignments,
    Map<Id, Trainer_Assignment__c> oldMap,
    TriggerOperation operation
  ) {
    Set<Id> clientProfileIds = new Set<Id>();
    Set<Id> trainerProfileIds = new Set<Id>();

    for (Trainer_Assignment__c assignmentRec : assignments) {
      if (assignmentRec.Client_Profile__c != null) {
        clientProfileIds.add(assignmentRec.Client_Profile__c);
      }
      if (assignmentRec.Trainer_Profile__c != null) {
        trainerProfileIds.add(assignmentRec.Trainer_Profile__c);
      }
    }

    // TODO: implement sharing grant/revoke logic for client/program/session records.
    // The sets above provide bulk-collected identifiers for future queries and DML.
    System.debug(
      LoggingLevel.INFO,
      'FT_AssignmentSharingService TODO operation=' +
        String.valueOf(operation) +
        ' clients=' +
        clientProfileIds.size() +
        ' trainers=' +
        trainerProfileIds.size() +
        ' oldMapProvided=' +
        String.valueOf(oldMap != null)
    );
  }
}
