public with sharing class Day5Example1 {


	public static void createBeer(){

		Beer__c myBeer = new Beer__c(Name = 'Double Haul IPA',Kind__C = 'IPA');

		upsert myBeer;


		List<Contact> myContacts = [SELECT Id, Favorite_Beer__c
									FROM Contact
									LIMIT 10];



		for(Contact currentContact : myContacts){


			currentContact.Favorite_Beer__C = myBeer.Id;

		}

		update myContacts;


	}

	public static void queryParent(){


		List<Contact> contacts = [SELECT Id, Favorite_Beer__c, Favorite_Beer__r.Name, 
										Favorite_Beer__r.Id, OwnerId, Favorite_Beer__r.Owner.Name, Owner.UserName
								FROM Contact 
								WHERE Favorite_Beer__c != null
								LIMIT 10];




		for(Contact currentContact : contacts){


			Beer__c beer = currentContact.Favorite_Beer__r;

			String beerName = currentContact.Favorite_Beer__r.Name;

			System.debug('contact: '+ currentContact);
			System.debug('beer: '+ beer);
			System.debug('beerName: '+ beerName);

		}


	}


	public static void queryChild(){


		Beer__c doubleHaul = [SELECT Id, Name, Kind__c,
    							(SELECT Id, Name, Favorite_Beer__c 
    								FROM Contacts__r)
							FROM Beer__c
							WHERE Id = 'a0041000007MIjGAAW'];



		System.debug('dubleHaul: '+ doubleHaul);
		List<Contact> contacts = doubleHaul.Contacts__r;

		for(Contact contact : contacts){


			System.debug('Contact: '+ contact);

		}








	}


}