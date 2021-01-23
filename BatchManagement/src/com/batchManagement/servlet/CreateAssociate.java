package com.batchManagement.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.batchManagement.module.ConnectSQL;

@WebServlet("/CreateAssociate")
public class CreateAssociate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateAssociate()
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ConnectSQL obj = new ConnectSQL();
		ArrayList<String> batches = new ArrayList<String>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try
		{
			conn = obj.connect("batch_management");
			stmt = conn.createStatement();
			String sql = "Select * from batch";
			rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				batches.add(rs.getString(2));
			}
			request.setAttribute("batches", batches);
			
			RequestDispatcher rdispatch = request.getRequestDispatcher("/create_associate.jsp");
			rdispatch.forward(request, response);
			
			
		}
		catch (ClassNotFoundException | SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}

}
