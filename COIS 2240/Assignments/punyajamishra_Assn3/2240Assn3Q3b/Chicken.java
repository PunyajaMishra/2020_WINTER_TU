
public class Chicken implements Animals, Birds, Edible{
	
	private String name;
	
	public Chicken(String name) {
		this.name = name;
	}


	public String canEat() {
		
		return "I can Eat peas";		
	}
	
	public String canMove() {
		return "Chicken can move on 2 legs ";
	}
	public String canFly() {
		return "I can fly";
	}
	public String howtoeat() {
		return "how to eat me : roast it";
	}
	
	
	public String toString() {
		return "\t\nI am a Chicken, named " + this.name;
	}
}
