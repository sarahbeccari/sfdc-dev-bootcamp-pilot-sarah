public with sharing class AccountCreatorController {

	public String accountNamingPrefix {get; set;}
	public Integer numberOfAccounts {get; set;}
	public Integer startingNumber {get; set;}

	//check if accounts have been created
	public Boolean showUndoButton {get {return createdAccounts == null ? false: createdAccounts.size() >0;}}

	private List<Account> createdAccounts {get; set;}



	public AccountCreatorController() {

		accountNamingPrefix = 'my-acct-'; 
		numberOfAccounts = 5;
		startingNumber = 1;
		//binding a variable in our controller to the interface = **data binding**
		
	}


	public PageReference createAccounts() {
		if(numberOfAccounts <= 0){
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING, 'Number of accounts must be a positive value'));
			return null;
		}

		
		
		createdAccounts = new List<Account>();
		
		System.debug('number of accounts'+ numberOfAccounts);
		for(Integer i = 0; i < numberOfAccounts; i++){

			String accountName = accountNamingPrefix + startingNumber;
			 startingNumber+=1;

			 createdAccounts.add(new Account(Name = accountName));

		}
				System.debug('number of accounts'+ numberOfAccounts);


		try{

			insert createdAccounts;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM, 'Accounts successfully created.'));

		} catch(Exception ex){


			startingNumber = startingNumber - numberOfAccounts;
			createdAccounts = null;


		 	ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, 'Error attempting to save account.' + ex.getMessage()));



		}
		return null;
	}



	public PageReference deleteCreatedAccounts(){

		try{

			delete createdAccounts;
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM, 'Accounts successfully deleted.'));

		} catch(Exception ex){


			startingNumber = startingNumber - numberOfAccounts;
			createdAccounts = null;


		 	ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, 'Error attempting to delete account.' + ex.getMessage()));

		}
		 return null;

	
	}

}