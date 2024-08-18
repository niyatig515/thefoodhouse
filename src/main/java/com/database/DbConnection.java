package com.database;

import java.sql.Connection;

import java.sql.DriverManager;



public class DbConnection {
	public static Connection takeConnection(){
		   Connection con=null;
		   try {
			   Class.forName("com.mysql.cj.jdbc.Driver");
			   con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant", "root", "bhopal");  
		   }
		   catch(Exception e)
		   {
			   e.printStackTrace();
		   }
		   return con;  
	   }
}
