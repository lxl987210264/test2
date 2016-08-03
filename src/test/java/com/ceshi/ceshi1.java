package com.ceshi;

import com.opensymphony.xwork2.ActionSupport;


public class ceshi1  extends ActionSupport{
	public String login(){
		System.out.println("YES");
		return "success";
	}
    public static void main(String[] args) {
		System.out.println("aa");
	}
}
