package com.techbydev.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techbydev.dao.ProjectsDao;
import com.techbydev.model.ProjectPojo;

/**
 * Servlet implementation class dashBoardServlet
 */
@WebServlet("/addProject")
public class CreateProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String projectName = request.getParameter("projectName");
		String projectDesc = request.getParameter("projectDescription");
		ProjectsDao projectDao = new ProjectsDao();
		projectDao.addProject(new ProjectPojo(null, projectName, projectDesc));

		response.sendRedirect("/taskManagementHelper/dashBoard");
	}

}
