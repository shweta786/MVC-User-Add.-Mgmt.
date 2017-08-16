package com.mvc.controller;
import com.mvc.bean.UserBean;
import com.mvc.dao.SaveDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SaveDetail extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession ss = request.getSession(false);
        String mail = (String) ss.getAttribute("mail");
        int size = (int) ss.getAttribute("size");
        UserBean ub = (UserBean) ss.getAttribute("userbean");
        int user_id = ub.getUser_id();
        int i;

        String num = request.getParameter("num");
        SaveDao.savePhone(user_id, num);

        String p_add = request.getParameter("add0");
        String p_city = request.getParameter("city0");
        String p_state = request.getParameter("state0");
        String p_country = request.getParameter("country0");
        SaveDao.savePadd(user_id, p_add, p_city, p_state, p_country);

        String c_add = request.getParameter("add1");
        String c_city = request.getParameter("city1");
        String c_state = request.getParameter("state1");
        String c_country = request.getParameter("country1");
        SaveDao.saveCadd(user_id, c_add, c_city, c_state, c_country);

        for (i = 2; i < size; i++) {
            String o_add = request.getParameter("add"+i);
            String o_city = request.getParameter("city"+i);
            String o_state = request.getParameter("state"+i);
            String o_country = request.getParameter("country"+i);
            int add_id = Integer.parseInt(request.getParameter("id"+i));
            SaveDao.saveOtherAdd(add_id,o_add,o_city, o_state, o_country);
        }
        
        String n_add = request.getParameter("nlocality");
        String n_city = request.getParameter("ncity");
        String n_state = request.getParameter("nstate");
        String n_country = request.getParameter("ncountry");
        System.out.println("-------"+n_add);
        if(n_add!="" || n_city!="" || n_state!="" || n_country!="") {
            SaveDao.addOtherAdd(user_id,n_add,n_city,n_state,n_country);
        }
        String sports = request.getParameter("sports");
        String reading = request.getParameter("reading");
        String software = request.getParameter("software");
        String music = request.getParameter("music");
        String dance = request.getParameter("dance");
        String photo = request.getParameter("photo");
        String fashion = request.getParameter("fashion");
        String art = request.getParameter("art");
        String traveling = request.getParameter("traveling");
        SaveDao.saveInterest(user_id, sports, reading, software, music, dance, photo, fashion, art, traveling);
        
        out.println("<script type=\"text/javascript\">"); 
        out.println("alert('Successfully Updated');");
        out.println("</script>");
        RequestDispatcher rd = request.getRequestDispatcher("showinfo.jsp");
        rd.include(request, response);

    }

}
