public with sharing class LeadToContactHelper {
	public LeadToContactHelper() {
		
	}

	public static void handleBeforeInsert(List<Lead> leads){

			List<String> leadEmails = new List<String>();


		//create list of all new lead emails
		for(Lead lead : leads){

			leadEmails.add(lead.Email);
		}

		//query all email addresses for Contacts
		List<Contact> contacts = [SELECT Id, Name, Email 
									FROM Contact 
									WHERE Email IN: leadEmails];




		

		// keep track of list of leads that are not matched



		// flag leads that are not 

		//check leads against 2nd criteria 

	}


	public static Contact queriedContact(){


	




		return null;


	}


}