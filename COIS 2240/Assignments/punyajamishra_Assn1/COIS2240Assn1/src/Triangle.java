
public class Triangle extends GeometricObject {
 private double side1=1.0;
 private double side2=1.0;
 private double side3=1.0;
 
 public Triangle() {
	 
 }
 
 public Triangle(double x1, double x2, double x3) {
	 this.side1=x1;
	 this.side2=x2;
	 this.side3=x3;
 }
 
 public void setSide1(double s) {
	 this.side1=s;
 }
 
 public double getSide1() {
	 return side1;
 }
 
 public void setSide2(double s) {
	 this.side2=s;
 }
 
 public double getSide2() {
	 return side2;
 }
 
 public void setSide3(double s) {
	 this.side3=s;
 }
 
 public double getSide3() {
	 return side3;
 }
 
 public double getArea() {
	double s=(0.5)*(side1 + side2 + side3);
	double area = java.lang.Math.sqrt(s*(s-side1)*(s-side2)*(s-side3));
	 return area;
 }
 
 public double getPerimeter() {
	 return side1+side2+side3;
 }
 
 public String ToString() {
	 return " Triangle : side1 = " + side1 + "side2 = " + side2 + "side3 = " + side3;
 }
}
