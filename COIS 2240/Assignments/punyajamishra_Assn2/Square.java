
public class Square extends Rectangle {

	private double side;
	
	public Square(double side)
	{
		super(side,side);
		this.side=side;
	}
	
	public double getArea()
	{
		return this.side*this.side;
	}
	
	public double getPerimeter()
	{
		return 4*this.side;
	}
}
