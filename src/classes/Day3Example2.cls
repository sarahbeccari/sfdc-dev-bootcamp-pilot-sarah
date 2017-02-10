public with sharing class Day3Example2 {
	public static void insertAccount() {

		Account account = new Account();


		account.name = 'Account created with Apex!!!!';


		System.debug('account before insert: ' + account);

		insert account;

		System.debug('account after insert: ' + account);

		
	}


	public static void updateAccount(){

		Account account = new Account();

		account.Id ='0014100000KoC6Q';

		account.Name = 'I changed the name with Apex!!!';

		update account;



	}
}