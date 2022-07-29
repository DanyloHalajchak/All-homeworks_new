/**
 * Created by Danylo on 29.07.2022.
 */

@IsTest
public with sharing class CaseServiceTest {

    @IsTest
    static void updateBulkCases_positive() {
        Country__c country = TestDataFactory.createCountry('Ukraine');
        insert country;
        country = [SELECT Id, SuccessMessage__c, ClosedCases__c FROM Country__c];
        List<Case> cases = TestDataFactory.createCases(10,'New');
        insert cases;

        Test.startTest();
        for(Integer i = 0; i < cases.size(); i++){
            cases.get(i).Country__c = country.Id;
            cases.get(i).Status = 'Closed';
        }
        update cases;
        Test.stopTest();
        List<Case> testCase = [SELECT Id, SuccessMessage__c, Country__c FROM Case];
        for (Case c : testCase) {
            System.assertEquals(country.SuccessMessage__c, c.SuccessMessage__c, country.SuccessMessage__c);
        }
        System.assertEquals(cases.size(), country.ClosedCases__c);
    }

    @IsTest
    static void updateCases_positive() {
        Country__c country = new Country__c(Name = 'Country' + 1,
                SuccessMessage__c = 'Hello, trailblazer! This is greeting from Country' +1);
        insert country;
        Case c = new Case(Origin = 'Phone', Status = 'New');
        insert c;

        Test.startTest();
            c.Country__c = country.Id;
            c.Status = 'Closed';
        update c;
        Test.stopTest();
        Case testCase = [SELECT Id, SuccessMessage__c, Country__c FROM Case];
        Country__c testCounty = [SELECT Id, SuccessMessage__c, ClosedCases__c FROM Country__c];
        System.assertEquals(testCounty.SuccessMessage__c, testCase.SuccessMessage__c);
        System.assertEquals(1, testCounty.ClosedCases__c);
    }

    @IsTest
    static void insertBulkCases_negative() {
        Country__c country = TestDataFactory.createCountry('Ukraine');
        insert country;
        List<Case> cases = TestDataFactory.createCases(10, 'New');
        Test.startTest();
        insert cases;
        Test.stopTest();
        List<Case> testCase = [SELECT Id, SuccessMessage__c FROM Case];
        for (Case c : testCase) {
            System.assertEquals(country.SuccessMessage__c, c.SuccessMessage__c, country.SuccessMessage__c);
        }
        Country__c updatedCounty = [SELECT Id, ClosedCases__c FROM Country__c];
        System.assertEquals(updatedCounty.ClosedCases__c,0);
    }


    @IsTest
    static void updateCaseUniqueForEachCountries_positive() {
        //given
        List<Case> cases = TestDataFactory.createCases(10);
        List<Country__c> countries = TestDataFactory.createCountries(10);
        insert cases;
        insert countries;

        //when
        Test.startTest();
        for (Integer i = 0; i < cases.size(); i++) {
            cases[i].Status = 'Closed';
            cases[i].Country__c = countries[i].Id;
        }
        update cases;
        Test.stopTest();

        //then
        List<Country__c> insertedCountries = [SELECT ClosedCases__c FROM Country__c];
        for (Country__c currCountry : insertedCountries) {
            System.assertEquals(1, currCountry.ClosedCases__c);
        }
    }




}