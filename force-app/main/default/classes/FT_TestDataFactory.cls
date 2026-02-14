public with sharing class FT_TestDataFactory {
  public class DataBundle {
    public Account gym;
    public Contact clientContact;
    public User trainerUser;
    public Trainer_Profile__c trainerProfile;
    public Client_Profile__c clientProfile;
    public Trainer_Assignment__c assignment;
    public Program__c programRec;
    public Training_Session__c sessionRec;
    public Body_Metric__c bodyMetric;
  }

  public static DataBundle createCoreData() {
    DataBundle bundle = new DataBundle();

    bundle.gym = new Account(Name = 'Demo Gym');
    insert bundle.gym;

    bundle.clientContact = new Contact(
      LastName = 'Client',
      AccountId = bundle.gym.Id,
      Email = 'client@example.com'
    );
    insert bundle.clientContact;

    bundle.trainerUser = createTrainerUser();

    bundle.trainerProfile = new Trainer_Profile__c(
      User__c = bundle.trainerUser.Id,
      Account__c = bundle.gym.Id,
      Active__c = true,
      Default_Session_Duration_Min__c = 60,
      Default_Rate__c = 80
    );
    insert bundle.trainerProfile;

    bundle.clientProfile = new Client_Profile__c(
      Contact__c = bundle.clientContact.Id,
      Account__c = bundle.gym.Id,
      Primary_Trainer__c = bundle.trainerProfile.Id,
      Status__c = 'Active'
    );
    insert bundle.clientProfile;

    bundle.assignment = new Trainer_Assignment__c(
      Client_Profile__c = bundle.clientProfile.Id,
      Trainer_Profile__c = bundle.trainerProfile.Id,
      Role__c = 'Primary',
      Active__c = true,
      Start_Date__c = Date.today()
    );
    insert bundle.assignment;

    bundle.programRec = new Program__c(
      Client_Profile__c = bundle.clientProfile.Id,
      Trainer_Profile__c = bundle.trainerProfile.Id,
      Start_Date__c = Date.today(),
      Status__c = 'Draft'
    );
    insert bundle.programRec;

    bundle.sessionRec = new Training_Session__c(
      Client_Profile__c = bundle.clientProfile.Id,
      Trainer_Profile__c = bundle.trainerProfile.Id,
      Session_DateTime__c = System.now().addDays(1),
      Status__c = 'Scheduled',
      Duration_Min__c = 60
    );
    insert bundle.sessionRec;

    bundle.bodyMetric = new Body_Metric__c(
      Client_Profile__c = bundle.clientProfile.Id,
      Metric_Date__c = Date.today(),
      Metric_Type__c = 'Weight',
      Value__c = 75,
      Unit__c = 'kg',
      Source__c = 'Manual'
    );
    insert bundle.bodyMetric;

    return bundle;
  }

  private static User createTrainerUser() {
    Profile trainerProfile = [
      SELECT Id
      FROM Profile
      WHERE Name = 'Standard User'
      LIMIT 1
    ];
    String uniqueStamp = String.valueOf(DateTime.now().getTime());
    User u = new User(
      Alias = ('trn' + uniqueStamp).substring(0, 8),
      Email = 'trainer.' + uniqueStamp + '@example.com',
      EmailEncodingKey = 'UTF-8',
      LastName = 'Trainer',
      LanguageLocaleKey = 'en_US',
      LocaleSidKey = 'en_US',
      ProfileId = trainerProfile.Id,
      TimeZoneSidKey = 'America/Los_Angeles',
      UserName = 'trainer.' + uniqueStamp + '@example.com'
    );
    insert u;
    return u;
  }
}
