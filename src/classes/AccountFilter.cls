public with sharing class AccountFilter {

    public List<Account> filterByChangedCPF ( List<Account> newAccounts
                                                        , Map<Id,Account> oldAccounts ) {
        List<Account> filteredAccounts = new List<Account> ();
        
        for ( Account account : newAccounts ) {

            if ( String.isEmpty(account.cpf__c) ) {
                continue;
            } 

            if ( oldAccounts == null 
                || oldAccounts.isEmpty() ) {

                filteredAccounts.add(account);
                continue;
            
            }

            if ( account.cpf__c == oldAccounts.get(account.Id).cpf__c ) {
                continue;
            }
            
            filteredAccounts.add( account );

        }

        return filteredAccounts;
    }

    public List<Account> filterByChangedCNPJ ( List<Account> newAccounts
                                                        , Map<Id,Account> oldAccounts ) {
        List<Account> filteredAccounts = new List<Account> ();
        
        for ( Account account : newAccounts ) {

            if ( String.isEmpty(account.cnpj__c) ) {
                continue;
            } 

            if ( oldAccounts == null 
                || oldAccounts.isEmpty() ) {

                filteredAccounts.add(account);
                continue;
            
            }

            if ( account.cnpj__c == oldAccounts.get(account.Id).cnpj__c ) {
                continue;
            }
            
            filteredAccounts.add( account );

        }

}