/**
 * Created by Danylo on 28.07.2022.
 */

trigger ContactTrigger on Contact (after insert) {
    ContactTriggerHandler.handler(Trigger.newMap, Trigger.operationType);
}