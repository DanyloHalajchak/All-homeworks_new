/**
 * Created by Danylo on 04.09.2022.
 */

public with sharing class ObjectNotificationSender implements NotificationSender{

    public void sendNotification(String notificationMessage) {
        Notification__c notification = new Notification__c();
        notification.Notification_Message__c = notificationMessage;
        insert notification;
    }
}