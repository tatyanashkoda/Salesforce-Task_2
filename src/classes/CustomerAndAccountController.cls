public class CustomerAndAccountController{

    public Account account { get; private set; }

    public Customer_Account__c customer {get; private set; }

    Account acc = [SELECT Name, Phone, Email__c FROM Account WHERE Name = :'test1'];

    public CustomerAndAccountController() {
        Id id = ApexPages.currentPage().getParameters().get('id');
        account = (id == null) ? new Account() : 
                [SELECT Name, Phone, Email__c FROM Account WHERE Id = :id];
        customer = (id == null) ? new Customer_Account__c(Customer__c = acc.Id) :
                [select Name, Balance__c from Customer_Account__c where Id = :id];
    }

    public PageReference saveCustomer() {
        try {
            insert (account);
        } catch(System.DMLException e) {
            ApexPages.addMessages(e);
            return null;
        }
//        PageReference redirectSuccess = new ApexPages.StandardController(Account).view();
//        return (redirectSuccess);
        return null;
    }
    public PageReference saveCustomerAccount() {
        try {
            insert (customer);
        } catch(System.DMLException e) {
            ApexPages.addMessages(e);
            return null;
        }
//        PageReference redirectSuccess = new ApexPages.StandardController(Account).view();
//        return (redirectSuccess);
        return null;
    }


//    public PageReference save() {
//        try {
//            insert (account);
//        } catch(System.DMLException e) {
//            ApexPages.addMessages(e);
//            return null;
//        }
//        //  After successful Save, navigate to the default view page
//        PageReference redirectSuccess = new ApexPages.StandardController(Account).view();
//        return (redirectSuccess);
//    }

}