/**
 * Created by Danylo on 24.07.2022.
 */

public with sharing class CountrySelector {
    public static List<Country__c> getByIds(Set<Id> ids){
        return [SELECT Id, ClosedCases__c FROM Country__c WHERE Id IN :ids];
    }

    public static Map<Id,Country__c> getMapByIds(Set<Id> ids){
        return new Map<Id, Country__c>([SELECT Id, ClosedCases__c, SuccessMessage__c FROM Country__c WHERE Id IN :ids]);
    }

}