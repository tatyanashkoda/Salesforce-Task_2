public with sharing class ContactController {

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
          
            upsert objContact;
            
        }
        else{
            System.Debug('Error');
        }
        return contact.Id;
    }
}