public with sharing class Zoo {

	String name;
	String location;
	Integer zooNumber;
	Date openDate;
	Date closeDate;
	List<Animal> zooAnimals = new List<Animal>();
	List<Animal> historicAnimals = new List<Animal>();


	public Zoo(String name, String location, Integer zooNumber, Date openDate) {

		this.name =name;
		this.location =location;
		this.zooNumber = zooNumber;
		this.openDate = openDate;

		
	}


	public void updateLocation(String newLocation){
		location = newLocation;
	}

	public List<Animal> getAllAnimals(){

		return zooAnimals;
	}

	public Animal getAnimalByTagNumber(Integer tagNumber){

		for(Animal currentAnimal : zooAnimals){
			if(currentAnimal.getTagNumber() == tagNumber){
				return currentAnimal;

		}
	}

		return null;

}


public void addAnimal(Animal animal){

	List<Animal> animals = new List<Animal>();

	animals.add(animal);

	addAnimal(animals);

}

public void addAnimal(List<Animal> animals){

	zooAnimals.addAll(animals);

	for(Animal animal : zooAnimals){
		System.debug(animal.printAnimal());
	}



}

public String printAnimals(){

	return  'Zoo animals: '+zooAnimals+ ' Historic animals: '+ historicAnimals;
}

public void animalDeath(Integer tagNumber){

	for(Integer i = 0; i< zooAnimals.size(); i++){

		Animal currentAnimal = zooAnimals.get(i);

		if(currentAnimal.getTagNumber() == tagNumber){

			currentAnimal.animalDied();

			historicAnimals.add(currentAnimal);

			zooAnimals.remove(i);

			System.debug('Sad day... this animal died: '+ currentAnimal.getName());


	}

}


}

//move animal from current list to historic


public static void transferAnimal(Zoo currentZoo, Zoo newZoo, Animal animalToTransfer){

//transferAnimal() (should move animal from current to historic) 

	//animalToTransfer.mostRecentTransfer= Datetime.now();
	Boolean animalRemoved = false;

	for(Integer i = 0; i< currentZoo.zooAnimals.size(); i++){ 

		Animal currentAnimal = currentZoo.zooAnimals.get(i);

		if(currentAnimal == animalToTransfer){

			currentZoo.zooAnimals.remove(i);

			 animalRemoved = true;
			 break;


	}

}

			if(animalRemoved){

				currentZoo.historicAnimals.add(animalToTransfer);

				newZoo.zooAnimals.add(animalToTransfer);

				animalToTransfer.mostRecentTransfer = Datetime.now();

			}


		System.debug('This animal was transfered: ' + animalToTransfer.printAnimal());


//updateLocation(string)



}

public static void closeLoation(){


}


//transferAnimal() (should move animal from current to historic) 
//NOTE: This must be a static method with the following parameters:  
//(Zoo currentZoo, Zoo newZoo, Animal animalToTransfer) 
//The animal should be changed from current to historic on the current zoo and should be added to the new Zoo 
//Animal property mostRecentTransferDatetime should be updated 
//Close location - Sadly enough, a location my close down… 




}