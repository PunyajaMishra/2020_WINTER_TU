
public class classfinals {

	public static void main(String[] args) {
		
		Chicken chicken = new Chicken("chickenu");
		Eagle eagle = new Eagle("eaglu");
		Cow cow = new Cow("cowu");
		Rabbit rabbit = new Rabbit("rabbitu");
		Tiger tiger = new Tiger("tigeru");
		
		PeaClass pea = new PeaClass("pea");
		CarrotClass carrot = new CarrotClass("carrot");
		
		System.out.println(chicken.toString());
		System.out.println(chicken.howtoeat());
		System.out.println(chicken.canMove());
		System.out.println(chicken.canFly());
		System.out.println(chicken.canEat());
		
		System.out.println(pea.toString());
		System.out.println(pea.howtoeat());
		
		System.out.println(eagle.toString());
		System.out.println(eagle.canEat());
		System.out.println(eagle.canMove());
		System.out.println(eagle.canFly());
		
		System.out.println(cow.toString());
		System.out.println(cow.howtoeat());
		System.out.println(cow.canMove());
		
		System.out.println(rabbit.toString());
		System.out.println(rabbit.canEat());
		System.out.println(rabbit.canMove());
		
		System.out.println(carrot.toString());
		System.out.println(carrot.howtoeat());
		
		System.out.println(tiger.toString());
		System.out.println(tiger.canEat());
		System.out.println(tiger.canMove());
	}
}
