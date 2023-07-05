import java.util.*;
import java.io.*;
import java.nio.IntBuffer;

public class mainclass {

	public static void main(String[] args) throws Exception{
        //Making new file	
		File file = new File("Assignment3.txt");
		//checking if file exists
		if(file.exists()) {
			
			System.out.println("File already exists");
			System.exit(0);
		}
		
		
		else {
			
			try(PrintWriter output = new PrintWriter(file);) {//create output file
	    	for (int i=0; i<100; i++) {
	    		output.print(((int)(Math.random()*500)+1));
	    		output.print(" ");
	    	}
	    }
	    
			ArrayList<Integer> list = new ArrayList<>();
	    
			try(Scanner input = new Scanner(file);){
				while(input.hasNext()) {
					list.add(input.nextInt());
				}
		 }
		
		Collections.sort(list);
		
		System.out.println(list.toString());
		System.out.println();
		
		}
	}
	
}
