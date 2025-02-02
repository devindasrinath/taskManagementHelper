package com.techbydev.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techbydev.dao.TasksDao;
import com.techbydev.dao.UsersDao;
import com.techbydev.model.TaskPojo;
import com.techbydev.model.UserPublicPojo;

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
		String taskId = request.getParameter("id");
		TasksDao taskDao = new TasksDao();
		TaskPojo task = taskDao.getTaskById(taskId);
		UsersDao usersDao =  new UsersDao();
		ArrayList<UserPublicPojo> userPublicPojos = usersDao.getUsersByTaskId(taskId);
		request.setAttribute("task", task);
		request.setAttribute("assignedUsers", userPublicPojos);


		ArrayList<UserPublicPojo> userPublicPojos1 = usersDao.getUsersByprojectId(task.getProjectId());
		ArrayList<UserPublicPojo> assignedUserPublicPojos = usersDao.getUsersByTaskId(taskId);
		ArrayList<UserPublicPojo> selectedUserPublicPojos = new ArrayList<UserPublicPojo>();
		Set<String> assignedIds = assignedUserPublicPojos.stream()
		        .map(UserPublicPojo::getId)
		        .collect(Collectors.toSet());

		for (UserPublicPojo user : userPublicPojos1) {
		    if (!assignedIds.contains(user.getId())) {
		        selectedUserPublicPojos.add(user);
		    }
		}
		request.setAttribute("selectedUsers", selectedUserPublicPojos);
		
		RequestDispatcher nextDispatcher = request.getRequestDispatcher("/task.jsp");
		nextDispatcher.forward(request, response);

	}

}
