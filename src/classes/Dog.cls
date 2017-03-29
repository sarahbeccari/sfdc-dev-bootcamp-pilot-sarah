public with sharing class Dog implements AnimalGod{

	private String name;
	private String breed;

	public Dog(String name, String breed) {
		this.name = name;
		this.breed = breed;

	}

	public void fetch(){
		System.debug(name+', go fetch!!!');
	}

	public void speak(){

		System.debug('My name is: '+name+' and my breed is: '+ breed);



	}
	public void eat(){
		System.debug(name+', eat your dinner!!');


	}
}