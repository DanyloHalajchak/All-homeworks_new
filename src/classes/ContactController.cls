public with sharing class ContactController {
    @AuraEnabled(Cacheable=true)
    public static List<Contact> getContactsByAccountId(Id accountId){
        return [SELECT  Name, Title, Email, Phone FROM Contact WHERE AccountId =:accountId];
    }

    @AuraEnabled
    public static void addContact(Id accountId, String lastName) {
        insert new Contact(AccountId = accountId, LastName = lastName);
    }


}