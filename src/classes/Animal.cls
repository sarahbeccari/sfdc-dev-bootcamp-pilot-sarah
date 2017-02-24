public with sharing class Animal {


	private String name;
	private String animalType;
	private Date birthday;
	private Date deceasedDate;
	private final Integer tagNumber;
	private static Integer previousTagNumber =12345;
	public Datetime mostRecentTransfer;
	private Contact caretaker;




	public Animal(String name, String animalType, Date birthday, Contact caretaker) {

		this.name = name;
		this.animalType =animalType;
		this.birthday =birthday;
		this.tagNumber = previousTagNumber +1;
		previousTagNumber ++;
		this.caretaker= caretaker;



		//set tag number here
		
	}

	public Boolean isDeceased(){
		
		if(deceasedDate != null){

			return true;
		}
		else {return false;}

	}

	public String getName(){
		return name;
		
	}

	public void setName(String newName){
		name = newName;
		
	}

	public Integer getTagNumber(){
		return tagNumber;
		
	}

	public void animalDied(){

		deceasedDate = Date.today();

	}

	public String printAnimal(){

		return 'Animal name: ' +name + ' Tag number: '+ tagNumber;
	}




//	IsDeceased() (Should return a boolean value) 
//True if animal is deceased 
//getName() 
//Return animal name 
//setName() 
//Set animal name 
//getTagNumber() 
//Return tag number 
//animalDied() 
//Should update deceased date 
//printAnimal() 
//This should print out the name and tag number at a minimum 
}