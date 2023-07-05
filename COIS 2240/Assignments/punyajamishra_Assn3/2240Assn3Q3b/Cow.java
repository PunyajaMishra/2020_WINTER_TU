
public class Cow implements Animals {

	private String name;
	
	public Cow(String name) {
		this.name = name;
	}
	
	@Override
	public String canEat() {
		return "I can eat all Plants "  ;
	}
	
	public String canMove() {
		return "I can move on 4 legs";
	}
	
	public String howtoeat() {
		return "how to eat me : roast it";
	}
	
	@Override
	public String toString() {
		return "\t\nI am a Cow, named " + name;
	}
}
