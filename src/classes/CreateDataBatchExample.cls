public with sharing class CreateDataBatchExample {
	
	public static void execute(){


		 for(Integer i = 0; i <10; i++){

		 Vet_Appointment__c newAppt =createAppointment(createAnimal('Animal' +i, createContact('Beccari', 'Owner')), 
		 									createContact('Desch', 'Vet'), 
		 									Datetime.now().addDays(i));
		 insert newAppt;

		 }
		


	}

	public static Contact createContact(String lastName, String title){

		Contact newContact = new Contact(LastName = lastName, Title = title);

		return newContact; 
		
		

	}


	public static Vet_Appointment__c createAppointment(Animal__c animal, Contact vet, Datetime apptDate){

		Vet_Appointment__c newAppt = new Vet_Appointment__c(Name = 'Vet appt', Animal__c = animal.Id, 
															Vet__c = vet.Id, Appointment_Time__c = 
															apptDate);

		return newAppt;


	}

	public static Animal__c createAnimal(String name, Contact contact){

		Animal__c newAnimal = new Animal__c(Name = name, Contact__c = contact.Id);

		return newAnimal;

	}




}