public with sharing class Person {

	//name, hair color, sex, age

	private String name;
	private String hairColor='Red';
	public String sex{get {return 'HAHAHA!';} set;}

	private Integer age;


	public Person(String name){

		this.name = name;


	}

	public Person(String name, String hairColor, String sex, Integer age) { 
	//constructor = no return type and name is same as class name

		this.name = name;
		this.hairColor = haircolor;
		this.sex = sex;
		this.age = age;
		
	}


	/**
	*
	*GETTERS and SETTERS
	*
	*/

	public Integer getAge(){

		return age;


	}

	public void setAge(Integer age){

		this.age =age;


	}

	public String printPerson(){

		String returnString = 'Name of person: '+ name;
		returnString+= '   Hair color: '+ hairColor;
		returnString+= '   Sex: '+ sex;
		returnString+= '   Age: '+ age;

		return returnString;
		


	}
}