global class EmailTomorrowVetApptsBatch implements Database.Batchable<sObject> {
	
	String query ='SELECT Id, Name FROM Vet_Appointment__c WHERE Appointment_Time__c = TOMORROW ';
	
	global EmailTomorrowVetApptsBatch() {
		
	}
	
	global Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator(query);
	}

   	global void execute(Database.BatchableContext BC, List<Vet_Appointment__c> vetAppts) {



   		System.debug('EXECUTE METHOD CALLED');

   		for(Vet_Appointment__c vetAppt : vetAppts){

   			vetAppt.Appointment_Notes__c='Reminder sent: '+ Datetime.now().format();
   			vetAppt.Reminder_Email_Sent__c = Datetime.now();
   			System.debug('Reminder sent: '+ Datetime.now().format());
   			
   		}

   		update vetAppts;

	
	}
	
	global void finish(Database.BatchableContext BC) {

		System.debug('FINISH METHOD CALLED');

		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

		mail.setToAddresses(new String[]{'sarah.beccari@atginfo.com'});
		mail.setReplyTo('sarah.beccari@atginfo.com');
		mail.setSenderDisplayName('Sarah Beccari');
		mail.setSubject('Tomorrow\'s Vet Appointment reminders sent!');
		
		Messaging.sendEmail(new Messaging.SingleEmailMessage[]{ mail });

		
	}
	
}