
/*
* This class shows an example of using @Future to have 
* code run asynchronously
*/


public with sharing class FutureExample {



	public static void execute(){

		System.debug('Starting execute method');

		doStuffLater();
		doStuffNow();


		System.debug('Finishing execute method');

	}

	@Future //helpful when calling out to an external system

	public static void doStuffLater() { //must pass in primitve values or a list of primitive values
		System.debug('I am running in the future');
	}

	


	public static void doStuffNow(){

		System.debug('I am running in the present');

	}
}