/**
 * Created by Danylo on 28.07.2022.
 */

public with sharing class ContactService {
    public static void setAccountType(Map<Id,Contact> idContactMap){
        Set<Id> accountIds = new Set<Id>();

        for(Id contactId : idContactMap.keySet()) {
            Contact c = idContactMap.get(contactId);
            if(!accountIds.contains(c.AccountId)){
                accountIds.add(c.AccountId);
            }
        }

        List<AggregateResult> amountOfContactsInAccounts = ContactSelector.getAmountOfContactsForAccounts(accountIds);
        List<Account> accountsToUpdate = AccountSelector.getByIds(accountIds);

        for(AggregateResult amountOfContactsInAccount : amountOfContactsInAccounts){
            Integer amountOfContacts = (Integer)amountOfContactsInAccount.get('amount');
            for(Integer i = 0; i < accountsToUpdate.size(); i++){
                if((Id) amountOfContactsInAccount.get('id') == accountsToUpdate.get(i).Id){
                    if(amountOfContacts == 1){
                        accountsToUpdate.get(i).Type__c = 'Personal';
                    }else if(amountOfContacts < 100){
                         accountsToUpdate.get(i).Type__c = 'Business';
                    }else{
                        accountsToUpdate.get(i).Type__c = 'Company';
                    }
                    break;
                }
            }
        }
        update accountsToUpdate;
    }
}