/**
 * Created by Danylo on 24.07.2022.
 */

public with sharing class CaseSelector {

    public static List<Case> getByCountryIds(Set<Id> ids){
        return [SELECT Id, Country__c, CaseNumber FROM Case WHERE Country__c IN :ids];
    }

}