package com.batchManagement.servlet;

import java.util.*;

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

@WebServlet("/CreateBatch")
public class CreateBatch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateBatch() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConnectSQL obj = new ConnectSQL();
		ArrayList<String> faculties = new ArrayList<String>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try
		{
			conn = obj.connect("batch_management");
			stmt = conn.createStatement();
			String sql = "Select * from academy_users";
			rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				if("Faculty".equals(rs.getString(5)))
				{
					faculties.add(rs.getString(2));
				}
			}
			request.setAttribute("faculties", faculties);
			
			RequestDispatcher rdispatch = request.getRequestDispatcher("/create_batch.jsp");
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
