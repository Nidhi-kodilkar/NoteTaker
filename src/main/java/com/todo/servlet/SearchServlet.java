package com.todo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.todo.entities.Note;
import com.todo.helper.FactoryProvider;

/**
 * Servlet implementation class SearchServlet
 */
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String search = request.getParameter("search");
		Session session = FactoryProvider.getFactory().openSession();

		//String hql = "from Note N where N.title = search";
		String hql = "from Note where title  =:x";

		Query query = session.createQuery(hql);
		query.setParameter("x",search);
		List <Note> list = query.list();
		
		for(Note n:list) {
			System.out.println(n.getTitle()+" : "+n.getContent());
		}
		
		request.setAttribute("list", list);
		
	    request.getRequestDispatcher("search.jsp").forward(request, response);

		
	}

}
