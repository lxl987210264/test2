package com;

public class demo {
	public static  void main(String[] args) {
		int kongping=5;
		int gai=5;
		int allping=5;
		while(kongping>=2||gai>=4){
			allping+=kongping/2+gai/4;
			System.out.println("一共可以喝"+allping+"瓶");
			int kongping1=kongping/2+kongping%2+gai/4;
			System.out.println("空瓶"+kongping1);
			int gai1=gai/4+gai%4+kongping/2;
			System.out.println("瓶盖"+gai1);
			kongping=kongping1;
			gai=gai1;
		}
		System.out.println("一共喝了"+allping);
          System.out.println(23&2); 
	}
	
}
