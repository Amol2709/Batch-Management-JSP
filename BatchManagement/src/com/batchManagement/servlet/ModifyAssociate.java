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

@WebServlet("/ModifyAssociate")
public class ModifyAssociate extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    public ModifyAssociate()
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int uid = Integer.parseInt(request.getParameter("uid"));
		String[] new_batch = request.getParameter("user_job").split(",",2);
		int new_id = Integer.parseInt(new_batch[1]);		
		
		try
		{
			ConnectSQL obj = new ConnectSQL();
			Connection conn = obj.connect("batch_management");
			String sql = "UPDATE academy_users set Batch_ID=? WHERE ID=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, new_id);
			pstmt.setInt(2, uid);
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
			RequestDispatcher rdispatch = request.getRequestDispatcher("/admin_first.jsp");
			rdispatch.forward(request, response);
		}
		catch (SQLException | ClassNotFoundException e)
		{
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}

}
