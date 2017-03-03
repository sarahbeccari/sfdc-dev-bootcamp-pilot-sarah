public with sharing class Day12RecordType {

	private static final Id APEX_2_RECORD_TYPE = 
	Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Apex Bootcamp 2').getRecordTypeId();
	



	public static void createContactWithRecordTypeFromSchema() {



		Contact newContact = new Contact(LastName = 'Day 12 Record Type FROM SCHEMA', RecordTypeId = APEX_2_RECORD_TYPE);

		insert newContact;


		System.debug(newContact);

		
	}

	public static void createContactWithRecordType() {

		
		RecordType apexBootcamp2RecordType = [SELECT Id, Name 
													FROM RecordType 
													WHERE DeveloperName = 'Apex_Bootcamp_2'];

		Contact newContact = new Contact(LastName = 'Day 12 Record Type', RecordTypeId = apexBootcamp2RecordType.Id);

		insert newContact;


		System.debug(newContact);

		
	}
}