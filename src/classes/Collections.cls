/**
 * Created by Danylo on 15.07.2022.
 */

public with sharing class Collections {

    public static Set<String> getUniqueValues(List<String> strings){
        return new Set<String>(strings);
    }

    public static List<Contact> getContactsByName(List<Contact> contacts, String name){
        List<Contact> selectedContacts = new List<Contact>();
        for(Contact c : contacts){
            if(c.FirstName.equals(name)){
                selectedContacts.add(c);
            }
        }
        return selectedContacts;
    }

    public static Contact getContactByName(List<Contact> contacts, String name){
        for(Contact c : contacts){
            if(c.FirstName.equals(name)){
                return c;
            }
        }
        return null;
    }

    public static Opportunity getOpportunityWithTheBiggestAmount(List<Opportunity> opportunities){
        Opportunity max = opportunities.get(0);
        for(Opportunity o : opportunities){
            if(o.Amount > max.Amount){
                max = o;
            }
        }
        return max;
    }


    public static List<Integer> makeListOfDigitsFromNumber(Integer typedNumber){
        List<Integer> digits = new List<Integer>();
        for(String s : String.valueOf(typedNumber).split('')){
            digits.add(Integer.valueOf(s));
        }
        return digits;
    }








}