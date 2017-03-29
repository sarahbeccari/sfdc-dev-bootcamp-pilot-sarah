global class OpptyCreatorBatch implements Database.Batchable<sObject> {
	
	String query = 'SELECT Id, Name FROM Account';
	
	global OpptyCreatorBatch() {
		
	}
	
	global Database.QueryLocator start(Database.BatchableContext BC) {
		
		System.debug('Start method called');
		return Database.getQueryLocator(query);

		

	}


	//this is where our processing code will live 

   	global void execute(Database.BatchableContext BC, List<sObject> accounts) {

   		System.debug('Execute method called -- size of accounts: ' +accounts.size());

	
	}
	
	global void finish(Database.BatchableContext BC) {

		System.debug('Finish method called');
		
	}
	
}