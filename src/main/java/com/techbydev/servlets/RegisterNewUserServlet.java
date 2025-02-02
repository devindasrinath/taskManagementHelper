package com.techbydev.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techbydev.dao.UsersDao;
import com.techbydev.model.UserPojo;

/**
 * Servlet implementation class RegisterNewUserServlet
 */
@WebServlet("/createUser")
public class RegisterNewUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		try {
			ArrayList<String> roles = new ArrayList<String>();
			roles.add("member");
			UserPojo userPojo = new UserPojo(null, userName, password, roles);
			UsersDao usersDao =  new UsersDao();
			usersDao.createUser(userPojo);
			
			response.sendRedirect("/taskManagementHelper/login");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
