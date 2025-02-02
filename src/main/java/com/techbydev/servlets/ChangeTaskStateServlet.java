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
@WebServlet("/changeTaskState")
public class ChangeTaskStateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String taskId = request.getParameter("taskId");
		String taskState = request.getParameter("taskState");
		TasksDao taskDao = new TasksDao();
		taskDao.changeTaskStateById(taskId, taskState);
		response.sendRedirect("/taskManagementHelper/task?id="+taskId);

	}

}
