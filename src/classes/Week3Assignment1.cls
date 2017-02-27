public with sharing class Week3Assignment1 {


	public static void executeZoos() {


		Zoo sarahsZoo = new Zoo('Zoo of Sarah', 'Rainbow Dr.', 1, Date.newInstance(1992, 1, 28));
		Zoo joesZoo = new Zoo('Zoo of Joe', 'Ryman Ave.', 2, Date.newInstance(1994, 2, 09));
		Zoo rachelsZoo = new Zoo('Zoo of Rachel', 'Easy St.', 3, Date.newInstance(1991, 11, 7));


		Contact myCaretaker = new Contact();


		Animal animal1 = new Animal('Jerry', 'Giraffe', Date.today(), myCaretaker);
		Animal animal2 = new Animal('Elle', 'Elephant', Date.today(), myCaretaker);
		Animal animal3 = new Animal('Mousey', 'Mouse', Date.today(), myCaretaker);
		Animal animal4 = new Animal('Dear', 'Deer', Date.today(), myCaretaker);

		Animal animal5 = new Animal('Dorky', 'Dog', Date.today(), myCaretaker);
		Animal animal6 = new Animal('Sneezy', 'Cat', Date.today(), myCaretaker);
		Animal animal7 = new Animal('Breezy', 'Horse', Date.today(), myCaretaker);
		Animal animal8 = new Animal('Turd', 'Cat', Date.today(), myCaretaker);

		Animal animal9 = new Animal('Justin', 'Elk', Date.today(), myCaretaker);
		Animal animal10 = new Animal('Aaron', 'Rat', Date.today(), myCaretaker);
		Animal animal11 = new Animal('Bill', 'Bear', Date.today(), myCaretaker);
		Animal animal12 = new Animal('Bob', 'Antelope', Date.today(), myCaretaker);

		//////////////// add all animals to zoos
		sarahsZoo.addAnimal(animal1);
		sarahsZoo.addAnimal(animal2);
		sarahsZoo.addAnimal(animal3);
		sarahsZoo.addAnimal(animal4);

		joesZoo.addAnimal(animal5);
		joesZoo.addAnimal(animal6);
		joesZoo.addAnimal(animal7);
		joesZoo.addAnimal(animal8);

		rachelsZoo.addAnimal(animal9);
		rachelsZoo.addAnimal(animal10);
		rachelsZoo.addAnimal(animal11);
		rachelsZoo.addAnimal(animal12);

		//////////////// print all animals
		System.debug(sarahsZoo.printAnimals());
		System.debug(joesZoo.printAnimals());
		System.debug(rachelsZoo.printAnimals());

		/// death

		sarahsZoo.animalDeath(animal1.getTagNumber());
		sarahsZoo.animalDeath(animal2.getTagNumber());

		/////////// transfer animal 7 and rename him 

		Zoo.transferAnimal(joesZoo,sarahsZoo, animal7);

		animal7.setName('Buddy');

		rachelsZoo.updateLocation('Helena');
		Animal animal13 = new Animal('Buck', 'Deer', Date.today(), myCaretaker);

		rachelsZoo.addAnimal(animal13);


		joesZoo.closeLocation(joesZoo, sarahsZoo);

		System.debug(joesZoo.printAnimals());
		
	}
}