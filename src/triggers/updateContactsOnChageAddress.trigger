trigger updateContactsOnChageAddress on Account (before Insert, after update) {
 	       
 	          // I want to find the new address/values on Account by map Id Keys 
 	           
 	          Map<Id, Account> acctsWithNewAddresses = new Map<Id, Account>();
 	       
 	          // Trigger.new holds my list of the Accounts that will be updated        
 	          // This loop iterates over the list, and adds any that have new
 	          // addresses to the acctsWithNewAddresses map. 
 	           
 	          for (Integer i = 0; i < Trigger.new.size(); i++) {
 	              if (   (Trigger.old[i].BillingCity != Trigger.new[i].BillingCity)
 	                  || (Trigger.old[i].BillingCountry != Trigger.new[i].BillingCountry)
 	                  || (Trigger.old[i].BillingPostalCode != Trigger.new[i].BillingPostalCode)
 	                  || (Trigger.old[i].BillingState != Trigger.new[i].BillingState)
 	                  || (Trigger.old[i].BillingStreet != Trigger.new[i].BillingStreet))  {
 	                  acctsWithNewAddresses.put(Trigger.old[i].id,Trigger.new[i]);
 	              }
 	          }
 	                           
 	          List<Contact> contacts = [SELECT id, accountid, MailingCity, MailingCountry, MailingPostalCode,MailingState, MailingStreet
 	                            FROM Contact
 	                            WHERE accountId in :acctsWithNewAddresses.keySet()];
 	              
 	                      List<Contact> updatedContacts = new List<Contact>();
 	       System.debug('Kellers ' + contacts);
 	  
 	  
 	          //iterating over each contact in Account
 	          for (Contact c : contacts) {
 	              Account parentAccount = acctsWithNewAddresses.get(c.accountId);
 	              c.MailingStreet = parentAccount.BillingStreet;
 	              c.MailingCity = parentAccount.BillingCity ;
 	              c.MailingCountry = parentAccount.BillingCountry ;
 	              c.MailingPostalCode = parentAccount.BillingPostalCode ;
 	              c.MailingState = parentAccount.BillingState ;
 	              c.MailingStreet = parentAccount.BillingStreet ;
       
 	       
 	           // Rather than insert the contacts individually, add the         
 	              // contacts to a list and bulk insert it. This makes the         
 	              // trigger run faster and allows us to avoid hitting the         
 	              // governor limit on DML statements 
 	  
 	              updatedContacts.add(c);
 	          }
 	          update updatedContacts;
 	      }