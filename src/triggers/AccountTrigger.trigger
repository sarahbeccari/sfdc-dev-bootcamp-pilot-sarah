trigger AccountTrigger on Account (before insert, before update, before delete, 
									after insert, after update, 
									after delete, after undelete) {

	
	System.debug('Trigger.isAfter '+ Trigger.isAfter);
	System.debug('Trigger.isBefore '+ Trigger.isBefore);
	System.debug('Trigger.isUpdate '+ Trigger.isUpdate);
	System.debug('Trigger.isUndelete '+ Trigger.isUndelete);
	System.debug('Trigger.isInsert '+ Trigger.isInsert);
	System.debug('Trigger.isDelete '+ Trigger.isDelete);
	System.debug('Trigger.isExecuting '+ Trigger.isExecuting);


	System.debug('Trigger.old: '+ Trigger.old);
	System.debug('Trigger.oldMap: '+ Trigger.oldMap);
	System.debug('Trigger.new: '+ Trigger.new);
	System.debug('Trigger.newMap: '+ Trigger.newMap);
	

	//if(Trigger.isInsert && Trigger.isBefore){

	//	List<Account> accounts = Trigger.new;

	//	for(Account account : accounts){

	//		account.AccountNumber = 'TRIGGER!1243556789';

	//	}}


	if(Trigger.isInsert && Trigger.isAfter){
			//isAfter Trigger.new produces a read only list
			//we need to re-query if we want to modify the data
			List<Account> accounts = Trigger.new;

			List<Contact> contacts = new List<Contact>();

			for(Account account : accounts){

			contacts.add(new Contact(LastName = account.Name));

				}
		insert contacts;
		//we need to get id's to have our query only return records in this trigger
		//get record Ids from the map provided by the trigger

		Set<Id> accountIds = Trigger.newMap.keySet();




		List<Account> queriedAccounts = [SELECT Id, AccountNumber
											FROM Account
											WHERE Id IN :accountIds];

		for(Account account : queriedAccounts){
			account.AccountNumber = account.Id;


			update queriedAccounts;




		}

		}


	



}