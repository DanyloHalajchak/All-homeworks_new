/**
 * Created by Danylo on 04.09.2022.
 */

public with sharing class EmailNotificationSender implements NotificationSender{

    public void sendNotification(String notificationMessage) {

        Messaging.reserveSingleEmailCapacity(2);

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

        String[] toAddresses = new String[] {UserInfo.getUserEmail()};

        mail.setToAddresses(toAddresses);

        String[] ccAddresses = new String[] {'lavandovsky2000@gmail.com'};

        mail.setCcAddresses(ccAddresses);

//        mail.setReplyTo('lavandovsky2000@gmail.com');

        mail.setSenderDisplayName('Danylo');


        mail.setSubject('Email Subject');


        mail.setBccSender(true);


        mail.setPlainTextBody(notificationMessage);



        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

    }
}