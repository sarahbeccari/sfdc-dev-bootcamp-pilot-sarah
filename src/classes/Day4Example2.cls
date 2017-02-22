public with sharing class Day4Example2 {
	public static void mapExample(){

	
		//Map<key, value>
		Map<String, String> students = new Map<String, String>();

		//add item to map
		students.put('Sarah','student 1');
		students.put('Nick','student 2');
		students.put('Bobby Brown','student 3');



		System.debug('students: ' + students);


		String currentStudent = students.get('Sarah');

		System.debug('currentStudent: ' + currentStudent);




		//this will return null
		String specialStudent = students.get('Cory');

		System.debug('specialStudent = '+ specialStudent);



		

		//check for existence of of key using containsKey
		if(students.containsKey('Cory')){

			currentStudent = students.get('Cory');



	}


 }

 public static void matchAccountsToContact(){

 	Map<String, Account> nameAccountMap = new Map<String, Account>();



 	//query accounts
 	List<Account> accounts = [SELECT Id, Name
 								FROM Account
 								WHERE Name LIKE 'MAP-EXAMPLE%'];


 	//query contacts
 	List<Contact> contacts = [SELECT Id, LastName
 								FROM Contact
 								WHERE LastName LIKE 'MAP-EXAMPLE%'];


//build map of accounts with the name is key
for (Account currAccount : accounts){
	nameAccountMap.put(currAccount.Name, currAccount);
}


System.debug('accounts: '+ accounts);
System.debug('contacts: '+ contacts);
System.debug('nameAccountMap: '+ nameAccountMap);


 	//loop through contacts, find matching account

 	for(Contact currContact : contacts){

 		if(nameAccountMap.containsKey(currContact.LastName)){

 			Account account = nameAccountMap.get(currContact.lastName);
 			currContact.AccountId = account.Id;


 		}




 	}
 	//update contacts

 	update contacts;





 }


 public static void queryIntoMap(){

		Map<Id, Contact> contacts = new Map<Id, Contact>([SELECT Id, LastName, AccountId 
 									FROM Contact
 									WHERE LastName LIKE 'MAP-EXAMPLE%']);


 		System.debug('contacts' + contacts);

 		Set<Id> keys = contacts.keySet();
 		List<Contact> mapContacts = contacts.values();

 		System.debug('keys' + keys); //get all keys
 		System.debug('contacts' + mapContacts); //get all values



 		for(String key : contacts.keySet()){



 		}


 		for(Contact currContact : contacts.values()){



 		}

 }



}