public with sharing class Week3Assignment1 {


	public static void executeZoos() {


		Zoo sarahsZoo = new Zoo('Zoo of Sarah', 'Rainbow Dr.', 1, Date.newInstance(1992, 1, 28));
		Zoo joesZoo = new Zoo('Zoo of Joe', 'Ryman Ave.', 1, Date.newInstance(1994, 2, 9));
		Zoo rachelsZoo = new Zoo('Zoo of Rachel', 'Easy St.', 1, Date.newInstance(1991, 11, 7));


		Contact myCaretaker = new Contact();


		Animal animal1 = new Animal('Jerry', 'Giraffe', Date.today(), myCaretaker);
		Animal animal2 = new Animal('Elle', 'Elephant', Date.today(), myCaretaker);
		Animal animal3 = new Animal('Mousey', 'Mouse', Date.today(), myCaretaker);
		Animal animal4 = new Animal('Dear', 'Deer', Date.today(), myCaretaker);

		Animal animal5 = new Animal('Dorky', 'Giraffe', Date.today(), myCaretaker);
		Animal animal6 = new Animal('Sneezy', 'Giraffe', Date.today(), myCaretaker);
		Animal animal7 = new Animal('Breezy', 'Giraffe', Date.today(), myCaretaker);
		Animal animal8 = new Animal('Turd', 'Giraffe', Date.today(), myCaretaker);

		Animal animal9 = new Animal('Jerry', 'Giraffe', Date.today(), myCaretaker);
		Animal animal10 = new Animal('Jerry', 'Giraffe', Date.today(), myCaretaker);
		Animal animal11 = new Animal('Jerry', 'Giraffe', Date.today(), myCaretaker);
		Animal animal12 = new Animal('Jerry', 'Giraffe', Date.today(), myCaretaker);

		
	}
}