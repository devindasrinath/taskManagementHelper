package com.techbydev.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techbydev.dao.TasksDao;

/**
 * Servlet implementation class dashBoardServlet
 */
@WebServlet("/deleteTask")
public class DeleteTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#deDelete(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String taskId = request.getParameter("taskId");
		TasksDao tasksDao = new TasksDao();
		String projectId = tasksDao.getProjectIdByTaskId(taskId);
		tasksDao.deleteTask(taskId);

		response.sendRedirect("/taskManagementHelper/project?id="+projectId);
	}

}
