package com.mvc.controller;

import com.mvc.dao.AdminDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Admin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String status="";
        response.setContentType("text/html");
        int mail = Integer.parseInt(request.getParameter("user_id"));
        PrintWriter out = response.getWriter();
        if (request.getParameter("a") != null) {
            status = AdminDao.changeStatus(mail,1) + "Activated";
        } else if (request.getParameter("d") != null) {
            status = AdminDao.changeStatus(mail,0) + "Deactivated";
        }
        out.println(status);
        RequestDispatcher rd = request.getRequestDispatcher("AdminPage.jsp");
        rd.include(request, response);
        
    }

}
