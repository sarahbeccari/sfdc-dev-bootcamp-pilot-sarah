/**
* @author Sarah Beccari sarah.beccari@atginfo.com
*
* Creates 10 contacts and 10 accounts
************* CHANGE LOG ******
* 2017-02-09	Sarah Beccari	Created Execute, CreateAccount, CreateContact methods
* 2017-02-13	Sarah Beccari	added notes
*
*/


public with sharing class Day3Assingment1 {


	public static void Execute() {

		//execute method

		for(Integer i =0; i<10; i++){



			CreateContact(CreateAccount('Account #'+ i), 'FirstName LastName'+i, Date.newInstance(1992, 1, 28));


			System.debug('Account #'+ i + ' created');
			System.debug('Contact #'+ i + ' created');



		}

		
	}


	public static Account CreateAccount(String acctName){

		Account newAccount = new Account();

		newAccount.name = acctName;

		insert newAccount;

		System.debug('Account: '+newAccount);

		return newAccount;



//Name - the name of the account 
//Name must have a number counter at the end and must increment (0 – 9) 
//Method must save the account to the Salesforce DB 
//Method must print the account to the log console


	}

	public static Contact CreateContact(Account account, String name, Date dateOfBirth){


		Contact newContact = new Contact();

		newContact.accountid = account.Id;

		List<String> stringName = name.split(' ');

		String firstName = stringName[0];

		String lastName = stringName[1];


		Integer contactAge = Date.today().year() - dateOfBirth.year();


		newContact.Age__c = contactAge;


		if(Math.mod(contactAge,2)==0){


			newContact.FirstName = firstName.toUpperCase();
			newContact.LastName = lastName.toUpperCase();


		}

		else {

			newContact.FirstName = firstName.toLowerCase();
			newContact.LastName = lastName.toLowerCase();




		}


		insert newContact;


		System.debug('Contact: '+newContact);


		return newContact;






//Account 
//Name (Caller to method will provide a string with first and last name separated by a space) 
//Date Of Birth (does not need to be saved to the record, just used for calculation of age) 
//Method must calculate the age of the contact and set a field on the contact with the age (create Number field in SFDC) 
//The name field needs to be split into two strings and saved into first and last name accordingly 
//If the age is an even number, then the contact name (first and last) should be saved in all uppercase 
//If the age is an odd number, then the contact name (first and last) should be saved in all lower case 
//Contact should have a lookup relationship to the account specified 
//Method must save the contact to salesforce 
//Method must print the contact to the log console




	}






}