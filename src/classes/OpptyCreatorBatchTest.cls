@isTest
private class OpptyCreatorBatchTest {
	
	@isTest static void testCreateOpp() {
		// Implement test code
		//create account
		// create instance of this class
		// 
		Account account = new Account(Name='Fred');
		insert account; 
		OpportunityCreatorBatch myBatch = new OpportunityCreatorBatch();
		Opportunity newOpp = myBatch.createOpportunity(account);
		insert newOpp;



		List<Opportunity> opps = [SELECT Id FROM Opportunity];
		System.assertEquals(1,opps.size());



	}

	@isTest static void testBatch(){

		Integer numAccounts = 200;

		List<Account> accounts = new List<Account>();

		for(Integer i = 0; i<numAccounts; i++){

			accounts.add(new Account(Name='Account '+ i));

		}

		insert accounts;

		OpportunityCreatorBatch myBatch = new OpportunityCreatorBatch();

		Test.startTest();

		Database.executeBatch(myBatch);

		Test.stopTest();

		List<Opportunity> opps = [SELECT Id FROM Opportunity];
		System.assertEquals(numAccounts,opps.size());
	}
	
}