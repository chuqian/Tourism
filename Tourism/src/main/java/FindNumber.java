import java.util.Arrays;
import java.util.Comparator;

public class FindNumber {

	public static void main(String[] args) {
		Integer[] a = new Integer[99];
		Arrays.sort(a, new Comparator<Integer>() {
			@Override
			public int compare(Integer a1, Integer a2) {
				return a1-a2;
			}
		});
		
		int i=0;
		while(i < a.length-1){
			if(a[i]+1 != a[i+1]){
				System.out.println(a[i]+1);
				break;
			}
			i++;
		}
		if(i == a.length-1)
			System.out.println(a[i]+1);
	}

}
