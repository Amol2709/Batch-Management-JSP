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
import com.mysql.cj.protocol.Resultset;

@SuppressWarnings("unused")
@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public static String curr_user;
       
    public String getCurr_user() {
		return curr_user;
	}

	public void setCurr_user(String curr_user) {
		this.curr_user = curr_user;
	}

	/**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try {
			login(request, response);
		} catch (ServletException | IOException | SQLException e) {
			e.printStackTrace();
		}
//		String action = request.getServletPath();
//		
//		switch(action)
//		{
//		case "/login":
//			try {
//				login(request, response);
//			} catch (ServletException | IOException | SQLException e) {
//				e.printStackTrace();
//			}
//		default:{}
//		}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private static void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException 
	{
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		ConnectSQL obj = new ConnectSQL();
		try 
		{
			Connection conn = obj.connect("batch_management");
			Statement stmt = conn.createStatement();
			String sql = "Select * from academy_users";
			ResultSet rs = stmt.executeQuery(sql);
			boolean flag = false;
			while(rs.next())
			{
//				System.out.println(rs.getString(3) + "    " + rs.getString(4));
				if((email.equals(rs.getString(3))) && (password.equals(rs.getString(4))))
				{
					flag = true;
					break;
				}
			}
			if(flag && "Admin".equals(rs.getString(5)))
			{
				String name = rs.getString(2);
				request.setAttribute("name", name);
				RequestDispatcher rdispatch = request.getRequestDispatcher("admin_first.jsp");
				rdispatch.forward(request, response);
			}
			else if(flag && "Faculty".equals(rs.getString(5)))
			{
				String name = rs.getString(2);
				request.setAttribute("name", name);
				RequestDispatcher rdispatch = request.getRequestDispatcher("faculty_info.jsp");
				rdispatch.forward(request, response);
			}
			else if(flag && "Associate".equals(rs.getString(5)))
			{
				String[] fname = rs.getString(2).split(" ",2);
				String name = fname[0];
				String surname = fname[1];
				int id = rs.getInt(1);
				request.setAttribute("name", name);
				request.setAttribute("surname", surname);
				request.setAttribute("email", email);
				request.setAttribute("id", id);
				RequestDispatcher rdispatch = request.getRequestDispatcher("associate_info.jsp");
				rdispatch.forward(request, response);
			}
			else
			{
				RequestDispatcher rdispatch = request.getRequestDispatcher("/alert.jsp");
				rdispatch.forward(request, response);
			}
			rs.close();
			stmt.close();
			conn.close();
		} 
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
	}

}
