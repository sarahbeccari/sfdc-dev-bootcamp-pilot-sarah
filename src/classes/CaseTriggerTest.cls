@isTest //annotation 
private class CaseTriggerTest {


	private static Account myAccount;
	private static List<Contact> contacts = new List<Contact>();
	private static Account account;
	private static Account accountWithNoContact;
	//Account, Contact



	/**
	* this runs before every unit test to create 
	* data is reset before each unit test
	* DML statements are not counted against unit test
	* SOQL statements are counted against unit test
	*/

	@testSetup
	private static void createSetupData(){
		Account accountWithContact = new Account (Name = 'Test account 1');
		Account accountWithoutContact = new Account (Name = 'Test account 2');

		insert accountWithContact;
		insert accountWithoutContact;


		Contact contact = new Contact(LastName = 'Test Contact', AccountId =accountWithContact.Id);
		insert contact;



	}

	private static void createTestData(Integer numContacts){
		myAccount = new Account(Name = 'Test Account');

		insert myAccount;
		for(Integer i =0; i<numContacts; i++){
			contacts.add(new Contact(LastName = 'Test Contact', 
									AccountId = myAccount.Id));

		}

		insert contacts;
		System.debug('Account: '+ myAccount);
		System.debug('Contacts: '+ contacts);


	}


	private static void queryTestData(){

		account = [SELECT Id FROM Account WHERE Name = 'Test account 1'];
		accountWithNoContact = [SELECT Id FROM Account WHERE Name = 'Test account 2'];
		insert contacts;

		System.debug('Account: '+ account);
		System.debug('Account: '+ accountWithNoContact);
		


	}




	
	@isTest static void caseSuccessfullyAddsContact() {

		//createTestData(1);
		queryTestData();
		System.assertEquals(1, contacts.size());
		Case newCase = new Case(Origin = 'Phone', Status = 'New', AccountId = accountWithNoContact.Id);
		insert newCase;

		Case updatedCase = [SELECT Id, AccountId, ContactId FROM Case WHERE Id = :newCase.Id];

		System.assertEquals(contacts[0].Id, updatedCase.ContactId);
		System.assertNotEquals(null, updatedCase.ContactId);


	}
	
	@isTest static void caseWithoutAccount() {
		Case newCase = new Case(Origin = 'Phone', Status = 'New');


		insert newCase;
		Case updatedCase = [SELECT Id, AccountId, ContactId FROM Case WHERE Id = :newCase.Id];

		System.assertEquals(null, updatedCase.ContactId);
		System.assertEquals(null, updatedCase.AccountId);

	}

	@isTest static void accountWithoutContact() {
		//createTestData(0);
		System.assertEquals(0, contacts.size());
		Case newCase = new Case(Origin = 'Phone', Status = 'New', AccountId = myAccount.Id);
		insert newCase;

		Case updatedCase = [SELECT Id, AccountId, ContactId FROM Case WHERE Id = :newCase.Id];

		System.assertEquals(null, updatedCase.ContactId);
		System.assertNotEquals(null, updatedCase.AccountId);
	}
	
}