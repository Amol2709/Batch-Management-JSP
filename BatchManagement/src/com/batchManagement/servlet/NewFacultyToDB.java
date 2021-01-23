package com.batchManagement.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.batchManagement.module.ConnectSQL;

@WebServlet("/NewFacultyToDB")
public class NewFacultyToDB extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    public NewFacultyToDB()
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String name = request.getParameter("First_Name") + " " + request.getParameter("Last_Name");
		String email = request.getParameter("Email");
		
		ConnectSQL obj = new ConnectSQL();
		try 
		{
			Connection conn = obj.connect("batch_management");
			Statement stmt = conn.createStatement();
			String sql = "INSERT INTO academy_users (Name,Email,Password,Role) VALUES('"+name+"','"+email+"','test','Faculty')";
			stmt.executeUpdate(sql);
			stmt.close();
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
