package com.batchManagement.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.batchManagement.module.ConnectSQL;
import com.mysql.cj.protocol.Resultset;

@WebServlet("/NewAssociateToDB")
public class NewAssociateToDB extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    public NewAssociateToDB()
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String name = request.getParameter("First_Name") + " " + request.getParameter("Last_Name");
		String email = request.getParameter("Email");
		String batch = request.getParameter("batchdrop");
		
		ConnectSQL obj = new ConnectSQL();
		try 
		{
			Connection conn = obj.connect("batch_management");
			Statement stmt = conn.createStatement();
			String sql1 = "SELECT * FROM batch WHERE Name='"+batch+"'";
			ResultSet rs = stmt.executeQuery(sql1);
			
			rs.next();
			int id = rs.getInt(1);
			
			String sql2 = "INSERT INTO academy_users (Name,Email,Password,Role,Batch_ID) VALUES(?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, "test");
			pstmt.setString(4, "Associate");
			pstmt.setInt(5, id);
			pstmt.executeUpdate();
			stmt.close();
			pstmt.close();
			conn.close();
		} 
		catch (ClassNotFoundException | SQLException e)
		{
			e.printStackTrace();
			RequestDispatcher rdispatch = request.getRequestDispatcher("/admin_first.jsp");
			rdispatch.forward(request, response);
		}
		
		RequestDispatcher rdispatch = request.getRequestDispatcher("/admin_first.jsp");
		rdispatch.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}

}
