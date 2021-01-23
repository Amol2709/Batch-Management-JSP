package com.batchManagement.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.batchManagement.module.ConnectSQL;

@WebServlet("/AddMarks")
public class AddMarks extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    public AddMarks()
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ConnectSQL obj = new ConnectSQL();
		String[] batch_details = request.getParameter("batch_name").split(",",2);
		String batch_name = batch_details[0];
		int batch_id = Integer.parseInt(batch_details[1]);
		
		try 
		{
			ArrayList<String> associates = new ArrayList<String>();
			Connection conn = obj.connect("batch_management");
			String sql = "SELECT * FROM academy_users WHERE Batch_ID=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, batch_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				if("Associate".equals(rs.getString(5)))
				{
					associates.add(rs.getString(2) + "," + rs.getString(1));
				}
			}
			request.setAttribute("associates", associates);
			request.setAttribute("batch_id", batch_id);
			
			RequestDispatcher rdispatch = request.getRequestDispatcher("/add_marks.jsp");
			rdispatch.forward(request, response);
			
			rs.close();
			pstmt.close();
			conn.close();
		}
		catch (ClassNotFoundException | SQLException e)
		{
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
