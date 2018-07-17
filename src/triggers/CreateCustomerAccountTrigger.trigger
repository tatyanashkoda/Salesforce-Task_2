/**
 * Created by t.shkoda on 17.07.18.
 */

trigger CreateCustomerAccountTrigger on Customer_Account__c (after insert) {

    new CreateCustomerAccountTriggerHandler().run();
}