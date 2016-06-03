package com;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FangwenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public FangwenServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		
	}
	
	public void init() throws ServletException {
		
	}
	 public static void writeFile(String filename,int count){
	        
	        try{
	        	
	            PrintWriter  out=new PrintWriter(new FileWriter(filename));
	          
	            out.println(count);
	            out.close();
	        }catch(IOException e){
	             e.printStackTrace();
	        }
	    }
	 public static int readFile(String filename) {
	        File f = new File(filename);
	        int count = 0;
	        if(!f.exists()){
	             writeFile(filename, 0);
	        }
	        try{
	            BufferedReader in = new BufferedReader(new FileReader(f));
	            try{
	                count = Integer.parseInt(in.readLine());    
	            }catch(NumberFormatException e){
	                e.printStackTrace();    
	        }catch(IOException  e){
	            e.printStackTrace();
	             }
	        }
	        catch(FileNotFoundException e) {
	            e.printStackTrace();
	            }
	        return count;
	    }
	 public static void main(String[] args) {
			System.out.println("aa");
		}
}
