public with sharing class DynamicSOQL {
	

	public static void dynamicAccountQuery(List<String> fieldsToQuery){

		String queryStr = 'SELECT ';
		queryStr += String.join(fieldsToQuery, ', ');
		queryStr += ' FROM Account';


		System.debug('queryStr: '+ queryStr);





		//List <SObject> returnedArray = Database.query(queryStr);
		//this is what is returned (generic sObject), can be casted to a type you are expecting


		List<Account> accounts = (List<Account>)Database.query(queryStr);

		String name = (String)accounts[0].get('Name');


		System.debug('accounts: '+accounts);
		System.debug('name: '+name);

	}


	public static void queryAllFieldsFromAccount(){

		SObjectType accountType = Schema.getGlobalDescribe().get('Account');

		List<String> fieldsToQuery = new List<String>(accountType.getDescribe().fields.getMap().keySet());

		//.getDescribe gives us all the global metadata for Account
		//.fields gives a field list attribute, turns this into a map, and get keys

		

		String queryStr = 'SELECT ';
		queryStr += String.join(fieldsToQuery, ', ');
		queryStr += ' FROM Account';

		System.debug('queryStr: '+ queryStr);


		List<Account> accounts = (List<Account>)Database.query(queryStr);
		System.debug('accounts: '+accounts);


	}

	public static void insertWithoutFatalError(){
		List<Account> accounts = new List<Account>();

		accounts.add(new Account(Name = 'day 11 - account 1'));
		accounts.add(new Account(Name = 'day 11 - account 2'));
		accounts.add(new Account(Name = 'day 11 - account 3'));
		accounts.add(new Account());

		//insert accounts; this will fail all records if one record fails

		List<Database.SaveResult> results = Database.insert(accounts,false);

		for(Database.SaveResult currentSaveResult : results){


			if(currentSaveResult.isSuccess()){

				System.debug('Success!!! ' + currentSaveResult.getId());


			}else {

				for(Database.Error err : currentSaveResult.getErrors()){

					System.debug('Error!!! '+ err);


					
				}




			}

		}



	}
	}