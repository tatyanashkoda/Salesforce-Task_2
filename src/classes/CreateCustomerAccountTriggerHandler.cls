/**
 * Created by t.shkoda on 17.07.18.
 */

public class CreateCustomerAccountTriggerHandler extends TriggerHandler {

    protected override void afterInsert() {
        CreateCustomerAccount();
    }
    private void CreateCustomerAccount(){
        Set<Id> allInsertedIds = trigger.newMap.keySet();
        Customer_Account__c objAccount = [Select Id, Balance__c, Current_Balance__c From Customer_Account__c where Id =: allInsertedIds];

        objAccount.Current_Balance__c = objAccount.Balance__c;

        update objAccount;

    }

}