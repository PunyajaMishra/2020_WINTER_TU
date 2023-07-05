import org.junit.Test; 
import static org.junit.Assert.*;

public class InternetChargeTest {

	@Test
	public void getMonthlyChargetest() throws Exception {
		InternetCharge testcharge = new InternetCharge(2.5,true,14.5,null);
		testcharge.setMonthlyRate(50);
		double expectedCharge = 62.5;
		double outputCharge = testcharge.getMonthlyCharge();
		assertTrue(expectedCharge == outputCharge);
	}
	
	@Test (expected = Exception.class)
	public void testNegativeRateValue() throws Exception{
		InternetCharge testcharge = new InternetCharge(2.5,true,14.5,null);
		testcharge.setMonthlyRate(-50);	
		double outputCharge = testcharge.getMonthlyCharge();
	}

}
