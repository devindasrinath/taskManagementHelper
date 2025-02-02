package com.techbydev.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techbydev.dao.TasksDao;
import com.techbydev.model.TaskPojo;

/**
 * Servlet implementation class dashBoardServlet
 */
@WebServlet("/addTask")
public class CreateTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String taskName = request.getParameter("taskName");
		String tasktDesc = request.getParameter("taskDescription");
		String taskEst = request.getParameter("taskEstimation");
		String projectId = request.getParameter("projectId");
		TasksDao taskDao = new TasksDao();
		taskDao.addTask(new TaskPojo(null, taskName, tasktDesc, taskEst, null, projectId));

		response.sendRedirect("/taskManagementHelper/project?id=" + projectId);
	}

}
