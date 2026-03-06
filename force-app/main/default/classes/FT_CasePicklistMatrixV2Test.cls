@IsTest
private class FT_CasePicklistMatrixV2Test {
  @IsTest
  static void returnsMatrixWhenVerifiedAndClassificationRequested() {
    FT_CasePicklistDependencyMatrixActionV2.Request req = new FT_CasePicklistDependencyMatrixActionV2.Request();
    req.isVerified = true;
    req.requestKey = 'classification';

    Test.startTest();
    List<FT_CasePicklistDependencyMatrixActionV2.Response> results = FT_CasePicklistDependencyMatrixActionV2.getCasePicklistValues(
      new List<FT_CasePicklistDependencyMatrixActionV2.Request>{ req }
    );
    Test.stopTest();

    System.assertEquals(1, results.size());
    System.assertEquals('OK', results[0].status);
    System.assertNotEquals(null, results[0].matrixJson);
  }

  @IsTest
  static void returnsErrorWhenRequestInvalid() {
    FT_CasePicklistDependencyMatrixActionV2.Request req = new FT_CasePicklistDependencyMatrixActionV2.Request();
    req.isVerified = false;
    req.requestKey = 'classification';

    List<FT_CasePicklistDependencyMatrixActionV2.Response> results = FT_CasePicklistDependencyMatrixActionV2.getCasePicklistValues(
      new List<FT_CasePicklistDependencyMatrixActionV2.Request>{ req }
    );

    System.assertEquals('ERROR', results[0].status);
    System.assert(results[0].outMessage.contains('verified'));
  }
}
