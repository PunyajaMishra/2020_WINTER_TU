import java.util.Scanner;

public class Assignment1 {
	 public static void main(String[] args) {
		 Scanner input = new Scanner(System.in);
		 
		 System.out.println("Enter side 1 : ");
		 double side1 = input.nextDouble();
		 
		 System.out.println("Enter side 1 : ");
		 double side2 = input.nextDouble();
		 
		 System.out.println("Enter side 1 : ");
		 double side3 = input.nextDouble();
		 
		 Triangle triangle = new Triangle(side1, side2, side3);     
		
		 System.out.println("Enter the color you want your triangle to be : " );
		 String color = input.next();
		
		 triangle.setColor(color);    
		 triangle.setFilled(true); 
     //System.out.println(triangle);     
     System.out.println("The area is " + triangle.getArea());    
     System.out.println("The perimeter is "       + triangle.getPerimeter());     System.out.println(triangle);  
     }
}
