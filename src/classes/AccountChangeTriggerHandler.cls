/**
 * Created by t.shkoda on 16.07.18.
 */

public class AccountChangeTriggerHandler extends TriggerHandler{


    protected override void afterInsert() {
        UpdateBalance();
    }

    private void UpdateBalance(){
        Set<Id> allInsertedIds = trigger.newMap.keySet();
        Transaction__c CustomerAccount = [SELECT Customer_Account__c, Transaction_Amount__c From Transaction__c where Id =: allInsertedIds];
        Customer_Account__c objAccount = [Select Id, Balance__c, Current_Balance__c From Customer_Account__c where Id =: CustomerAccount.Customer_Account__c];

        objAccount.Current_Balance__c = objAccount.Current_Balance__c + CustomerAccount.Transaction_Amount__c;

        update objAccount;

    }

}