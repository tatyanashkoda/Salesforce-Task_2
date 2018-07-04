public with sharing class ContactController {
    
    @AuraEnabled
    public static Account getAccount(Id accountId) {
        Account name = [SELECT Name, BillingCity, BillingState FROM Account WHERE Name = :'test'];
        System.Debug(name);
        return [SELECT Name, BillingCity, BillingState FROM Account WHERE Name = :'test'];
    }
    
    @AuraEnabled
    public static Customer_Account__c saveContactWithAccount(Customer_Account__c contact, Id accountId) {
        
        upsert contact;
        return contact;
    }
}