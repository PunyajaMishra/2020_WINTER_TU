public class Test {    
	public static void main(String[] args) { 
 
  GeometricObject gObjectArray [] = { new Circle(5,5,5), 
		  new EquilateralTriangle(5), new Triangle(5,5,5), 
		  new Rectangle(5,5), new Square(5)};
  
  for(int i=0; i<gObjectArray.length; i++)
  {
	printAreaAndPerimeter(gObjectArray[i]);  
  }
  
 }
  
 private static void printAreaAndPerimeter(GeometricObject gObject)
 {
	 if(gObject instanceof Circle)
	 {
		 System.out.println("Circle has area : " + gObject.getArea() +
				 " and perimeter : " + gObject.getPerimeter());
	 }
	 
	 else if(gObject instanceof EquilateralTriangle)
	 {
		 System.out.println("Equilateral Triangle has area : " + gObject.getArea() +
				 " and perimeter : " + gObject.getPerimeter());
	 }
	 
	 else if(gObject instanceof Triangle)
	 {
		 System.out.println("Triangle has area : " + gObject.getArea() +
				 " and perimeter : " + gObject.getPerimeter());
	 }
	 
	 else if(gObject instanceof Square)
	 {
		 System.out.println("Square has area : " + gObject.getArea() +
				 " and perimeter : " + gObject.getPerimeter());
	 }
	 
	 else 
	 {
		 System.out.println("Rectangle has area : " + gObject.getArea() +
				 " and perimeter : " + gObject.getPerimeter());
	 }
 }
 
} 

