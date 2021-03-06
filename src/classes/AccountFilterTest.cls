/**
 * @autor - david
 */
@isTest
public class AccountFilterTest {

    @isTest
    static void givenCnpjWhenInsertedReturnAccounts() {
        List<Account> accounts = new List<Account>{
            new Account(Name='Test CNPJ', Cnpj__c = '61903124000171')
        };

        AccountFilter filter = new AccountFilter();

        List<Account> filteredAccounts = filter.filterByChangedCnpj(accounts, null);

        System.assertEquals(accounts.size(), filteredAccounts.size());
    }

    @isTest
    static void givenCnpjWhenChangedReturnAccounts() {
        Account account = AccountFixtureFactory.createAccount(new Account(Name='Test CNPJ'
                                                , Cnpj__c = '61903124000171'));

        List<Account> accounts = new List<Account>{
            account
        };

        Map<Id,Account> oldAccounts = new Map<Id,Account> (accounts);

        Account changedAccount = accounts.get(0).clone(true, true, true, true);
        changedAccount.Cnpj__c = '89926905000109';
        oldAccounts.put(changedAccount.Id, changedAccount);

        AccountFilter filter = new AccountFilter();

        List<Account> filteredAccounts = filter.filterByChangedCnpj(accounts, oldAccounts);

        System.assertEquals(accounts.size(), filteredAccounts.size());
        System.assertNotEquals(filteredAccounts.get(0).Cnpj__c, oldAccounts.get(changedAccount.Id).Cnpj__c);
    }

    @isTest
    static void givenCnpjWhenNotChangedReturnEmpty() {
        Account account = AccountFixtureFactory.createAccount(new Account(Name='Test CNPJ'
                                                , Cnpj__c = '61903124000171'));

        List<Account> accounts = new List<Account>{
            account
        };

        Map<Id,Account> oldAccounts = new Map<Id,Account> (accounts);

        Account changedAccount = accounts.get(0).clone(true, true, true, true);
        changedAccount.Cpf__c = '71767305044';
        oldAccounts.put(changedAccount.Id, changedAccount);

        AccountFilter filter = new AccountFilter();

        List<Account> filteredAccounts = filter.filterByChangedCnpj(accounts, oldAccounts);

        System.assertNotEquals(accounts.size(), filteredAccounts.size());
    }

    @isTest
    static void givenCpfWhenInsertedReturnAccounts() {
        List<Account> accounts = new List<Account>{
            new Account(Name='Test CPF', Cpf__c = '44533580084')
        };

        AccountFilter filter = new AccountFilter();

        List<Account> filteredAccounts = filter.filterByChangedCpf(accounts, null);

        System.assertEquals(accounts.size(), filteredAccounts.size());
    }

    @isTest
    static void givenCpfWhenChangedReturnAccounts() {
        Account account = AccountFixtureFactory.createAccount(new Account(Name='Test CPF'
                                                , Cpf__c = '44533580084'));

        List<Account> accounts = new List<Account>{
            account
        };

        Map<Id,Account> oldAccounts = new Map<Id,Account> (accounts);

        Account changedAccount = accounts.get(0).clone(true, true, true, true);
        changedAccount.Cpf__c = '09802855006';
        oldAccounts.put(changedAccount.Id, changedAccount);

        AccountFilter filter = new AccountFilter();

        List<Account> filteredAccounts = filter.filterByChangedCpf(accounts, oldAccounts);

        System.assertEquals(accounts.size(), filteredAccounts.size());
        System.assertNotEquals(filteredAccounts.get(0).Cpf__c, oldAccounts.get(changedAccount.Id).Cpf__c);
    }

    @isTest
    static void givenCpfWhenNotChangedReturnEmpty() {
        Account account = AccountFixtureFactory.createAccount(new Account(Name='Test CPF'
                                                , Cpf__c = '44533580084'));

        List<Account> accounts = new List<Account>{
            account
        };

        Map<Id,Account> oldAccounts = new Map<Id,Account> (accounts);

        Account changedAccount = accounts.get(0).clone(true, true, true, true);
        changedAccount.Cnpj__c = '08622645000178';
        oldAccounts.put(changedAccount.Id, changedAccount);

        AccountFilter filter = new AccountFilter();

        List<Account> filteredAccounts = filter.filterByChangedCpf(accounts, oldAccounts);

        System.assertNotEquals(accounts.size(), filteredAccounts.size());
    }

    @isTest
    static void givenPostalCodeWhenInsertedReturnAccounts() {
        List<Account> accounts = new List<Account>{
            new Account(Name='Test BillingPostalCode', BillingPostalCode = '06123450')
            , new Account (Name='Test ShippingPostalCode', ShippingPostalCode = '06123456')
        };

        AccountFilter filter = new AccountFilter();

        List<Account> filteredAccounts = filter.filterByChangedPostalCode(accounts, null);

        System.assertEquals(accounts.size(), filteredAccounts.size());
    }

}