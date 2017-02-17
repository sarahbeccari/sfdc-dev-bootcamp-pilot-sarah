public with sharing class Week2AssignmentTriggerHelper {

	/**
	 * Instructor provided methods to create data
	 * 1) call createAccounts() to creaet accounts
	 * 2) to test the insert trigger in bulk call createContacts() (AFTER trigger is created)
	 * 3) call deleteContacts() to remove all the data in order to test multiple times
	 *
	 * SUGGESTION:
	 * Test using one account/contact manually in UI, then use the stuff below to test out after it appears to be working
	 * 
	 */
	

	public static void createAccounts() {
		List<Account> accounts = new List<Account>();
		for(Integer i = 0; i < 10; i++) {
			accounts.add(new Account(Name='Week 2 Assignment Account ' + i));
		}
		insert accounts;
	}

	public static void createContacts() {
		List<Account> accounts = [SELECT Id, Name FROM Account WHERE Name LIKE 'Week 2 Assignment Account%'];
		List<Contact> contacts = new List<Contact>();
		Integer multiplier = 1;
		for(Account account : accounts) {
			for(Integer i = 0; i < multiplier; i++) {
				contacts.add(new Contact(AccountId=account.Id, LastName = account.Name + ' (' + i + ')'));
			}
			// reset multiplier to 1
			multiplier = multiplier == 4 ? 1 : multiplier + 1;
		}
		insert contacts;
	}

	/**
	 * User this to ensure DML limits are handled correctly
	 */
	public static void createTonsOfContacts() {
		List<Account> accounts = [SELECT Id, Name FROM Account WHERE Name LIKE 'Week 2 Assignment Account%'];
		List<Contact> contacts = new List<Contact>();
		Integer multiplier = 10;
		for(Account account : accounts) {
			for(Integer i = 0; i < multiplier; i++) {
				contacts.add(new Contact(AccountId=account.Id, LastName = account.Name + ' (' + i + ')'));
			}
			multiplier += 10;
		}
		insert contacts;
	}

	public static void deleteContacts() {
		List<Contact> contacts = [SELECT Id, LastName FROM Contact WHERE LastName LIKE 'Week 2 Assignment Account%'];
		delete contacts;
	}


	///////////////// ASSIGNMENT HELPER METHODS - USE THESE TO SOLVE ASSIGNMENT /////////////////////////////////


	/**
	 * Trigger Helper Methods
	 * Call these from trigger to do all of your heavy lifting
	 */

	/**
	 * This is the main logic method.  Call this from your trigger and all logic should be done here
	 * instead of right in the trigger
	 * @param  newContacts   [description]
	 * @param  oldContactMap [description]
	 * @return               [description]
	 */
	public static void calculateChangesOnInsert(List<Contact> newContacts) {
		// Account ids, taken from contact records - make sure not to put null values in this
		Set<Id> accountIds = new Set<Id>();
		// Accounts that need to be udpated - add accounts to this list to call update on all at once
		List<Account> accountsToUpdate = new List<Account>();
		List<Opportunity> oppsToCreate = new List<Opportunity>();
		List<Note> notesToCreate = new List<Note>();



		//populate accountIds Set
		for(Contact contact : newContacts){

			if(contact.AccountId != null){

				accountIds.add(contact.AccountId);

			}
		}

			List<Account> accountContactCount = queryAccountsByIds(accountIds);


			for(Account account : accountContactCount){

				Integer previousCount = Integer.valueOf(account.Current_Number_of_Contacts__c);

				if(previousCount == null){
					previousCount =0;
				}

				Integer newCount = account.Contacts.size();

				account.Current_Number_of_Contacts__c = newCount;


				//create note here
				// create oppty here

			}
			


		// Steps:
		// Check if contact is associated to an account

		// if yes add account id to set, so we can query the accounts
		// Query the accounts queryAccountsByIds()
		// Loop through results
		// 	FOR EACH RESULT:
		// 		Determine the number of contacts - store the current count and the results from field on account
		// 			If the contact conut field on the account is null, be sure to treat that as zero in notes and math
		// 		create a note for the account createNoteForAccount() add to notesToCreate
		// 		determine if opp needs to be updated and create if needed createOpportunityForAccount() (add to oppsToCreate)
		// Perform update on accounts and inserts on notes/opps as needed
	}


	/////// TODO: Figure these out on your own

	public static void calculateChangesOnUpdate(List<Contact> newContacts, Map<Id, Contact> oldContactMap) {

	}

	public static void calculateChangesOnDelete(List<Contact> newContacts, Map<Id, Contact> oldContactMap) {

	}

	public static void calculateChangesOnUndelete(List<Contact> newContacts, Map<Id, Contact> oldContactMap) {

	}



	/**
	 * PRIVATE HELPER METHODS
	 * Only call these from the "calculate" methods above and NOT from trigger directly
	 */


	/**
	 * This helper method should get the current number of contacts
	 * for a list of accounts.
	 */
	private static List<Account> queryAccountsByIds(Set<Id> accountIds) {
	

		List<Account> accounts = [SELECT Id, Name, Current_Number_of_Contacts__C,
										(SELECT Id FROM Contacts)
 									FROM Account
 									WHERE Id IN :accountIds];

		

		// Your code here - query accounts and save the account id and number of contacts to the map and return it
		// !!NOTE!! make sure to include a subquery of accounts so you can count them versus the current number
		// !!Optional!! Maybe a subquery on opportunity could be helpful
		return accounts;
	}


	/**
	 * This method creates a note for an account with the previous/current count information incldued
	 * This does NOT insert to the database within this method
	 * @param  acct          [description]
	 * @param  previousCount [description]
	 * @param  oldCount      [description]
	 * @return               [description]
	 */
	private static Note createNoteForAccount(Account acct, Integer previousCount, Integer oldCount) {
		Note note = new Note();

		// Your code here - Create a new note record with relevant information and return it

		return note;
	}


	/**
	 * This method creates one opportunity associated to the account and returns it
	 * This does NOT insert to the database within this method
	 * @param  acct [description]
	 * @return      [description]
	 */
	private static Opportunity createOpportunityForAccount(Account acct) {
		Opportunity opp = new Opportunity();

		// Your code here - Create a new opportunity and return it

		return opp;
	}


}