/**
 * Created by Danylo on 24.07.2022.
 */

public with sharing class CaseService {
    public static void UpdateNumberOfClosedCasesInCountryAndSetSuccessMessage
            (Map<Id, Case> idCaseMap){
        Map<Id,Integer> duplicateCountyMap = countCountries(idCaseMap);

        if(duplicateCountyMap.size() != 0){
            Set<Id> countryIds = duplicateCountyMap.keySet();
            List<Country__c> countries = CountrySelector.getByIds(countryIds);
            for(Country__c country : countries){
                country.ClosedCases__c += duplicateCountyMap.get(country.Id);
            }
            update countries;
            updateCaseSuccessMessage(idCaseMap);
        }
    }

    public static Map<Id,Integer> countCountries(Map<Id, Case> idCaseMap){// прерйм
        Map<Id,Integer> countries = new Map<Id, Integer>();
        for(Id caseId : idCaseMap.keySet()){
            Case c = idCaseMap.get(caseId);
            if(c.Status == 'Closed' && c.SuccessMessage__c==null){
                if(!countries.containsKey(c.Country__c)){
                    countries.put(c.Country__c,1);
                }else{
                    countries.put(c.Country__c,countries.get(c.Country__c)+1);
                }
            }
        }
        return countries;
    }

    public static void updateCaseSuccessMessage(Map<Id, Case> idCaseMap){
        Set<Id> uniqueCountries = new Set<Id>();
        for(Id id : idCaseMap.keySet()){
            Case c = idCaseMap.get(id);
            uniqueCountries.add(c.Country__c);
        }

        List<Case> cases = CaseSelector.getByCountryIds(uniqueCountries);

        Map<Id,Country__c> countries = CountrySelector.getMapByIds(uniqueCountries);

        List<Case> casesToUpdate = new List<Case>();
        for(Case c : cases){
            c.SuccessMessage__c = countries.get(c.Country__c).SuccessMessage__c;
            casesToUpdate.add(c);
        }

        update casesToUpdate;




    }

}