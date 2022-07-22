/**
 * Created by Danylo on 20.07.2022.
 */

public with sharing class OpportunityHandler {

    public List<Opportunity> updateOpportunityStage(String stageNew, String stageOld){
        if(isValidStage(stageNew) && isValidStage(stageOld)){
            List<Opportunity> opportunities = [SELECT Id FROM Opportunity WHERE StageName = :stageOld];
            for(Opportunity opportunity : opportunities){
                opportunity.StageName = stageNew;
            }
            update opportunities;
            return opportunities;
        }
            return null;
    }

    public Boolean isValidStage(String stage){
        Boolean isValid = false;
        List<Schema.PicklistEntry> opportunityStages = Opportunity.StageName.getDescribe().getPicklistValues();
        for(Schema.PicklistEntry entry : opportunityStages){
            if(entry.getValue().equals(stage)){
                isValid = true;
                break;
            }
        }
        return isValid;
    }

}