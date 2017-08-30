@isTest
public class TestUpdateContactsOnChangeAddress {
    static testmethod void testAddressChange() {
       //create an account
        Account sAcct = new Account();
       	sAcct.Name = 'Test Account';
          //create account address
        sAcct.BillingStreet = '11 Initial Street'; 
        sAcct.BillingCity = 'Rochester';
        sAcct.BillingPostalCode = '12456';
        sAcct.BillingState = 'NY';
        sAcct.BillingCountry = 'USA';
        Test.startTest();
      	insert sAcct;
       	Test.stopTest();
                
        //create contact for Account "Test Account"
        Contact sContact1 = new Contact();
        	//create contact address
        sContact1.MailingStreet = '1 Initial street';
        sContact1.MailingCity = 'Rochester';
        sContact1.MailingPostalCode = '12456';
        sContact1.MailingState = 'NY';
        sContact1.MailingCountry = 'USA';
       // sContact1.account.id = sAcct.id;
        sAcct.id = sContact1.account.id;
        
        Contact sContact2 = new Contact();
        sContact2.MailingStreet = '2 Initial street';
        sContact2.MailingCity = 'Rochester';
        sContact2.MailingPostalCode = '12456';
        sContact2.MailingState = 'NY';
        sContact2.MailingCountry = 'USA';
        //sContact2.account.id = sAcct.id;
        sAcct.id = sContact2.account.id;
        
        Contact sContact3 = new Contact();
        sContact3.MailingStreet = '3 Initial street';
        sContact3.MailingCity = 'Rochester';
        sContact3.MailingPostalCode = '12456';
        sContact3.MailingState = 'NY';
        sContact3.MailingCountry = 'USA';
        //sContact3.account.id = sAcct.id;
        sAcct.id = sContact3.account.id;
        
        //change address on account
        sAcct.BillingStreet = '11 Updated Street'; 
        sAcct.BillingCity = 'Updated City';
        sAcct.BillingPostalCode = '99999';
        sAcct.BillingState = 'PA';
        sAcct.BillingCountry = 'Mexico';
          
        Test.startTest();
         update sAcct;//this should fire my trigger.
        Test.stopTest();
             
        //check if account updated address match each contact address
       	System.assertEquals(sAcct.BillingStreet, sContact1.mailingstreet); 
        System.assertEquals(sAcct.BillingCity, sContact1.MailingCity); 
        System.assertEquals(sAcct.BillingPostalCode, sContact1.MailingPostalCode); 
        System.assertEquals(sAcct.BillingState, sContact1.MailingState);
        System.assertEquals(sAcct.BillingCountry, sContact1.MailingCountry);
        
        System.assertEquals(sAcct.BillingStreet, sContact2.mailingstreet); 
        System.assertEquals(sAcct.BillingCity, sContact2.MailingCity); 
        System.assertEquals(sAcct.BillingPostalCode, sContact2.MailingPostalCode); 
        System.assertEquals(sAcct.BillingState, sContact2.MailingState);
        System.assertEquals(sAcct.BillingCountry, sContact2.MailingCountry);
        
        System.assertEquals(sAcct.BillingStreet, sContact3.mailingstreet); 
        System.assertEquals(sAcct.BillingCity, sContact3.MailingCity); 
        System.assertEquals(sAcct.BillingPostalCode, sContact3.MailingPostalCode); 
        System.assertEquals(sAcct.BillingState, sContact3.MailingState);
        System.assertEquals(sAcct.BillingCountry, sContact3.MailingCountry);
    }
}