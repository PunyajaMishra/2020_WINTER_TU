
public class Eagle implements Animals, Birds{

	private String name;
	
	public Eagle(String name) {
		this.name = name;
	}
	
	@Override
	public String canEat() {
		return "I can Eat all animals" ;
	}
	
	public String canMove() {
		return "I an move on 2 legs ";
	}
	public String canFly() {
		return "I can fly ";
	}
	
	@Override
	public String toString() {
		return "\t\nI am a Eagle, named " + name;
	}
}
