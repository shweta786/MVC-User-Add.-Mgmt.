package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogOut extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");        
        request.getRequestDispatcher("index.html").include(request, response);
        HttpSession session = request.getSession();
        session.invalidate();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Successfully Logged out');");
        out.println("</script>");
        

    }

}
