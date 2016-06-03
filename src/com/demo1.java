package com;
/**
 * 有一对兔子，从出生后第3个月起每个月都生一对兔子，小兔子长到第三个月后每个月又生一对兔子，假如兔子都不死，问每个月的兔子总数为多少？ 
 * @author techbuddy
 *
 */
public class demo1 {
  public static void main(String[] args) {
	int all1=2;//生下满一个月的兔子
	int all2=0;//生下满2个月的兔子
	int all3=0;
	int yue=1;
	while(yue<12){
	    if(yue==1){
	    	all1=2;
	    	all2=0;
	    	all3=0;
	    }
	    if(yue==2){
	    	all1=2;
	    	all2=2;
	    	all3=0;
	    }else{
	    	all3=all2+all2*2;
	    	all2=all3;
	    	all1=all2*2;
	    }
	    yue++;
	    System.out.println("第"+yue+"个月"+all3+"只");
	}
}
}
