

public class Circle extends GeometricObject {

	private double x, y, radius;
	
	public double getx()
	{
		return this.x;
	}
	
	public double gety()
	{
		return this.y;
	}
	
	public double getradius() 
	{
		return this.radius;
	}
	
	public Circle()
	{
		this.x=0;
		this.y=0;
		this.radius=1;
	}
	public Circle(double x, double y, double radius)
	{
		this.x=x;
		this.y=y;
		this.radius=radius;
	}
	
	public double getArea()
	{
		return java.lang.Math.PI * this.radius * this.radius;
	}
	
	public double getPerimeter()
	{
		return 2*java.lang.Math.PI * this.radius;
	}
	
}
