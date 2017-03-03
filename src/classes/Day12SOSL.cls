public with sharing class Day12SOSL {
	public static void searchWithSOSL(String searchStr){

	List<List<SObject>> soslResults = [FIND :searchStr
		IN ALL FIELDS
		RETURNING Account(Id, Name, Type, Current_Number_of_Contacts__c),
					Contact(ID, FirstName, LastName)];



	List<Account> accounts = soslResults[0];
	List<Contact> contacts = soslResults[1];

	System.debug('Accounts: ' +accounts);
	System.debug('contacts: ' +contacts);
	


	printSObject(accounts);
	printSObject(contacts);


	}

	public static void printSObject(List<SObject> obj){


		for(SObject currObj : obj){

			Id currId = (Id)currObj.get('Id');

			System.debug('currId: ' + currId);
			System.debug('currObj: ' + currObj);



		}

	}
}