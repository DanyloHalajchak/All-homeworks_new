/**
 * Created by Danylo on 28.07.2022.
 */

public with sharing class ContactTriggerHandler {
    public static void handler(Map<Id,Contact> idContactMap, System.TriggerOperation triggerOperation) {
        switch on triggerOperation{
            when AFTER_INSERT{
                ContactService.setAccountType(idContactMap);
            }
            when AFTER_UPDATE{
                ContactService.setAccountType(idContactMap);
            }
        }
    }
}