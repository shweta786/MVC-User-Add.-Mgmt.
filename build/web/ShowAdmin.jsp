<%-- 
    Document   : ShowAdmin
    Created on : Aug 15, 2017, 1:05:51 AM
    Author     : SHWETA
--%>

<%@page import="com.mvc.bean.Address"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.mvc.bean.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Info</title>
        <style>
            @import url(https://fonts.googleapis.com/css?family=Lato:400,700);
            * {
                -moz-box-sizing: border-box;
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;
                text-rendering: optimizeLegibility;
            }
            body {
                font-family: 'Lato', sans-serif;
                background-color: #f8f8f8;
            }
            body .container {
                position: relative;
                overflow: hidden;
                width: 1000px;
                height: 720px;
                margin: 38px auto 0;
                background-color: #ffffff;
                -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
                -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
                box-shadow: rgba(0, 0, 0, 0.1) 0px 20px 60px;
            }
            body .container .half {
                float: left;
                width: 100%;
                height: 50%;
                padding: 10px 80px 0;
            }
            body .container .abc {
                float: left;
                width: 100%;
                height: 60%;
                padding: 10px 80px 0;
            }
            body .container .half.bg {
                background-image:url("images/banner2.jpg");
                background-size: 1000px;
                background-repeat: no-repeat;
                background-position: 50% 50%;
            }
        </style>
    </head>
    <body>
        <section class="container">
            <div class="half bg" style="height:30%">
            </div>
            <article class="abc" style="overflow-y: scroll; overflow-x:hidden;">
                <div class="content">                    
                    <div class="wrapper">
                        <%
                            HttpSession ss = request.getSession(false);
                            List<UserBean> ubl = (ArrayList<UserBean>) ss.getAttribute("user");
                            String mail = request.getParameter("mail");
                            UserBean ub = null;
                            int user_id = 0;
                            for (int i = 0; i < ubl.size(); i++) {
                                if ((ubl.get(i).getMailPhone()).equals(mail)) {
                                    ub = ubl.get(i);
                                    user_id = ub.getUser_id();
                                }
                            }
                            String interest1 = "";
                            List<Address> ad = ub.getAl();
                            int[] interest = ub.getInterest();
                            if (interest[0] == 1) {
                                interest1 = interest1 + "sports  ";
                            }
                            if (interest[1] == 1) {
                                interest1 = interest1 + "reading  ";
                            }
                            if (interest[2] == 1) {
                                interest1 = interest1 + "software  ";
                            }
                            if (interest[3] == 1) {
                                interest1 = interest1 + "music  ";
                            }
                            if (interest[4] == 1) {
                                interest1 = interest1 + "dance  ";
                            }
                            if (interest[5] == 1) {
                                interest1 = interest1 + "photo  ";
                            }
                            if (interest[6] == 1) {
                                interest1 = interest1 + "fashion  ";
                            }
                            if (interest[7] == 1) {
                                interest1 = interest1 + "art  ";
                            }
                            if (interest[8] == 1) {
                                interest1 = interest1 + "traveling";
                            }

                        %>

                        <p style="font-family:cursive; font-size:150%"><b>Name:-</b> <%= ub.getName()%></p>
                        <p style="font-family:cursive; font-size:150%"><b>Gender:-</b> <%= ub.getGender()%></p>
                        <p style="font-family:cursive; font-size:150%"><b>D.O.B(yyyy-mm-dd):-</b> <%= ub.getDob()%></p>
                        <p style="font-family:cursive; font-size:150%"><b>Email-id:-</b> <%= ub.getMailPhone()%></p>                        
                        <p style="font-family:cursive; font-size:150%"><b>Contact No.:-</b> <%= ub.getPhone()%></p>
                        <p style="font-family:cursive; font-size:150%"><b>Interest:-</b> <%= interest1%></p>
                        <%
                            for (int i = 0; ad != null && i < ad.size(); i++) {
                                Address add = ad.get(i);
                        %>
                        <p style="font-family:cursive; font-size:150%"><b><%= add.getAdd_type()%> Address:-</b> <%= add.getLocality()%>, &nbsp;<%= add.getCity()%>, &nbsp;<%= add.getState()%>, &nbsp;<%= add.getCountry()%> </p>
                        <%
                            }
                        %>
                    </div>
                    <center>
                        <form method="get" action="admin">
                            <input type="hidden" name="user_id" value=<%= user_id%>>
                            <button value="a" id="a" name="a" type="submit"style="display: inline-block; width:120px;
                                    height: 40px; font-family:cursive; font-size:130%" >
                                <b>Activate</b>
                            </button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button value="d" id="d" name="d" type="submit"style="display: inline-block; width:120px;
                                    height: 40px; font-family:cursive; font-size:130%" >
                                <b>Deactivate</b>
                            </button>
                        </form>
                    </center>
                </div>
            </article>
            <center>
                <form action="logout" method="post">
                    <button id="confirm" type="submit" name="confirm" style="width:120px;
                            height: 40px; font-family:cursive; font-size:130%"><b>LogOut</b>
                    </button>
                </form>
            </center>
        </section>
    </body>
</html>
