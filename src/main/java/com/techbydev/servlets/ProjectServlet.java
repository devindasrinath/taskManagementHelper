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
import javax.servlet.http.HttpSession;

import com.techbydev.dao.TasksDao;
import com.techbydev.dao.UsersDao;
import com.techbydev.pojo.TaskPojo;
import com.techbydev.pojo.UserPublicPojo;

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
		tasks = (boolean) session.getAttribute("isAdmin") ? tasksDao.getAllTasks(projectId)
				: tasksDao.getTasksByUserId(userId, projectId);
		UsersDao usersDao = new UsersDao();
		ArrayList<UserPublicPojo> assignedUsers = usersDao.getUsersByprojectId(projectId);
		request.setAttribute("assignedUsers", assignedUsers);
		request.setAttribute("userTasks", tasks);
		request.setAttribute("projectId", projectId);
		
		ArrayList<UserPublicPojo> allUsers = usersDao.getAllUsers();
		Set<String> assignedIds = assignedUsers.stream()
		        .map(UserPublicPojo::getId)
		        .collect(Collectors.toSet());

		ArrayList<UserPublicPojo> nominatedUserPublicPojos = new ArrayList<UserPublicPojo>();
		for (UserPublicPojo user : allUsers) {
		    if (!assignedIds.contains(user.getId())) {
		    	nominatedUserPublicPojos.add(user);
		    }
		}

		request.setAttribute("selectedUsers", nominatedUserPublicPojos);
		
		RequestDispatcher nextDispatcher = request.getRequestDispatcher("/project.jsp");
		nextDispatcher.forward(request, response);

	}

}
