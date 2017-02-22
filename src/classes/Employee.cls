public with sharing class Employee {
	
	private String firstName;
	private String lastName;
	private Date hireDate;
	private final Integer EMPLOYEE_ID_NUMBER;
	private static Integer previousEmployeeNumber=0;




	public Employee(String firstName ,String lastName, Date hireDate) {

		//every time we add a new employee, this will update our employee ID

		this.EMPLOYEE_ID_NUMBER = previousEmployeeNumber +1;
		previousEmployeeNumber = previousEmployeeNumber +1;
		this.firstName =firstName;
		this.lastName =lastName;
		this.hireDate =hireDate;


	}
	public Employee(String firstName ,String lastName) {
		this(firstName, lastName, Date.today());


	}
		

	
}