/**
 * Created by Danylo on 24.07.2022.
 */

trigger CaseTrigger on Case (after update, after insert) {
    CaseTriggerHandler.handler(Trigger.newMap, Trigger.operationType);
}