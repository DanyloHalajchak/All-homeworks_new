/**
 * Created by Danylo on 11.09.2022.
 */

public with sharing class FutureAccount {

    @Future(Callout=true)
    public static void createAccountFuture(String accountName){
        insert new Account(Name = accountName);
    }

}