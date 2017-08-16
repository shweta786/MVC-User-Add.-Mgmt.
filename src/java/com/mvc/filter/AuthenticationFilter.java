package com.mvc.filter;

/**
 *
 * @author SHWETA
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig fConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        PrintWriter out=res.getWriter();
        String mail=null;
        HttpSession session = req.getSession(false);
        if(session!=null){
            mail = (String) session.getAttribute("mail");
        }
        if (mail!=null && mail.equals("admin@admin.com")) {
            // pass the request along the filter chain
            chain.doFilter(request, response);
        } else {
            out.println("Unauthorized access request");
            res.sendRedirect("index.html");
        }
    }

    @Override
    public void destroy() {
    }

}
