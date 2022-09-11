/**
 * Created by Danylo on 11.09.2022.
 */

public with sharing class ChangeAccountNamesBatch implements Database.Batchable<SObject>{


    public void execute(Database.BatchableContext param1, List<Account> accounts) {
        List<Account> newAccounts = new List<Account>();
        for(Account account : accounts){
            account.Name = account.Name + ' ' + 'Batch Processed';
            newAccounts.add(account);
        }
        update newAccounts;
    }

    public void finish(Database.BatchableContext param1) {
    }

    public Iterable<SObject> start(Database.BatchableContext param1) {
        final String query = 'SELECT Name FROM Account';
        return Database.getQueryLocator(query);
    }
}