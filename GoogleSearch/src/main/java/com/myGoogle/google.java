package com.myGoogle;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
@WebServlet("/GoogleSearch")
public class google extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public google() {
        super();
        // TODO Auto-generated constructor stub
    }



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//(Client side) send Redirect to redirect to any website/servlet
		String Search = request.getParameter("search");
		String sendRedirectURL = "https://www.google.co.in/search?q=" + URLEncoder.encode(Search, "UTF-8");
		response.sendRedirect(sendRedirectURL);
		
	}

}
