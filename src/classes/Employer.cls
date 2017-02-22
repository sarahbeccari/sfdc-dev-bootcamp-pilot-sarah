public with sharing class Employer { //object

	private String name;
	private String locationNumber;
	private Boolean foodProvided;
	private String phoneNumber;

	public static Integer numberOfEmployers; //can set this for all instances of the class
										// can only be accessed through static methods
										// use like a base case in recursion 


	//blue print for an instance of an object

	public Employer(){
		// default constructor 
	}

	public Employer(String name, String locationNumber, Boolean foodProvided, String phoneNumber) {

		this.name = name;
		this.locationNumber = locationNumber;
		this.foodProvided = foodProvided;
		this.phoneNumber =phoneNumber;


		
	}

	public Employer(String name, String locationNumber){
		this.name = name;
		this.locationNumber = locationNumber;
		this.foodProvided = false;


	}
	//Employer = myEmployer = newEmployer();
	//myEmployer.printEmployer(); //of a specific instance
	//Employer.staticMethod(); //used when you dont use an instance of the Employer



	public String printEmployer(){ //to call on an instance of Employer

		return 'Employer: '+name+ ' at location: '+ locationNumber + ' Number of Employers: ' + numberOfEmployers;
	}

	public static String staticMethod(){ //beyond the scope of only one Employer, 
										//because it is static



		return '';



	}
}