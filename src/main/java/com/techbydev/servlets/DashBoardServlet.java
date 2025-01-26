package com.techbydev.servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techbydev.dao.ProjectsDao;
import com.techbydev.pojo.ProjectPojo;

/**
 * Servlet implementation class prpjectsServlet
 */
@WebServlet("/dashBoard")
public class DashBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ProjectsDao projectsDao = new ProjectsDao();
		ArrayList<ProjectPojo> projectPojos = ((boolean) session.getAttribute("isAdmin") == true)
				? projectsDao.getAllProjects()
				: projectsDao.getProjectsByAssignedUserId((String) session.getAttribute("userId"));

		request.setAttribute("userProjects", projectPojos);
		request.getRequestDispatcher("dashBoard.jsp").forward(request, response);
	}

}
