public with sharing class PassByReference {


	//primitive data types: Integer, String, Boolean, Double, Id, can be used without saying new
	// 

	public static void execute() {

		Account account1 = new Account(Name = 'account1 initial value');
		Account account2 = new Account(Name = 'account2 initial value');


		System.debug('Initial values');
		printAccount(account1, account2);

		passByReference(account1);
		passByValue(account2.Name);

		System.debug('End values');
		printAccount(account1, account2);
	}

	public static void printAccount(Account account1, Account account2){

		System.debug('account1:' + account1);
		System.debug('account2:' + account2);

	}
//passing in an object, reference to a memory location, actual object is modified
	public static void passByReference(Account account){ 

		account.Name = 'Modified account name!!!! passByReference()';

		
	}

//passing in a primitive datatype, original object is not modified
	public static void passByValue(String accountName){ 

		accountName = 'Modified name!!!! passByValue()';

	}
}