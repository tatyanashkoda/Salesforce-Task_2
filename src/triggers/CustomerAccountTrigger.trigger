/**
 * Created by t.shkoda on 17.07.18.
 */

trigger CustomerAccountTrigger on Customer_Account__c (after insert,after update ) {

    new CreateCustomerAccountTriggerHandler().run();
}