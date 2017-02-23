public with sharing class Employee {
	
	private String firstName;
	private String lastName;
	private Date hireDate;
	private Date terminationDate;
	private final Integer EMPLOYEE_ID_NUMBER;
	private static Integer previousEmployeeNumber=0; //static variables are set for every instance across the entire class




	public Employee(String firstName ,String lastName, Date hireDate) {

		//every time we add a new employee, this will update our employee ID

		

		this.EMPLOYEE_ID_NUMBER = previousEmployeeNumber +1;
		previousEmployeeNumber += 1; //ask about previousEmployeeNumber++;
		this.firstName =firstName;
		this.lastName =lastName;
		this.hireDate =hireDate;
		//this.terminationDate = terminationDate;

		System.debug('Calling full constructor -- Employee number: '+ EMPLOYEE_ID_NUMBER);
		System.debug('Calling full constructor -- Previous Employee number: '+ previousEmployeeNumber);




	}
	public Employee(String firstName ,String lastName) {
		this(firstName, lastName, Date.today()); //defualt hireDate to today
		//this means call the full constructor without repeating yourself

		System.debug('Calling partial constructor -- default hire date to today');


	}

	public Integer getEmployeeIdNumber(){

		return EMPLOYEE_ID_NUMBER;

	}


	public void printEmployee(){

		System.debug('First Name: ' +firstName);
		System.debug('Last Name: ' +lastName);
		System.debug('Hire Date: ' +hireDate);
		System.debug('Employee number: '+ EMPLOYEE_ID_NUMBER);



	}

	public void terminateEmployee(){

		terminationDate =Date.today();
	}

		

	
}