package com.mvc.controller;

/*
 * 
 */
import com.mvc.bean.UserBean;
import com.mvc.dao.SignInDao;
import com.mvc.util.MD5;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SignIn extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String mailPhone = request.getParameter("mail");
        
        String password = MD5.getHash(request.getParameter("password"));
        int exec = SignInDao.checkDetails(mailPhone, password);
        if (exec == 1) {
            UserBean ub = new UserBean();
            ub.setMailPhone(mailPhone);
            ub.setPassword(password);
            if (SignInDao.checkStatus(mailPhone) == 0) {
                out.println("<script type=\"text/javascript\">"); 
                out.println("alert('This account has been Deactivated');");
                out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("index.html");
                rd.include(request, response);
                return ;
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("mail", mailPhone);
            }
            if (mailPhone.equals("admin@admin.com")) {
                RequestDispatcher rd = request.getRequestDispatcher("AdminPage.jsp");
                rd.forward(request, response);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("showinfo.jsp");
                rd.forward(request, response);
            }
        } else {
            if (mailPhone.equals("admin@admin.com")) {
                out.println("<script type=\"text/javascript\">"); 
                out.println("alert('Incorrect Password');");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">"); 
                out.println("alert('Wrong Credentials');");
                out.println("</script>");
            }
            RequestDispatcher rd = request.getRequestDispatcher("index.html");
            rd.include(request, response);
        }
    }

}
