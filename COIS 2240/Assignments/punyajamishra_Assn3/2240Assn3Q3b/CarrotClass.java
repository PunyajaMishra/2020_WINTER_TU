
public class CarrotClass implements Plants, Edible{

	private String name;
	
	public CarrotClass(String name) {
		this.name=name;
	}
	
	public String toString() {
		return "\t\nI am plant : " + name;
	}
	
	public String howtoeat() {
		return "how to eat me : Eat as you wish ";
	}
}
