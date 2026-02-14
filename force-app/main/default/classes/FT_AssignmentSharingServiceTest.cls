@IsTest
private class FT_AssignmentSharingServiceTest {
  @IsTest
  static void testBulkLifecycleNoExceptions() {
    FT_TestDataFactory.DataBundle seed = FT_TestDataFactory.createCoreData();

    List<Trainer_Assignment__c> bulkAssignments = new List<Trainer_Assignment__c>();
    for (Integer i = 0; i < 50; i++) {
      bulkAssignments.add(
        new Trainer_Assignment__c(
          Client_Profile__c = seed.clientProfile.Id,
          Trainer_Profile__c = seed.trainerProfile.Id,
          Role__c = 'Secondary',
          Active__c = true,
          Start_Date__c = Date.today().addDays(i)
        )
      );
    }

    Test.startTest();
    insert bulkAssignments;
    FT_AssignmentSharingService.handleAfterInsert(bulkAssignments);

    for (Trainer_Assignment__c rec : bulkAssignments) {
      rec.Active__c = false;
      rec.End_Date__c = Date.today().addDays(30);
    }
    Map<Id, Trainer_Assignment__c> oldMap = new Map<Id, Trainer_Assignment__c>(
      [
        SELECT Id, Active__c, End_Date__c, Trainer_Profile__c, Client_Profile__c
        FROM Trainer_Assignment__c
        WHERE Id IN :bulkAssignments
      ]
    );
    update bulkAssignments;
    FT_AssignmentSharingService.handleAfterUpdate(bulkAssignments, oldMap);

    delete bulkAssignments;
    FT_AssignmentSharingService.handleAfterDelete(bulkAssignments);
    Test.stopTest();

    System.assertEquals(
      0,
      [SELECT COUNT() FROM Trainer_Assignment__c WHERE Id IN :bulkAssignments]
    );
  }
}
