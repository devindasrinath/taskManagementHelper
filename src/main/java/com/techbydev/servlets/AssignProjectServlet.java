package com.techbydev.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techbydev.dao.UserProjectDao;
import com.techbydev.pojo.UserProjectBindingPojo;

/**
 * Servlet implementation class dashBoardServlet
 */
@WebServlet("/bindUserProject")
public class AssignProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String projectId = request.getParameter("projectId");
		String userId = request.getParameter("userId");
		UserProjectDao userProjectDao = new UserProjectDao();
		userProjectDao.assignProject(new UserProjectBindingPojo(null, userId, projectId));

		response.sendRedirect("/taskManagementHelper/project?id=" + projectId);
	}

}
