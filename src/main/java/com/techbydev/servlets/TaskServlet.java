package com.techbydev.servlets;

import java.io.IOException;

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
 * Servlet implementation class TaskServlet
 */
@WebServlet("/task")
public class TaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String taskId = request.getParameter("id");
		TasksDao taskDao = new TasksDao();
		TaskPojo task = taskDao.getTaskById(taskId);
		request.setAttribute("task", task);
		session.setAttribute("taskId", taskId);

		RequestDispatcher nextDispatcher = request.getRequestDispatcher("/task.jsp");
		nextDispatcher.forward(request, response);

	}

}
