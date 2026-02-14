@IsTest
private class FT_ClientDashboardControllerTest {
  @IsTest
  static void testGetClientProfilesReturnsRows() {
    FT_TestDataFactory.DataBundle dataBundle = FT_TestDataFactory.createCoreData();

    Test.startTest();
    List<FT_ClientDashboardController.ClientRow> rows = FT_ClientDashboardController.getClientProfiles();
    Test.stopTest();

    System.assert(!rows.isEmpty(), 'Expected at least one client profile row.');
    Boolean found = false;
    for (FT_ClientDashboardController.ClientRow row : rows) {
      if (row.clientProfileId == dataBundle.clientProfile.Id) {
        found = true;
        System.assertEquals('Active', row.status);
      }
    }
    System.assert(found, 'Expected seeded profile in dashboard response.');
  }
}
