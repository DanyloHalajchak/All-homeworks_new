/**
 * Created by Danylo on 24.07.2022.
 */

public with sharing class CaseTriggerHandler {
    public static void handler(Map<Id, Case> idCaseMap, System.TriggerOperation triggerOperation) {
        switch on triggerOperation{
            when AFTER_UPDATE{
                CaseService.UpdateNumberOfClosedCasesInCountryAndSetSuccessMessage(idCaseMap);
            }
//            when AFTER_INSERT{
//                CaseService.UpdateNumberOfClosedCasesInCountryAndSetSuccessMessage(idCaseMap);
//            }
        }
    }
}