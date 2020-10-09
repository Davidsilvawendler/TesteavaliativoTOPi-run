/**
 * @autor david - testetopi
 */

public class AccountValidator {

    public List<Account> validateCPF (List<Account> accounts) {

        BrazilianDocumentValidator validator = new BrazilianDocumentValidator();

        for (Account account : accounts) {

            if (validator.isCPF( account.cpf__c ) ) {
                account.cpf__c.addError('CPF Invalido');
            }     

        }

        return accounts;

    }

    public List<Account> validateCNPJ (List<Account> accounts) {

        BrazilianDocumentValidator validator = new BrazilianDocumentValidator();

        for (Account account : accounts) {

            if (validator.isCPF( account.cpf__c ) )  {
                account.cnpj__c.addError('CNPJ Invalido');
            }     

        }

        return accounts;

    }

}