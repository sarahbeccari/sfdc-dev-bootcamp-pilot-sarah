public class StringArrayTest {
    public void generateStringArray(){
        List<String> dogs = new List<String>{'marley', 'kelley', 'laya', 'dollar'};
            
            for(Integer i=0; i<dogs.size(); i++){
                System.debug(dogs[i]);
            }
    }
}