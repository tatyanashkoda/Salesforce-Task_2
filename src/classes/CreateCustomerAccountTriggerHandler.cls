/**
 * Created by t.shkoda on 17.07.18.
 */

public class CreateCustomerAccountTriggerHandler extends TriggerHandler {
/*

    Customer_Account__c obj;

    protected override void afterInsert() {
        CreateCustomerAccount();
    }

    protected override void afterUpdate() {
        //DifferenceBetweenAccounts();
        //System.Debug('Hellp world');
    }


    private void CreateCustomerAccount() {

        Set<Id> allInsertedIds = trigger.newMap.keySet();
        Customer_Account__c objAccount = [Select Id, Name, Balance__c, Current_Balance__c, Num__c From Customer_Account__c where Id = :allInsertedIds];
        objAccount.Current_Balance__c = objAccount.Balance__c;

        update objAccount;

    }
    private void DifferenceBetweenAccounts() {
        Set<Id> allInsertedIds = trigger.newMap.keySet();
        Customer_Account__c objAccount = [Select Id, Name, Balance__c, Current_Balance__c, Difference_Between_Balances__c From Customer_Account__c where Id = :allInsertedIds];

        List<Customer_Account__c> depositeBalance = [SELECT Current_Balance__c FROM Customer_Account__c WHERE RecordType.Name = :'Deposit'];
        List<Customer_Account__c> crediteBalance = [SELECT Current_Balance__c FROM Customer_Account__c WHERE RecordType.Name = :'Credit'];

        Decimal SumDepositBalance = 0.0;
        Decimal SumCreditBalance = 0.0;
        for (Customer_Account__c CA : crediteBalance) {
            SumCreditBalance += CA.Current_Balance__c;
        }
        for (Customer_Account__c CA : depositeBalance) {
            SumDepositBalance += CA.Current_Balance__c;
        }
        
       // objAccount.Difference_Between_Balances__c =  SumCreditBalance - SumDepositBalance ;
        //System.Debug(objAccount.Difference_Between_Balances__c);
        objAccount.Difference_Between_Balances__c = SumDepositBalance - SumCreditBalance;

       // update objAccount;

        objAccount.Num__c = 14;
        update objAccount;
        System.Debug(SumDepositBalance);
        System.Debug(SumCreditBalance);
    }*/
}