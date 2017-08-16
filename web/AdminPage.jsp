<%-- 
    Document   : AdminPage
    Created on : Aug 14, 2017, 3:52:34 PM
    Author     : SHWETA
--%>

<%@page import="com.mvc.dao.AdminDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mvc.bean.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
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
            table {

                border-collapse: separate;
                white-space: nowrap;
                text-align:center;
            }
            th,td { 
                font-family:cursive;
                font-size:150%;
            }
        </style>
    </head>

    <body>
        <section class="container" >
            <div class="half bg" style="height:30%">
            </div>
            <article class="abc" style="overflow-y: scroll; overflow-x:hidden;">
                <div class="content">                    
                    <div class="wrapper">
                        <center><h1 style="font-size:130%"><u>User Details</u></h1></center>
                        <table>
                            <%
                                List<UserBean> ubl = AdminDao.showDetail();
                                HttpSession ss = request.getSession(false);
                                ss.setAttribute("user", ubl);
                                int size = 0;
                                if (ubl != null) {
                                    size = ubl.size();
                                }
                                if (size == 0) {
                            %>
                            <h1>No data to display</h1>
                            <%} else {%>

                            <tr>
                                <th>
                                    <font size="5">Name</font>
                                </th>
                                <th>
                                    <font size="5">Email</font>
                                </th>
                                <th>
                                    <font size="5">More Info</font>
                                </th>
                            </tr>

                            <%
                                for (int i = 0; i < size; i++) {
                                    UserBean ub = ubl.get(i);
                                    String name = ub.getName();
                                    String mail = ub.getMailPhone();

                            %>
                            <tr>
                                <td>
                                    <%= name%>  
                                </td> 
                                <td>
                                    <%= mail%>
                                </td>
                                <td>
                                    <a href=<%= "\"ShowAdmin.jsp?mail=" + mail + "\""%>> View Details </a>
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>

                        </table>
                    </div>                        
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
