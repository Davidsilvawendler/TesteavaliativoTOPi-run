/**
 * @autor - david
 */
public virtual class AccountRepository {

    virtual
    public Account store (Account account) {
        update account;
        return account;
    }

    virtual
    public List<Account> store (List<Account> accounts) {
        update accounts;
        return accounts;
    }

    virtual
    public List<Account> findByIds (List<String> ids) {
        return [SELECT Id, Name, BillingStreet, BillingCity, BillingState
        , BillingPostalCode, BillingCountry, ShippingStreet, ShippingCity
        , ShippingState, ShippingPostalCode, ShippingCountry 
        FROM Account
        WHERE Id in :ids];
    }

    virtual
    public List<Account> findByGeolocationRequested(String name) {
        return [SELECT Id
        FROM Account
        WHERE GeolocationRequested__c = true];
    }
}