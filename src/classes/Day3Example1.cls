public with sharing class Day3Example1 {
	
		public static void listExample(){

		List<String> myList = new List<String>();
		String[] myList1 = new List<String>{'Sarah', 'Jimmy', 'Dom'};


		myList.add('Sarah'); //index 0
		myList.add('Cory'); // index 1
		myList.add('Joe'); // index 2
		myList.add('Billy'); //index 3
		myList.add('Billy'); //index 4


		//myList.remove(1);


		String name = myList.get(0);

		System.debug('Name =>' + name);


		//System.debug('Name =>' + myList1);

		for(Integer i = 0; i < myList.size(); i++){

			System.debug(myList.get(i));
			//System.debug(myList[i]);



		}


		for(String item : myList){ //alternate for loop syntax, preferable to use this format


			System.debug('current item => ' +item);

		}



		String nameAgeString = methodWithReturnType('Sarah', 25);


		System.debug(nameAgeString);



		
	}




	public static void setExample(List<String> inputList){

			Set<String> names = new Set<String>(inputList);

			names.add('Jack');
			names.add('Jack');
			names.add('Jack');
			names.add('Jack');
			names.add('Jane');


			System.debug('names size: '+names.size());

			System.debug('names: ' + names);

			String joinExample = String.join(inputList, ',');

			List<String> splitExample = joinExample.split(',');




			System.debug('joinExample: ' + joinExample);

			System.debug('splitExample: ' + splitExample);







		}



		public static String methodWithReturnType(String name, Integer age){ //method signature


			String outputString = 'Hi, my name is '+ name + ' and my age is ' +age;

			return outputString;





		}




}