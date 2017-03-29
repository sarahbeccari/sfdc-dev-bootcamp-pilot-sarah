public with sharing class Desk {

	private Integer numDrawers {get; set;}
	private String brand = 'Ikea';


	public Desk(Integer numDrawers) {
		this.numDrawers = numDrawers;
		
	}



}

/**
*Desk myDesk = new Desk(100);
*
*
*/