package com.batchManagement.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.batchManagement.module.ConnectSQL;

@WebServlet("/ModifyBatch")
public class ModifyBatch extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    public ModifyBatch()
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int bid = Integer.parseInt(request.getParameter("bid"));
		String[] new_facdet = request.getParameter("new_fac").split(",",2);
		String new_fac = new_facdet[0];
		String new_tech = request.getParameter("new_tech");
		
		try
		{
			ConnectSQL obj = new ConnectSQL();
			Connection conn = obj.connect("batch_management");
			String sql = "UPDATE batch set Technology=?,Faculty=? WHERE ID=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, new_tech);
			pstmt.setString(2, new_fac);
			pstmt.setInt(3, bid);
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
