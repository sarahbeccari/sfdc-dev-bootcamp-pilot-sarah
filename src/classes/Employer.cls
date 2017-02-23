public with sharing class Employer { //object

	private String name;
	private String locationNumber;
	private Boolean foodProvided;
	private String phoneNumber;

	public static Integer numberOfEmployers; //can set this for all instances of the class
										    // use like a base case in recursion for nested triggers 

	private List<Employee> activeEmployees = new List<Employee>();
	private List<Employee> inactiveEmployees = new List<Employee>();


	//blue print for an instance of an object

	public Employer(){
		// default constructor 
	}

	public Employer(String name, String locationNumber, Boolean foodProvided, String phoneNumber) {
		//method signature is the name of the constructor and the parameters

		this.name = name;
		this.locationNumber = locationNumber;
		this.foodProvided = foodProvided;
		this.phoneNumber =phoneNumber;


		
	}

	public Employer(String name, String locationNumber){

		this(name, locationNumber, false, null);


	}
	//Employer = myEmployer = newEmployer();
	//myEmployer.printEmployer(); //of a specific instance
	//Employer.staticMethod(); //used when you dont use an instance of the Employer



	public String printEmployer(){ //to call on an instance of Employer

		//return 'Employer: '+name+ ' at location: '+ locationNumber + ' Number of Employers: ' + numberOfEmployers;

		System.debug('Employer Name: ' + name);
		System.debug('Active Employees: ' + activeEmployees);
		System.debug('Inactive Employees: ' + inactiveEmployees);

		return name;
	}

	public void addEmployee(Employee employee){

		activeEmployees.add(employee);

	}

	public void addEmployee(List<Employee> employees){

		activeEmployees.addAll(employees); //allows you to add all items in the list to a list

	}


	public Boolean terminateEmployee(Integer employeeIDNumber){

		Boolean isTerminated = false;

		for(Integer i =0; i<activeEmployees.size(); i++){

			Employee currentEmployee = activeEmployees.get(i);

			if(currentEmployee.getEmployeeIdNumber() == employeeIDNumber){

				currentEmployee.terminateEmployee();


				inactiveEmployees.add(currentEmployee);

				activeEmployees.remove(i);

				isTerminated= true;


				break;


			}

		}

		return isTerminated;
		


	}



	public static String staticMethod(){ //beyond the scope of only one Employer, applicable to entire class 
										//because it is static, use on entire class by calling Employer.staticMethod()



		return 'Do something';



	}



	public Employee getEmployeeById(Integer employeeIDNumber){
		//Employee foundEmployee;

		for(Employee currentEmployee : activeEmployees){


			if(currentEmployee.getEmployeeIdNumber() == employeeIDNumber){

				return currentEmployee;

	
			}
		}
	return null;
	}

}