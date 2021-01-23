package com.batchManagement.servlet;

import java.io.IOException;
import java.sql.Connection;
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

/**
 * Servlet implementation class NewBatchToDB
 */
@WebServlet("/NewBatchToDB")
public class NewBatchToDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NewBatchToDB() 
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String Batch_Name = request.getParameter("Batch_Name");
		String tech = request.getParameter("technology");
		String fac = request.getParameter("facultydrop");
		String S_date = request.getParameter("S_year") + "-" + request.getParameter("S_month") + "-" + request.getParameter("S_day");
		String E_date = request.getParameter("E_year") + "-" + request.getParameter("E_month") + "-" + request.getParameter("E_day");
		String desc = request.getParameter("B_description");
		
		ConnectSQL obj = new ConnectSQL();
		try 
		{
			Connection conn = obj.connect("batch_management");
			Statement stmt = conn.createStatement();
			String sql = "INSERT INTO batch (Name,Description,Start_Date,Stop_Date,Technology,Faculty) VALUES('"+Batch_Name+"','"+desc+"','"+S_date+"','"+E_date+"','"+tech+"','"+fac+"')";
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
