/**
 * Created by Danylo on 29.07.2022.
 */

public with sharing class TestDataFactory {


    public static Country__c createCountry(String nameOfCounty){
        Country__c country = new Country__c(Name = nameOfCounty,SuccessMessage__c = 'Hi! '+nameOfCounty);
        return country;
    }

    public static List<Country__c> createCountries(Integer n){
        List<Country__c> countries = new List<Country__c>();
        for (Integer i = 0; i<n; i++){
            countries.add(new Country__c(Name = 'Country' + i,
                    SuccessMessage__c = 'Hello, trailblazer! This is greeting from Country' +i));
        }
        return countries;
    }

    public static List<Case> createCases(Integer amount, String status){
        List<Case> idCaseMap = new List<Case>();
        for(Integer i = 0; i < amount; i++){
            Case c = new Case(Status=status);
            idCaseMap.add(c);
        }
        return idCaseMap;
    }

    public static List<Case> createCases(Integer amount){
        List<Case> idCaseMap = new List<Case>();
        for(Integer i = 0; i < idCaseMap.size(); i++){
            Case c = new Case();
        }
        return idCaseMap;
    }

    public static Map<Id,Case> getMapFromList(List<Case> cases){
        return new Map<Id, Case>(cases);
    }

    public static Contact createContact(){
        Contact contact = new Contact(FirstName = 'Max',LastName = 'Max');
        return contact;
    }

    public static Account createAccount(){
        Account account = new Account(Name = 'Account');
        return account;
    }

    public static List<Contact> createContacts(Integer quantity){
        List<Contact> contacts = new List<Contact>();

        for(Integer i = 0; i < quantity; i++){
            contacts.add(TestDataFactory.createContact());
        }

        return contacts;
    }


//    public static  validatePositiveUpdateAccountType(){
//
//    }
}