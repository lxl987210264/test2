package jianting;

import java.util.Random;

public class RandomTest {
public static void main(String[] args) {
	Random r = new Random();
	int aa=Math.abs(r.nextInt()%19);
	int bb=r.nextInt(1)-3;
	System.out.println(aa);
	System.out.println(bb);
}
}
