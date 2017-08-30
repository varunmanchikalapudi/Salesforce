public class email {
    public static void sendEmailMessage()
    {
        Messaging.SingleEmailMessage semail=new Messaging.SingleEmailMessage();
        List<String> sendingTo=new List<String>();
        sendingTo.add('varunmanchikalapudi@gmail.com');
        semail.setToAddresses(sendingTo);
        semail.setSubject('Test Email for Single Messaging');
        semail.setPlainTextBody('Hello How r u? ');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {semail});
    }
}