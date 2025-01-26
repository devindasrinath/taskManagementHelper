package com.techbydev.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techbydev.dao.TasksDao;
import com.techbydev.pojo.TaskPojo;

/**
 * Servlet implementation class taskServlet
 */
@WebServlet("/project")
public class ProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String projectId = request.getParameter("id");
		String userId = (String) session.getAttribute("userId");

		ArrayList<TaskPojo> tasks;
		TasksDao tasksDao = new TasksDao();
		tasks = (boolean) session.getAttribute("isAdmin") ? tasksDao.getAllTasks()
				: tasksDao.getTasksByUserId(userId, projectId);
		request.setAttribute("userTasks", tasks);
		session.setAttribute("projectId", projectId);

		RequestDispatcher nextDispatcher = request.getRequestDispatcher("/project.jsp");
		nextDispatcher.forward(request, response);

	}

}
