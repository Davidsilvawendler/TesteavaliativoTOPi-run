/**
 * @autor - david
 */
@isTest
public class AccountAddressFilterTest {
    
    private static Map<Id,Account> editAddresses(List<Account> accounts) {
        Map<Id,Account> oldAccounts = new Map<Id,Account> (accounts);

        Account changedCity = accounts.get(0).clone(true, true, true, true);
        Account changedCountry = accounts.get(1).clone(true, true, true, true);
        Account changedState = accounts.get(2).clone(true, true, true, true);
        Account changedStreet = accounts.get(3).clone(true, true, true, true);
        Account changedPostalCode = accounts.get(4).clone(true, true, true, true);

        changedCity.BillingCity = 'São Paulo';
        changedCountry.BillingCountry = 'Brasil';
        changedState.BillingState = 'SP';
        changedStreet.BillingStreet = 'Avenida do teste, 123';
        changedPostalCode.BillingPostalCode = '11111222';

        oldAccounts.put(changedCity.Id, changedCity);
        oldAccounts.put(changedCountry.Id, changedCountry);
        oldAccounts.put(changedState.Id, changedState);
        oldAccounts.put(changedStreet.Id, changedStreet);
        oldAccounts.put(changedPostalCode.Id, changedPostalCode);

        return oldAccounts;
    }

    public class AccountHttpMock implements HttpCalloutMock {

        public HttpResponse respond  (HttpRequest request) {

            HttpResponse response = new HttpResponse();

            response.setBody('');
            response.setStatusCode(200);

            return response;
        }
    }
}