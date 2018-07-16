public  with sharing class CreateCustomerAccountWithCustomer {

        @AuraEnabled
    public static Account saveCustomer(Account account) {
        upsert account;
        return account;
    }
    
        @AuraEnabled
    public static Id saveCustomerAccount(Customer_Account__c customerAccount) {
        Account acc = [select Name, Id from Account where Name = :'Org1'];
        Customer_Account__c objCustomerAccount = new Customer_Account__c(
        	Customer__c = '0016F00002OPLbCQAX',
            Balance__c = customerAccount.Balance__c,
            Name = customerAccount.Name
        );
        upsert objCustomerAccount;
        return objCustomerAccount.Id;
    }
}