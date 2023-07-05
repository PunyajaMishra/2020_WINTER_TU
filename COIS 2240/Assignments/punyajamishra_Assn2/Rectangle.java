
public class Rectangle extends GeometricObject{

	private double side1, side2;

	public Rectangle()
	{
		this.side1=1;
		this.side2=1;
	}
	public Rectangle(double side1,double side2)
	{
		this.side1=side1;
		this.side2=side2;
	}
	public double getArea()
	{
		return this.side1*this.side2;
	}
	
	public double getPerimeter()
	{
		return 2*(this.side1+this.side2);
	}
}
