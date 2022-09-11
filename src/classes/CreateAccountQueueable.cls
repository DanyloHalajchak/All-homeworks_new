/**
 * Created by Danylo on 11.09.2022.
 */

public with sharing class CreateAccountQueueable implements Queueable {

    private String name;

    public CreateAccountQueueable(String name) {
        this.name = name;
    }

    public void execute(QueueableContext param1) {
        insert new Account(Name = name);
    }
}