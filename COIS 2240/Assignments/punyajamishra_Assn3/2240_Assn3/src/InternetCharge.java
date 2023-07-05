import java.util.Date; 

public class InternetCharge implements Cloneable {  
	double bandwith;  
	boolean isLimited;  
	double monthlyRate;  
	Date startDate;

  public InternetCharge(double bandwith, boolean limited, 
		  double monthlyRate, Date startDate) {   
	  this.bandwith = bandwith;   
	  this.isLimited = limited;   
	  this.monthlyRate = monthlyRate;   
	  this.startDate = startDate;
  }  
  
  public void setMonthlyRate(int rate) throws Exception {   
	  if (rate < 0)    
		  throw new Exception("Rate cannot be negative");   
	  if (isLimited) {    
		  this.monthlyRate = rate * 1;   
		  } 
	  else if (!isLimited) {    
			  this.monthlyRate = rate * 1.5;   
			  }  
	  }  
  
  public double getMonthlyCharge() {   
	  return monthlyRate * bandwith * 0.5;  
	  }  
  
  @Override  public Object clone() throws CloneNotSupportedException {   
	  // Write your code here 
	  try {
		  return (InternetCharge) super.clone();
	  } catch (CloneNotSupportedException e) {
		  return new InternetCharge(this.bandwith, this.isLimited, 
				  this.monthlyRate, this.startDate);
	  }
  }
  
}
