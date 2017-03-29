public with sharing class Cat implements AnimalGod{

	private String name;
	private Integer livesRemaining;


	public Cat(String name, Integer livesRemaining) {
		this.name =  name;
		this.livesRemaining=livesRemaining;
		
	}


	public void speak(){

		System.debug('My name is: '+name+' and I have: '+ livesRemaining + ' lives remaining');



	}
	public void eat(){
		System.debug(name+', eats like a cat');


	}
}