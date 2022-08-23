public with sharing class DiaryController {

    @AuraEnabled(Cacheable=true)
    public static List<Diary__c> getDiaryByContactId(Id contactId){
        return [SELECT CreatedDate, Note__c FROM Diary__c WHERE Contact__c =:contactId];
    }

}