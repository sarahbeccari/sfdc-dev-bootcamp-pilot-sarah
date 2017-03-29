//This class interacts with the AnimalGod interface

public with sharing class AnimalControl {


	public static void execute(){

		Dog marleyBear = new Dog('KelleyBean', 'Black Lab');
		Cat kitty = new Cat('Sassy', 9);

		 marleyBear.fetch();

		 controlAnimal(marleyBear);
		
		 controlAnimal(kitty);
	}


	private static void controlAnimal(AnimalGod animal){ //an use the interface as a datatype now
		animal.speak();
		animal.eat();


	}
}