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

@WebServlet("/DelModAssociate")
public class DelModAssociate extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    public DelModAssociate()
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try 
		{
			String curr_batch = "";
			ArrayList<String> batches = new ArrayList<String>();
			String[] details = request.getParameter("assoc_name").split(",",2);
			String email = details[1];
			String asso_name = details[0];
			ConnectSQL obj = new ConnectSQL();
			Connection conn = obj.connect("batch_management");
			String button = request.getParameter("name");
			if(button.equals("modify"))
			{
				String sqlfind = "SELECT * from academy_users where Email=?";
				PreparedStatement pstmt = conn.prepareStatement(sqlfind);
				pstmt.setString(1, email);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				int id = rs.getInt(6);
				System.out.println(id);
				int uid = rs.getInt(1);
				pstmt.close();
				rs.close();
				
				String sqlb = "SELECT * FROM batch";
				PreparedStatement pstmt2 = conn.prepareStatement(sqlb);
				ResultSet rs2 = pstmt2.executeQuery();
				
				while(rs2.next())
				{
					if(rs2.getInt(1) != id)
					{
						batches.add(rs2.getString(2) + "," + rs2.getInt(1));
					}
					else
					{
						curr_batch = rs2.getString(2) + "," + id;
					}
				}
				
				rs2.close();
				pstmt2.close();
				
				request.setAttribute("batches", batches);
				request.setAttribute("curr_batch", curr_batch);
				request.setAttribute("id", id);
				request.setAttribute("asso_name", asso_name);
				request.setAttribute("uid", uid);
				
				RequestDispatcher rdispatch = request.getRequestDispatcher("/modify_associate.jsp");
				rdispatch.forward(request, response);
				
			}
			else if(button.equals("delete"))
			{
				String sqldel = "DELETE from academy_users WHERE Email=?";
				PreparedStatement pstmt = conn.prepareStatement(sqldel);
				pstmt.setString(1, email);
				pstmt.executeUpdate();
				
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
