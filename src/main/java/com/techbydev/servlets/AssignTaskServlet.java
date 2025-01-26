package com.techbydev.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techbydev.dao.UserTaskDao;
import com.techbydev.pojo.UserTaskBindingPojo;

/**
 * Servlet implementation class dashBoardServlet
 */
@WebServlet("/bindUserTask")
public class AssignTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String taskId = request.getParameter("taskId");
		String userId = request.getParameter("userId");
		UserTaskDao userTaskDao = new  UserTaskDao();
		userTaskDao.assignTask(new UserTaskBindingPojo(null, userId, taskId));

		response.sendRedirect("/taskManagementHelper/task?id=" + taskId);
	}

}
