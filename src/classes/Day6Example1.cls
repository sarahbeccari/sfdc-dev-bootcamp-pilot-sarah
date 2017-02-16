public with sharing class Day6Example1 {
	

	public static void createPerson(){
		//static means you have to call this method directly


		Person myPerson = new Person('Sarah', 'Brown', 'Lady', 25);
		Person newPerson = new Person('Joe', 'Blonde', 'Male', 23);

		Person nameOnlyPerson = new Person('Cory');



		List<Person> people = new List<Person>();
		people.add(myPerson);
		people.add(newPerson);
		people.add(nameOnlyPerson);

		System.debug(people);


		System.debug(myPerson);

		System.debug(myPerson.printPerson());



		System.debug(newPerson);

		System.debug(nameOnlyPerson.printPerson());



	}

	public static void newCreatePerson(){

		Person nameOnlyPerson = new Person('Cory');

		nameOnlyPerson.setAge(14);

		System.debug('age: '+ nameOnlyPerson);






	}








}