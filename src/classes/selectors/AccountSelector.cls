/**
 * Created by Danylo on 28.07.2022.
 */

public with sharing class AccountSelector {
    public static List<Account> getByIds(Set<Id> ids){
        return [SELECT Id, Type__c FROM Account WHERE Id IN :ids];
    }
}