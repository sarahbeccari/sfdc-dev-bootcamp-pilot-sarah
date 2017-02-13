public with sharing class Day2Emample3 {
  
	public static void listsAndLoops(){

		List<String> names = new List<String>();

		//Alternate syntax
		//String[] strings = new List<String>();

		names.add('Sarah');

		System.debug('Number of names: ' +names.size());

		System.debug(names);



           names.remove(0);

 for(integer i =0; i<20; i++){


		System.debug('i = '+ i);
		names.add('person #'+i);

 	}



 System.debug('Number of names: ' +names.size());

		System.debug(names);


		String lastInList = names.get(names.size()-1);

		System.debug(lastInList);





}



//Day2Emample3.listsAndLoops()




}