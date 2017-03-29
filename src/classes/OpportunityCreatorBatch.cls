global class OpportunityCreatorBatch implements Database.Batchable<sObject>, Database.Stateful {
	
	String query = 'SELECT Id, Name FROM Account';
	global Integer totalNumberOfOpps;


	global OpportunityCreatorBatch() {
		totalNumberOfOpps = 0;
	}
	
	global Database.QueryLocator start(Database.BatchableContext BC) {
		System.debug('START METHOD CALLED');
		return Database.getQueryLocator(query);
	}

	/**
	 * THis is where our processing code will live
	 */
   	global void execute(Database.BatchableContext BC, List<sObject> accounts) {
		System.debug('EXECUTE METHOD CALLED - Size of accounts: ' + accounts.size());

		List<Opportunity> opps = new List<Opportunity>();

		for(sObject account : accounts) {
			opps.add(createOpportunity((Account)account));
		}

		insert opps;
		totalNumberOfOpps += opps.size();
		System.debug('Inserted opps size ' + opps.size());
	}
	
	global void finish(Database.BatchableContext BC) {
		System.debug('FINISH METHOD CALLED');

		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

		mail.setToAddresses(new String[]{'austin.turner@atginfo.com'});
		mail.setReplyTo('austin.turner@atginfo.com');
		mail.setSenderDisplayName('Austin Turner');
		mail.setSubject('New Opportunities Created');
		mail.setPlainTextBody('Hello!\n\nNumber of new opportunites created: ' + totalNumberOfOpps);
		
		Messaging.sendEmail(new Messaging.SingleEmailMessage[]{ mail });


	}
	
	@TestVisible
	private Opportunity createOpportunity(Account account) {

		Date closeDate = Date.today().addMonths(1);
		Opportunity newOpp = new Opportunity(Name=account.Name + ' New Opportunity', StageName='Prospecting', CloseDate=closeDate, AccountId=account.Id);
		return newOpp;
	}



}