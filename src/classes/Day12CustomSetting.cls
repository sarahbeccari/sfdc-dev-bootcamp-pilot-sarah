public with sharing class Day12CustomSetting {
	public static void getCustomSettingValue(){

		Map<String, Server_URL__c> urls = Server_URL__c.getAll();

		System.debug('URLs: ' + urls);

		Server_URL__c devServer = Server_URL__c.getValues('Dev Server');

		System.debug('devServer: ' + devServer);

		//this is how we interact with the http://google.com url 
		String devURL = devServer.URL__c;

		System.debug('devURL: '+ devURL);




	}
}