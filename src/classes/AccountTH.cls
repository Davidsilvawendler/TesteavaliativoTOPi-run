/**
 * @autor david - testetopi
 */
public with sharing class AccountTH extends TriggerHandler {
    List <Account> newAccounts;
    Map <Id, Account> oldAccounts;
    AccountFilter filter;
    AccountValidator validator;
    AccountEventEnricher AccountEventEnricher;
    
    public AccountTh (){

        this((List<Account>) Trigger.new, (Map<Id,Account>) Trigger.oldMap);

        this.newAccounts = newAccounts;
        this.oldAccounts = oldAccounts;

        this.filter = new AccountFilter();
        this.validator = new AccountValidator();
        
    }

    override
    public void beforeInsert(){
        validateCPF ();
    }

    override
    public void afterInsert(){
        validateCPF ();

    }
    override
    public void beforeInsert(){
        validateCNPJ ();
    }

    override
    public void afterInsert(){
        validateCNPJ ();
        
    }

}

