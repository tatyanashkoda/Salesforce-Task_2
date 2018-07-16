public with sharing class ContactController {
    
    @AuraEnabled
    public static List<Account> getAccounts() {
        List<Account> Acc=[SELECT id, Name FROM Account ];
        System.Debug(Acc);
        return Acc;
    }
    
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
      @AuraEnabled
    public static String saveContact(Contact contact) {
	System.Debug(contact);
        if(contact != null){

        Contact objContact = new Contact(
                AccountId = '0016F00002OPLbCQAX',
                FirstName = contact.FirstName,
                LastName = contact.LastName
        );
            System.Debug(objContact);
            upsert objContact;
        }
        else{
            System.Debug('qwer');
        }
        System.Debug('sdfsdfsf' + contact.Id);
        return contact.Id;
    }
    @AuraEnabled
    public static String saveContactAndAccount(Contact contact) {
        if(contact != null){

        Account objAccount = new Account(
        	Name =  contact.LastName 
        );
        upsert objAccount;
        Account acc = [select Name, Id from Account where Name = : contact.LastName];
        Contact objContact = new Contact(
                AccountId = acc.Id,
                FirstName = contact.FirstName,
                LastName = contact.LastName
        );

            System.Debug(acc);
          
            upsert objContact;
            
        }
        else{
            System.Debug('qwer');
        }
        return contact.Id;
    }
}