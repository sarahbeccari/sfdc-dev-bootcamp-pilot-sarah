public with sharing class Day4Example1 {
	/**
	 * This method is called to loop and call createAccount and createContact
	 * multiple times
	 */
	public static void execute() {

		List<Account> accounts = new List<Account>();
		List<Contact> contacts = new List<Contact>();



		for(Integer i = 0; i < 200; i ++) {
			
			
			Account acct = createAccount('Account #' + i, false);
			accounts.add(acct);

			


		}

		Integer i = 0;
		for(Account currAccount : accounts){

			//Dynamically increment year of birth each iteration
			Date birthdate = Date.newInstance(1950 + i, 5, 5);


			Contact contact = createContact(currAccount, 'First Last' + i, birthdate, false);
			contacts.add(contact);


			i++;

		}

		

		


		insert contacts;
		insert accounts;


	}

	/**
	 * This method creates a new account, inserts it, and returns the account
	 */
	public static Account createAccount(String name, Boolean doInsert) {
		/**
		 * Create a new account variable
		 * Initialize the acconut variable with the name parameter set
		 * This is equivalent to
		 * acct.Name = name;
		 */
		Account acct = new Account(Name = name);
		
		// Save accoutn to the database
		if(doInsert){
			insert acct;
		}


		// Pring account to the console
		System.debug('Account: ' + acct);
		
		// Returns account
		return acct;
	}

	/**
	 * This method creates a contact and associates the
	 * contact the the passed in account. The contact is inserted and returned
	 */
	public static Contact createContact(Account acct, String name, Date dateOfBirth, Boolean doInsert) {
		// Get age. This is the "long" way of doing it.
		// Alternative one-liner:
		// age = Date.today().year() - dateOfBirth.year();
		Date currentDate = Date.today();
		// Because we are doing division on tow integers, result will be truncated
		// which works perfect for age calculation - normally we would want 365 stored
		// in a final constant variable
		Integer age = dateOfBirth.daysBetween(currentDate)/365;

		// Convert name to upper or lower case
		if(Math.mod(age, 2) == 0) {
			// Age is even, change name variable to uppercase
			name = name.toUpperCase();
		} else {
			// Age is odd, change name variable to lowercase
			name = name.toLowerCase();
		}

		// Get Name
		// NOTE: this will fail if name provided does not have a space
		// Would want to code around this by checking if name is null and the length of fullName
		// to determine how to get around issues
		List<String> fullName = name.split(' ');
		String firstName = fullName[0];
		String lastName = fullName[1];

		Contact contact = new Contact(AccountId = acct.Id, firstName = firstName, lastName = lastName, age__c = age);

		if(doInsert) {

			insert contact;

		}


		System.debug('Contact: ' + contact);
		return contact;
	}
}