package com.techbydev.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techbydev.dao.ProjectsDao;

/**
 * Servlet implementation class dashBoardServlet
 */
@WebServlet("/deleteProject")
public class DeleteProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#deDelete(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String projectId = request.getParameter("projectId");
		ProjectsDao projectsDao = new ProjectsDao();
		projectsDao.deleteProject(projectId);

		response.sendRedirect("/taskManagementHelper/dashBoard");
	}

}
