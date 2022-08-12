/**
 * Created by Danylo on 28.07.2022.
 */

public with sharing class ContactSelector {
    public static List<AggregateResult> getAmountOfContactsForAccounts(Set<Id> ids){
        return [SELECT AccountId id, COUNT(Id) amount FROM Contact WHERE AccountId IN :ids GROUP BY AccountId];
    }
}