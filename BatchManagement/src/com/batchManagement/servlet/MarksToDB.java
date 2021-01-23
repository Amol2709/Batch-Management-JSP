package com.batchManagement.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.batchManagement.module.ConnectSQL;

@WebServlet("/MarksToDB")
public class MarksToDB extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    public MarksToDB()
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int marks = Integer.parseInt(request.getParameter("marks"));
		int batch_id = Integer.parseInt(request.getParameter("batch_id"));
		String tech = request.getParameter("list_tech");
		String[] asso_details = request.getParameter("list_asso").split(",",2);
		String name = asso_details[0];
		int id = Integer.parseInt(asso_details[1]);
		ConnectSQL obj = new ConnectSQL();
		try
		{
			Connection conn = obj.connect("batch_management");
			String sql1 = "SELECT * FROM grade_sheet WHERE ID=?";
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setInt(1, id);
			ResultSet rs1 = pstmt1.executeQuery();
			
			if(rs1.next())
			{
				if(tech.equals("Python"))
				{
					String sql2 = "UPDATE grade_sheet set Python=? WHERE ID=?";
					PreparedStatement pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setInt(1, marks);
					pstmt2.setInt(2, id);
					pstmt2.executeUpdate();
					pstmt2.close();
					conn.close();
				}
				
				else if(tech.equals("Powershell"))
				{
					String sql2 = "UPDATE grade_sheet set Powershell=? WHERE ID=?";
					PreparedStatement pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setInt(1, marks);
					pstmt2.setInt(2, id);
					pstmt2.executeUpdate();
					pstmt2.close();
					conn.close();
				}
				else if(tech.equals("Bash"))
				{
					String sql2 = "UPDATE grade_sheet set Bash=? WHERE ID=?";
					PreparedStatement pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setInt(1, marks);
					pstmt2.setInt(2, id);
					pstmt2.executeUpdate();
					pstmt2.close();
					conn.close();
				}
			}
			else
			{
				if(tech.equals("Python"))
				{
					String sql3 = "INSERT INTO grade_sheet (ID,Name,Python,Batch_ID) VALUES (?,?,?,?)";
					PreparedStatement pstmt3 = conn.prepareStatement(sql3);
					pstmt3.setInt(1, id);
					pstmt3.setString(2, name);
					pstmt3.setInt(3, marks);
					pstmt3.setInt(4, batch_id);
					pstmt3.executeUpdate();
					pstmt3.close();
					conn.close();
				}
				
				else if(tech.equals("Powershell"))
				{
					String sql3 = "INSERT INTO grade_sheet (ID,Name,Powershell,Batch_ID) VALUES (?,?,?,?)";
					PreparedStatement pstmt3 = conn.prepareStatement(sql3);
					pstmt3.setInt(1, id);
					pstmt3.setString(2, name);
					pstmt3.setInt(3, marks);
					pstmt3.setInt(4, batch_id);
					pstmt3.executeUpdate();
					pstmt3.close();
					conn.close();
				}
				else if(tech.equals("Bash"))
				{
					String sql3 = "INSERT INTO grade_sheet (ID,Name,Bash,Batch_ID) VALUES (?,?,?,?)";
					PreparedStatement pstmt3 = conn.prepareStatement(sql3);
					pstmt3.setInt(1, id);
					pstmt3.setString(2, name);
					pstmt3.setInt(3, marks);
					pstmt3.setInt(4, batch_id);
					pstmt3.executeUpdate();
					pstmt3.close();
					conn.close();
				}
			}
		}
		catch (SQLException | ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		
		RequestDispatcher rdispatch = request.getRequestDispatcher("/faculty_info.jsp");
		rdispatch.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}

}
