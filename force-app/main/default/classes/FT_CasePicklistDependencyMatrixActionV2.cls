public with sharing class FT_CasePicklistDependencyMatrixActionV2 {
  public class Request {
    @InvocableVariable(required=true)
    public Boolean isVerified;

    @InvocableVariable(required=true)
    public String requestKey;
  }

  public class Response {
    @InvocableVariable
    public String matrixJson;

    @InvocableVariable
    public String status;

    @InvocableVariable
    public String outMessage;
  }

  @InvocableMethod(
    label='FLO Get Case Picklist Values FT v2'
    description='Returns a dependency matrix for Fitness Tracker case intake picklists.'
  )
  public static List<Response> getCasePicklistValues(List<Request> requests) {
    List<Response> results = new List<Response>();

    for (Request req : requests) {
      Response res = new Response();

      if (req == null || req.isVerified != true) {
        res.status = 'ERROR';
        res.outMessage = 'Customer must be verified before requesting picklist values.';
        results.add(res);
        continue;
      }

      if (
        String.isBlank(req.requestKey) ||
        req.requestKey.toLowerCase() != 'classification'
      ) {
        res.status = 'ERROR';
        res.outMessage = 'Unsupported request key.';
        results.add(res);
        continue;
      }

      Map<String, Object> payload = new Map<String, Object>{
        'customerTypes' => new List<String>{ 'Member', 'Prospect' },
        'entryCategoriesByCustomerType' => new Map<String, Object>{
          'Member' => new List<String>{
            'Billing',
            'Training Plan',
            'Technical'
          },
          'Prospect' => new List<String>{
            'Membership Inquiry',
            'Pricing',
            'Technical'
          }
        },
        'subEntryCategoriesByEntryCategory' => new Map<String, Object>{
          'Billing' => new List<String>{
            'Refund Request',
            'Invoice Clarification'
          },
          'Training Plan' => new List<String>{
            'Program Change',
            'Missed Session'
          },
          'Technical' => new List<String>{ 'App Login', 'Wearable Sync' },
          'Membership Inquiry' => new List<String>{ 'Plans', 'Trial' },
          'Pricing' => new List<String>{ 'Discount', 'Corporate Rate' }
        }
      };

      res.matrixJson = JSON.serialize(payload);
      res.status = 'OK';
      res.outMessage = 'Picklist matrix generated.';
      results.add(res);
    }

    return results;
  }
}
