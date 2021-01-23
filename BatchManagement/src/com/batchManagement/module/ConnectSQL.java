package com.batchManagement.module;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectSQL {
	
	public Connection connect(String dbname) throws ClassNotFoundException
	{
		Connection conn = null;
		String database = dbname;
		String user = "root";
		String password = "Parth@123Parth@123";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/"+database,user,password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

}
