/**
 * Created by Danylo on 29.07.2022.
 */
@IsTest
private class ContactServiceTest {


    @IsTest
    static void insertPersonal_positive() {
        Account testAccount = TestDataFactory.createAccount();
        insert testAccount;

        Test.startTest();
        Contact testContact = TestDataFactory.createContact();
        testContact.AccountId = testAccount.Id;
        insert testContact;
        Test.stopTest();

        Account account = [SELECT Id, Type__c FROM Account LIMIT 1];
        System.assertEquals('Personal', account.Type__c);
    }

    @IsTest
    static void insertBusiness_positive() {
        Integer num = 5;
        Account testAccount = TestDataFactory.createAccount();
        insert testAccount;

        Test.startTest();
        List<Contact> testContacts = TestDataFactory.createContacts(55);
        for(Contact c : testContacts){
            c.AccountId = testAccount.Id;
        }
        insert testContacts;
        Test.stopTest();

        Account account = [SELECT Id, Type__c FROM Account LIMIT 1];
        System.assertEquals('Business', account.Type__c);
    }

    @IsTest
    static void insertCompany_positive() {
        Integer num = 200;
        Account testAccount = TestDataFactory.createAccount();
        insert testAccount;

        Test.startTest();
        List<Contact> testContacts = TestDataFactory.createContacts(102);
        for(Contact c : testContacts){
            c.AccountId = testAccount.Id;
        }
        insert testContacts;
        Test.stopTest();

        Account account = [SELECT Id, Type__c FROM Account LIMIT 1];
        System.assertEquals('Company', account.Type__c);
    }



}