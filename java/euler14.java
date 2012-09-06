import java.util.ArrayList;
import java.util.Arrays;
import java.util.BitSet;
import java.util.List;


public class euler14{
	private static BitSet bitSet = new BitSet(1000000);
	public static List<Integer> seq(long num){
		if(num < 4)return Arrays.asList(0);
		long tmp = num;
		List res = new ArrayList<Integer>();
		while (tmp != 1) {
			res.add(tmp);
			if(tmp % 2 ==0){
				tmp /= 2;
			}else {
				tmp = 3 * tmp + 1;
			}
			if(tmp < 1000000 ){
				bitSet.set((int) tmp);
			}
		}
		return res;
	}
	
	public static List<Integer> result(int n){
		List<Integer> res = new ArrayList<Integer>();
		long s = System.nanoTime();
		for (int i = 0; i < n; i++) {
			boolean exist =bitSet.get(i);
			if (exist ) {
				continue;
			}
			List<Integer> seq = seq(i);
			if (seq.size() > res.size()) {
				res=seq;
			}
		}
		long e = System.nanoTime();
		System.out.println("time elasped:" + (e-s)/Math.pow(10, 9));
		return res;
	}

	public static void main(String[] args) {
		System.out.println(LongestSequence.result(1000000));
	}
}
