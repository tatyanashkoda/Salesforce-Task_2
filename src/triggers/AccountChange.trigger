/**
 * Created by t.shkoda on 16.07.18.
 */

trigger AccountChange on Transaction__c (after insert ) {
    new AccountChangeTriggerHandler().run();

}