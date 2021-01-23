package com.batchManagement.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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

@WebServlet("/OverallSummary")
public class OverallSummary extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    public OverallSummary()
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int counterr = 0;
		ArrayList<String> b_name = new ArrayList<String>();
		ArrayList<Integer> b_tot = new ArrayList<Integer>();
		ConnectSQL obj = new ConnectSQL();
		try 
		{
			Connection conn = obj.connect("batch_management");
			Statement stmt = conn.createStatement();
			String sql = "Select * from batch";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				counterr++;
				int count = 0;
				int id = rs.getInt(1);
				String sql2 = "Select * from academy_users WHERE Batch_ID="+id;
				PreparedStatement pstmt2 = conn.prepareStatement(sql2);
//				pstmt2.setInt(1, id);
				ResultSet rs2 = pstmt2.executeQuery(sql2);
				while(rs2.next())
				{
					count++;
				}
				b_tot.add(count);
				b_name.add(rs.getString(2));
				pstmt2.close();
				rs2.close();
			}
			rs.close();
			stmt.close();
			conn.close();
			
			request.setAttribute("b_name", b_name);
			request.setAttribute("b_tot", b_tot);
			request.setAttribute("counter", counterr);
			
			RequestDispatcher rdispatch = request.getRequestDispatcher("/overall_summary.jsp");
			rdispatch.forward(request, response);
			
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
