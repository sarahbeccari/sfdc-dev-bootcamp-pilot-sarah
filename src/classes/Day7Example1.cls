public with sharing class Day7Example1 {
	public static void execute() {

		Employer.numberOfEmployers = 0;
		System.debug(Employer.numberOfEmployers);

		Employer atg = new Employer('ATG', 'Missoula', true, '555-1234');
		System.debug(atg.printEmployer());
		Employer.numberOfEmployers = 1;
		System.debug(atg.printEmployer());
		System.debug(Employer.numberOfEmployers);


		Employer mcDonalds = new Employer('McDonalds', 'Missoula', false, '555-2234');
		Employer.numberOfEmployers = 2;
		System.debug(mcDonalds.printEmployer());
		System.debug(Employer.numberOfEmployers);


		Employer lmg = new Employer('LMG', 'Missoula', false, '555-2234');
		Employer.numberOfEmployers = 3;
		System.debug(lmg.printEmployer());
		System.debug(Employer.numberOfEmployers);


		System.debug(atg.printEmployer());

		
	}

	public static void createEmployerWithEmployees(){


		Employer atg = new Employer('ATG', 'Missoula1234');

		Employee sarah = new Employee('Sarah', 'Beccari');

		atg.addEmployee(sarah);
		atg.printEmployer();

		List<Employee> newHireEmployees = new List<Employee>();


		newHireEmployees.add(new Employee('Joseph', 'Desch', Date.newInstance(2017, 02, 27)));
		newHireEmployees.add(new Employee('Jack', 'Jackson', Date.newInstance(2017, 02, 27)));

		atg.addEmployee(newHireEmployees);
		atg.printEmployer();

		Employee employee2 = atg.getEmployeeById(2);
		employee2.printEmployee();


		atg.terminateEmployee(1);
		atg.printEmployer();



	}



	public static void showErrorHandling(){


		Employer atg = new Employer('ATG', 'Missoula1234');

		Employee sarah = new Employee('Sarah', 'Beccari');

		atg.addEmployee(sarah);
		atg.printEmployer();

		List<Employee> newHireEmployees = new List<Employee>();


		newHireEmployees.add(new Employee('Joseph', 'Daniel Desch', Date.newInstance(2017, 02, 27)));
		newHireEmployees.add(new Employee('Jack', 'Jackson', Date.newInstance(2017, 02, 27)));

		atg.addEmployee(newHireEmployees);
		atg.printEmployer();

		Employee employee2 = atg.getEmployeeById(10);


		/////////////////// begin error trapping /////////////////////////////////////////////

		if(employee2 != null){

			employee2.printEmployee();
		}
		else{
			System.debug('Employee not found!!');
		}


		////////////////////////////////begin try ///////////////////////////////////////////


		try{

			employee2.printEmployee();


		} catch(Exception ex){


			System.debug ('Exception: '+ ex.getMessage());



		} finally { // will always hit this

			System.debug('We are in finally 1!');

		}

		//////////////////Execute try wihtout throwing error/////////////////////////////


		try{

			Employee employee3 = atg.getEmployeeById(3);

			employee3.printEmployee();


		} catch(Exception ex){


			System.debug ('Exception: '+ ex.getMessage());



		} finally { 

			System.debug('We are in finally 2!');

		}

	}
}