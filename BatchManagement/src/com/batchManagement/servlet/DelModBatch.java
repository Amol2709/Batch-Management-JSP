package com.batchManagement.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.batchManagement.module.ConnectSQL;

@WebServlet("/DelModBatch")
public class DelModBatch extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    public DelModBatch()
    {
        super();
    }

	@SuppressWarnings("null")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try 
		{
			String curr_tech = "";
			String curr_fac = "";
			ArrayList<String> faculties = new ArrayList<String>();
			String[] details = request.getParameter("batch_name").split(",",2);
			int id = Integer.parseInt(details[1]);
			String batch_name = details[0];
			ConnectSQL obj = new ConnectSQL();
			Connection conn = obj.connect("batch_management");
			String button = request.getParameter("button");
			if(button.equals("modify"))
			{
				String sqlfind = "SELECT * from batch where ID=?";
				PreparedStatement pstmt = conn.prepareStatement(sqlfind);
				pstmt.setInt(1, id);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
//				int id = rs.getInt(6);
//				int uid = rs.getInt(1);
				curr_fac = rs.getString(7);
				curr_tech = rs.getString(6);
				pstmt.close();
				rs.close();
//				
				String sqlf = "SELECT * FROM academy_users WHERE Role=?";
				PreparedStatement pstmt2 = conn.prepareStatement(sqlf);
				pstmt2.setString(1, "Faculty");
				ResultSet rs2 = pstmt2.executeQuery();
//				
				while(rs2.next())
				{
					if(rs2.getString(2) != curr_fac)
					{
						faculties.add(rs2.getString(2) + "," + rs2.getInt(1));
					}
				}
				
				rs2.close();
				pstmt2.close();
				
				request.setAttribute("faculties", faculties);
				request.setAttribute("curr_fac", curr_fac);
				request.setAttribute("curr_tech", curr_tech);
				request.setAttribute("batch_name", batch_name);
				request.setAttribute("bid", id);
//				
				RequestDispatcher rdispatch = request.getRequestDispatcher("/modify_batch.jsp");
				rdispatch.forward(request, response);
//				
			}
			else if(button.equals("delete"))
			{
				String sqldel = "DELETE from batch WHERE ID=?";
				PreparedStatement pstmt = conn.prepareStatement(sqldel);
				pstmt.setInt(1, id);
				pstmt.executeUpdate();
				
				String sqlsearch = "SELECT * from academy_users WHERE BATCH_ID=?";
				PreparedStatement pstmt3 = conn.prepareStatement(sqlsearch);
				pstmt3.setInt(1, id);
				ResultSet rs = pstmt3.executeQuery();
				
				while(rs.next())
				{
				
					String sqldel2 = "UPDATE academy_users set Batch_ID=? WHERE Batch_ID=?";
					PreparedStatement pstmt2 = conn.prepareStatement(sqldel2);
					pstmt2.setNull(1,Types.NULL);
					pstmt2.setInt(2, id);
					pstmt2.executeUpdate();
					pstmt2.close();
				}
				
				pstmt3.close();
				pstmt.close();
				
				RequestDispatcher rdispatch = request.getRequestDispatcher("/admin_first.jsp");
				rdispatch.forward(request, response);
			}
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
