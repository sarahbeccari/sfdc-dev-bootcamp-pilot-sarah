public with sharing class LeadToContactHelper {
	
	public static List<Lead> searchAgainLeads = new List<Lead>();
	public static Set<String> leadEmails = new Set<String>();
	public static Set<String> leadLastNames = new Set<String>();



	public static void handleBeforeInsert(List<Lead> leads){

		queryContactsByEmail(leads);
		queryContactsByLastName(leads);

	}


	public static void queryContactsByEmail(List<Lead> leads){

		//create list of all new lead emails
		for(Lead lead : leads){

			if(lead.Email != null){

				leadEmails.add(lead.Email);
			}
			
		}

		//query all email addresses for Contacts
		List<Contact> contacts = [SELECT Id, Name, Email 
								 FROM Contact 
								 WHERE Email IN: leadEmails];

		Map<String, Contact> contactsMap = new Map<String, Contact>();

		for(Contact contact : contacts){

			contactsMap.put(contact.Email, contact);
		}


		for(Lead lead : leads){

			if(contactsMap.containsKey(lead.Email)){

				//add lookup from lead to matching contact
				lead.Contact__c = contactsMap.get(lead.Email).Id;

				//add note on lead with info about automatch
				lead.Contact_Match_Notes__c = 'Added contact for this lead record';

				// update attempted datetime
				lead.Automatch_Attempted__c = Date.today();

				//update success boolean
				lead.Automatch_Success__c = True;


			} else{

				searchAgainLeads.add(lead);
			}
		}

		
		
	}

	//loop through searchAgainLeads and search contacts by last name
	public static void queryContactsByLastName(List<Lead> leads){


		//create list of all new lead emails
		for(Lead lead : leads){

			if(lead.LastName != null){

				leadLastNames.add(lead.LastName);
			}
			
		}

		//query all email addresses for Contacts
		List<Contact> contacts = [SELECT Id, LastName 
								 FROM Contact 
								 WHERE LastName IN: leadLastNames];

		Map<String, Contact> contactsMap = new Map<String, Contact>();

		for(Contact contact : contacts){

			contactsMap.put(contact.LastName, contact);
		}


		for(Lead lead : leads){

			if(contactsMap.containsKey(lead.LastName)){

				//add lookup from lead to matching contact
				lead.Contact__c = contactsMap.get(lead.LastName).Id;

				//add note on lead with info about automatch
				lead.Contact_Match_Notes__c = 'Added contact for this lead record';

				// update attempted datetime
				lead.Automatch_Attempted__c = Date.today();

				//update success boolean
				lead.Automatch_Success__c = True;


			}




}


	}


}