<%-- 
    Document   : showinfo
    Created on : Aug 9, 2017, 9:15:16 PM
    Author     : SHWETA
    purpose    : To show information to user who has signed in
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.mvc.bean.Address"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mvc.bean.UserBean"%>
<%@page import="com.mvc.dao.ShowInfoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Information</title>
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
            input[type=text],input[type=date],input[type=phone] {
                border:0.5px solid #ffffff; 
                height: 35px; 
                font-family:cursive; 
                font-size:110%;
            }
            input:disabled {
                background: #ffffff;
                color: #939393;
            }
            #outer
            {
                width:100%;
                text-align: center;
            }
            .inner
            {
                display: inline-block;
            }
            #heading {
                font-family: cursive;
                font-size: 130%;
            }
        </style>
    </head>
    <body style="background-color: #ebebeb">
        <section class="container" >

            <div class="half bg" style="height:30%">
            </div>
            <article class="abc" style="overflow-y: scroll; overflow-x:hidden;">
                <form method="post" id="saveform" name="saveform" action="savedetail">
                    <div class="content">                                           

                        <div style="padding-left: 60px; padding-right: 10px;"> 
                            <%
                                HttpSession ss = request.getSession(false);
                                String mail = "";
                                if (ss != null) {
                                    mail = (String) ss.getAttribute("mail");
                                }
                                UserBean ub = ShowInfoDao.basicInfo(mail);
                                ArrayList<Address> al = ub.getAl();
                                if (al == null) {
                                    ss.setAttribute("size", 0);

                                } else {
                                    ss.setAttribute("size", al.size());
                                }
                                ss.setAttribute("userbean", ub);
                                int interest[] = ub.getInterest();
                            %>

                            <fieldset>
                                <legend style="font-family:cursive; font-size: 130%;"><b>Basic Details</b></legend>
                                <p style="font-family:cursive; font-size:130%;"><b>Name:-</b>     
                                    <input type="text" id="naam" name="naam" value="<%=ub.getName()%>" style="width: 500px;" readonly disabled></p>
                                <p style="font-family:cursive; font-size:130%"><b>Email-id:-</b>  
                                    <input type="text" id="mail" name="mail" style="width:480px;" value="<%=ub.getMailPhone()%>" readonly disabled></p>
                                <p style="font-family:cursive; font-size:130%"><b>D.O.B(mm/dd/yyyy):-</b>   
                                    <input type="date" id="dob" name="dob" value="<%=ub.getDob()%>" readonly disabled>  </p>
                                <p style="font-family:cursive; font-size:130%"><b>Contact Number:-</b> 
                                    <input type="phone" id="num" name="num"  value="<%=ub.getPhone()%>" disabled></p>
                            </fieldset>
                            <br>
                            <%
                                if ((int) ss.getAttribute("size") == 0) {
                            %>
                            <fieldset>
                                <legend style="font-family:cursive; font-size:130%">
                                    <b>Permanent Address:</b><br> 
                                </legend>
                                <p style="font-family:cursive; font-size:130%">
                                    House No./Street/Locality:- <input type="text" id="add0" name="add0" style="width:700px;" 
                                                                       value=" " disabled> <br><br>
                                    Country:- <input type="text" id="country0" name="country0" style="width: 700px;" 
                                                     value="" disabled><br><br>
                                    State:- <input type="text" id="state0" name="state0" style="width: 700px;" 
                                                   value="" disabled> <br><br>
                                    City:- <input type="text" id="city0" name="city0" style="width: 700px;" 
                                                  value="" disabled>                                                                        
                                </p>
                            </fieldset>
                            <fieldset>
                                <legend style="font-family:cursive; font-size:130%">
                                    <b>Current Address:</b><br> 
                                </legend>
                                <p style="font-family:cursive; font-size:130%">
                                    House No./Street/Locality:- <input type="text" id="add1" name="add1" style="width:700px;" 
                                                                       value=" " disabled> <br><br>
                                    Country:- <input type="text" id="country1" name="country1" style="width: 700px;" 
                                                     value="" disabled> <br><br>
                                    State:- <input type="text" id="state1" name="state1" style="width: 700px;" 
                                                   value="" disabled> <br><br>
                                    City:- <input type="text" id="city1" name="city1" style="width: 700px;" 
                                                  value="" disabled>
                                                                        
                                </p>
                            </fieldset>
                            <%}
                                for (int i = 0; i < (int) ss.getAttribute("size"); i++) {
                                    Address ad = al.get(i);
                                    if (ad.add_type == "Current" || ad.add_type == "Permanent") {
                                        continue;
                                    }
                                    int id = ad.getAdd_id();
                            %>
                            <input type="hidden" name="<%="id" + Integer.toString(i)%>" value="<%=id%>">
                            <br>
                            <fieldset>
                                <legend style="font-family:cursive; font-size:130%">
                                    <b><%=ad.add_type%> Address:</b><br> 
                                </legend>
                                <p style="font-family:cursive; font-size:130%">
                                    <input name="loop" id="loop" style="display:none;">
                                    House No./Street/Locality:- <input type="text" id="<%="add" + Integer.toString(i)%>" name="<%="add" + Integer.toString(i)%>" style="width:700px;" 
                                                                       value="<%=ad.locality%>" disabled> <br><br>
                                    City:- <input type="text" id="<%="city" + Integer.toString(i)%>" name="<%="city" + Integer.toString(i)%>" style="width: 700px;" 
                                                  value="<%=ad.city%>" disabled> <br><br>
                                    State:- <input type="text" id="<%="state" + Integer.toString(i)%>" name="<%="state" + Integer.toString(i)%>" style="width: 700px;" 
                                                   value="<%=ad.state%>" disabled> <br><br>
                                    Country:- <input type="text" id="<%="country" + Integer.toString(i)%>" name="<%="country" + Integer.toString(i)%>" style="width: 700px;" 
                                                     value="<%=ad.country%>" disabled>
                                </p>
                            </fieldset>
                            <%}%> 
                            <br>
                            <input type="button" id="moreField" value="+More Address!" onclick=" moreFields()" style="display:none;">
                            <div id="container1"><p id="heading"></p>
                                <input type="button" id="cancel" value="Cancel" onclick=" cross()" style="display:none;">
                            </div>
                            <fieldset>
                                <legend style="font-family:cursive; font-size:130%;"><b>Personal Interests:-</b> </legend>
                                <p style="font-family:cursive; font-size:130%;">
                                    <input type="checkbox" id="sports" name="sports" <% if (interest[0] == 1) {
                                            out.print("checked");
                                        } %> disabled>sports &nbsp;
                                    <input type="checkbox" id="reading" name="reading" <% if (interest[1] == 1) {
                                            out.print("checked");
                                        } %> disabled>reading &nbsp;
                                    <input type="checkbox" id="software" name="software" <% if (interest[2] == 1) {
                                            out.print("checked");
                                        } %> disabled>software &nbsp;
                                    <input type="checkbox" id="music" name="music" <% if (interest[3] == 1) {
                                            out.print("checked");
                                        } %> disabled>music &nbsp; &nbsp;
                                    <input type="checkbox" id="dance" name="dance" <% if (interest[4] == 1) {
                                            out.print("checked");
                                        } %> disabled>dance &nbsp;
                                    <input type="checkbox" id="photo" name="photo" <% if (interest[5] == 1) {
                                            out.print("checked");
                                        } %> disabled>photo <br>
                                    <input type="checkbox" id="fashion" name="fashion" <% if (interest[6] == 1) {
                                            out.print("checked");
                                        } %> disabled>fashion &nbsp;
                                    <input type="checkbox" id="art" name="art" <% if (interest[7] == 1) {
                                            out.print("checked");
                                        } %> disabled>art 
                                    <input type="checkbox" id="traveling" name="traveling" <% if (interest[8] == 1) {
                                            out.print("checked");
                                        }%> disabled>traveling &nbsp;
                                </p>
                            </fieldset>
                        </div>
                    </div> 
                    <br>                        
                    <center>
                        <button type="submit" id="save" name="save" style="width:120px; display: none; 
                                height: 40px; font-family:cursive; font-size:130%" ><b>Save Info</b>
                        </button>
                    </center>

                </form>
                <br>
            </article>
            <div style="padding-top:650px;">
                <hr>
                <div id="outer">
                    <div class="inner">
                        <button id="edit" name="edit" style="width:120px;
                                height: 40px; font-family:cursive; font-size:130%;"><b>Edit Info</b>
                        </button>
                    </div>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <div class="inner">
                        <form action="logout" method="post">
                            <button id="confirm" type="submit" name="confirm" style="width:120px;
                                    height: 40px; font-family:cursive; font-size:130%"><b>LogOut</b>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>             
    </section>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script  type="text/javascript">
                                    $(document).ready(function () {
                                        $("#edit").click(function () {

                                            var num = document.getElementById("num");
                                            num.disabled = false;
                                            num.style.borderBottomColor = "grey";


                                            var loop = document.getElementsByName("loop");
                                            var len = loop.length;
                                            if (len === 0) {
                                                len = 2;
                                            }
                                            for (var i = 0; i < len; i++) {
                                                var add = document.getElementById("add" + i);
                                                add.disabled = false;
                                                add.style.borderBottomColor = "grey";

                                                var city = document.getElementById("city" + i);
                                                city.disabled = false;
                                                city.style.borderBottomColor = "grey";

                                                var state = document.getElementById("state" + i);
                                                state.disabled = false;
                                                state.style.borderBottomColor = "grey";

                                                var country = document.getElementById("country" + i);
                                                country.disabled = false;
                                                country.style.borderBottomColor = "grey";
                                            }

                                            document.getElementById("sports").disabled = false;
                                            document.getElementById("reading").disabled = false;
                                            document.getElementById("software").disabled = false;
                                            document.getElementById("music").disabled = false;
                                            document.getElementById("dance").disabled = false;
                                            document.getElementById("photo").disabled = false;
                                            document.getElementById("fashion").disabled = false;
                                            document.getElementById("art").disabled = false;
                                            document.getElementById("traveling").disabled = false;
                                            document.getElementById("moreField").style.display = "block";
                                            document.getElementById("edit").style.display = "none";
                                            document.getElementById("save").style.display = "inline-block";
                                        });
                                    });
                                    function moreFields() {
                                        document.getElementById("cancel").style.display = "inline";
                                        document.getElementById("heading").innerHTML = "Other Address:".bold();
                                        var input = document.createElement("input");
                                        input.type = "text";
                                        input.id = "nlocality";
                                        input.name = "nlocality";
                                        input.placeholder = "House no./Street/Locality";
                                        input.style.width = "700px";
                                        input.style.borderBottomColor = "grey";
                                        container1.appendChild(input);
                                        container1.appendChild(document.createElement("br"));
                                        container1.appendChild(document.createElement("br"));

                                        var input = document.createElement("input");
                                        input.type = "text";
                                        input.id = "ncountry";
                                        input.name = "ncountry";
                                        input.placeholder = "Country";
                                        input.style.borderBottomColor = "grey";
                                        input.style.width = "700px";
                                        container1.appendChild(input);
                                        container1.appendChild(document.createElement("br"));
                                        container1.appendChild(document.createElement("br"));

                                        var input = document.createElement("input");
                                        input.type = "text";
                                        input.id = "nstate";
                                        input.name = "nstate";
                                        input.placeholder = "State";
                                        input.style.borderBottomColor = "grey";
                                        input.style.width = "700px";
                                        container1.appendChild(input);
                                        container1.appendChild(document.createElement("br"));
                                        container1.appendChild(document.createElement("br"));

                                        var input = document.createElement("input");
                                        input.type = "text";
                                        input.id = "ncity";
                                        input.name = "ncity";
                                        input.placeholder = "City";
                                        input.style.borderBottomColor = "grey";
                                        input.style.width = "700px";
                                        container1.appendChild(input);
                                        container1.appendChild(document.createElement("br"));
                                        container1.appendChild(document.createElement("br"));
                                        document.getElementById("moreField").style.display = "none";
                                    }
                                    function cross() {
                                        document.getElementById("heading").style.display = "none";
                                        document.getElementById("nlocality").style.display = "none";
                                        document.getElementById("ncity").style.display = "none";
                                        document.getElementById("nstate").style.display = "none";
                                        document.getElementById("ncountry").style.display = "none";
                                        document.getElementById("cancel").style.display = "none";
                                        document.getElementById("container1").style.display = "none";
                                    }
    </script>
</body>
</html>