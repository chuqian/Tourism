import java.util.Scanner;

public class ID {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		String str = in.nextLine();
		
		if(str.length() > 0) {
			for(int i=0; i<=str.length()-5; i++) {
				int temp = 0;
				for(int j=i; j<i+5; j++) {
					temp = temp + str.charAt(j) - '0';
				}
				if(temp%7 == 0)
					System.out.println(i+1);
			}
		}
	}
}
