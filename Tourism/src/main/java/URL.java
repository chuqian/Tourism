import java.util.Arrays;
import java.util.Comparator;
import java.util.Scanner;

import javax.swing.plaf.synth.SynthStyle;

public class URL {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		String url = in.nextLine();
		int start = url.indexOf("?");
		
		if(start != -1) {
			url = url.substring(start+1, url.length());
			String[] strs = url.split("&");
			for(String str : strs) {
				System.out.println(str.replace("=", ","));
			}
		}
	}
}
