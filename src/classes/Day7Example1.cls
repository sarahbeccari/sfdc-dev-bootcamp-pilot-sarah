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
}