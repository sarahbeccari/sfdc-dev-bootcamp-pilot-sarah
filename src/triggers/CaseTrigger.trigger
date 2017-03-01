trigger CaseTrigger on Case (before insert) {

	Set<Id> accountIds = new Set<Id>();
	List<Case> casesToUpdate = new List<Case>();


	for(Case currentCase : Trigger.new){

		//is account populated AND contact is null
		if(currentCase.AccountId != null && currentCase.ContactId ==null){

			//store this case and account id to lookup contacts
			accountIds.add(currentCase.AccountId);
			casesToUpdate.add(currentCase);

		}


	}

	//query contacts based on accoutn Ids - Set<Id>
	//query accounts with subquery of contacts

	Map<Id, Account> accountsMap = new Map<Id, Account>([SELECT Id, Name, 
															(SELECT Id FROM Contacts) 
														FROM Account 
														WHERE Id IN :accountIds]);

	
	//populate the cases with a contact Id
	for(Case currentCase : casesToUpdate){

		Account account = accountsMap.get(currentCase.AccountId);
		if(account.Contacts.size()>0 ){

			currentCase.ContactId = account.Contacts[0].Id;





		}


	}





}