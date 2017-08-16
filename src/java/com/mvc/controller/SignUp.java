package com.mvc.controller;

/*
 * 
 */
import com.mvc.dao.SignUpDao;
import com.mvc.util.MD5;
import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignUp extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        int exec;
        String f_name = request.getParameter("name");
        String m_name = request.getParameter("mname");
        String l_name = request.getParameter("lname");
        String email = request.getParameter("email");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String password = MD5.getHash(request.getParameter("pass"));
        try {
             exec = SignUpDao.saveDetails(f_name, m_name, l_name,
                email, dob, gender, phone, password);
            if (exec != 0) {
                out.println("<script type=\"text/javascript\">"); 
                out.println("alert('Successfully Registered');");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">"); 
                out.println("alert('Error Occured, Try again');");
                out.println("</script>");                
            }
            RequestDispatcher rd = request.getRequestDispatcher("/index.html");
            rd.include(request, response);
        } catch (MySQLIntegrityConstraintViolationException e) {
            out.println("<script type=\"text/javascript\">"); 
            out.println("alert('Email is already registered with us');");
            out.println("</script>");
            RequestDispatcher rd = request.getRequestDispatcher("/index.html");
            rd.include(request, response);
        } 
        catch (Exception e) {
            out.println("<script type=\"text/javascript\">"); 
            out.println("alert('Something went wrong');");
            out.println("</script>");
        }
        
    }

}
