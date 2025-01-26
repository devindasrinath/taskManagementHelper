package com.techbydev.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techbydev.services.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/loginUser")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String password = request.getParameter("password");
		String userName = request.getParameter("userName");
		
		ValidateUser validateUser = new ValidateUser();
		String user_id = validateUser.validateCredentials(userName, password);
		if(user_id!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("userId",user_id);
			if(validateUser.isUserAdmin(userName)) {
				session.setAttribute("isAdmin", true);
			} else {
				session.setAttribute("isAdmin", false);
			}
			response.sendRedirect("/taskManagementHelper/dashBoard");
		} else {
			response.sendRedirect("/taskManagementHelper/login");
		}
	}

}
