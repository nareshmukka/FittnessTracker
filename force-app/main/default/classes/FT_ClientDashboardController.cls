public with sharing class FT_ClientDashboardController {
  public class ClientRow {
    @AuraEnabled
    public Id clientProfileId;
    @AuraEnabled
    public String name;
    @AuraEnabled
    public String status;
    @AuraEnabled
    public Id primaryTrainerId;
    @AuraEnabled
    public String primaryTrainerName;
  }

  @AuraEnabled(cacheable=true)
  public static List<ClientRow> getClientProfiles() {
    List<ClientRow> rows = new List<ClientRow>();
    for (Client_Profile__c recordRow : [
      SELECT Id, Name, Status__c, Primary_Trainer__c, Primary_Trainer__r.Name
      FROM Client_Profile__c
      ORDER BY Name
      LIMIT 200
    ]) {
      ClientRow row = new ClientRow();
      row.clientProfileId = recordRow.Id;
      row.name = recordRow.Name;
      row.status = recordRow.Status__c;
      row.primaryTrainerId = recordRow.Primary_Trainer__c;
      row.primaryTrainerName = recordRow.Primary_Trainer__r != null
        ? recordRow.Primary_Trainer__r.Name
        : null;
      rows.add(row);
    }
    return rows;
  }
}
