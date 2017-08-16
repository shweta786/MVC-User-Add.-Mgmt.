<%-- 
    Document   : forgot_password
    Created on : Aug 9, 2017, 9:20:32 PM
    Author     : SHWETA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Reset Password page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/my-block-ui.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                width: 700px;
                height: 650px;
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
            body .container .half.bg {
                background-image:url("images/banner.png");
                background-size: 700px;
                background-repeat: no-repeat;
                background-position: 50% 50%;
            }
            body .container .content form {
                position: relative;
                height: 400px;
            }
            body .container .content label:first-of-type, body .container .content input:first-of-type, body .container .content .more:first-of-type {
                -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
                -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
                animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
            }
            body .container .content label:nth-of-type(2), body .container .content input:nth-of-type(2), body .container .content .more:nth-of-type(2) {
                -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
                -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
                animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
            }
            body .container .content label:nth-of-type(3), body .container .content input:nth-of-type(3), body .container .content .more:nth-of-type(3) {
                -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
                -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
                animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
            }
            body .container .content label {
                font-size: 12px;
                color: #263238;
                -moz-user-select: -moz-none;
                -ms-user-select: none;
                -webkit-user-select: none;
                user-select: none;
            }
            body .container .content label:not([for='remember']) {
                display: none;
            }
            body .container .content input.inpt {
                font-size: 14px;
                display: block;
                width: 100%;
                height: 42px;
                margin-bottom: 12px;
                padding: 16px 13px;
                color: #999999;
                border: 1px solid #d9d9d9;
                background: transparent;
                -moz-border-radius: 2px;
                -webkit-border-radius: 2px;
                border-radius: 2px;
            }
            body .container .content input.inpt::-webkit-input-placeholder {
                font-size: 14px;
                color: #999999;
                font-family: 'Lato', sans-serif;
            }
            body .container .content input.inpt:-moz-placeholder {
                font-size: 14px;
                color: #999999;
                font-family: 'Lato', sans-serif;
            }
            body .container .content input.inpt::-moz-placeholder {
                font-size: 14px;
                color: #999999;
                font-family: 'Lato', sans-serif;
            }
            body .container .content input.inpt:-ms-input-placeholder {
                font-size: 14px;
                color: #999999;
                font-family: 'Lato', sans-serif;
            }
            body .container .content input.inpt:focus {
                border-color: #999999;
            }
            body .container .content input.submit {
                font-size: 12px;
                line-height: 42px;
                display: block;
                width: 100%;
                height: 42px;
                cursor: pointer;
                vertical-align: middle;
                letter-spacing: 2px;
                text-transform: uppercase;
                color: #263238;
                border: 1px solid #263238;
                background: transparent;
                -moz-border-radius: 2px;
                -webkit-border-radius: 2px;
                border-radius: 2px;
            }
            body .container .content input.submit:hover {
                background-color: #263238;
                color: #ffffff;
                -moz-transition: all 0.2s;
                -o-transition: all 0.2s;
                -webkit-transition: all 0.2s;
                transition: all 0.2s;
            }
            body .container .content input:focus {
                outline: none;
            }
            body .container .content .checkbox {
                margin-top: 4px;
                overflow: hidden;
                clip: rect(0 0 0 0);
                width: 0;
                height: 0;
                margin: 17px -1px;
                padding: 0;
                border: 0;
                opacity: 0;
                visibility: hidden;
            }
            body .container .content .checkbox + label {
                vertical-align: middle;
                display: inline-block;
                width: 50%;
            }
            body .container .content .checkbox + label:before {
                content: "\A";
                color: #999999;
                font-family: Verdana;
                font-weight: bold;
                font-size: 8px;
                line-height: 10px;
                text-align: center;
                display: inline-block;
                vertical-align: middle;
                position: relative;
                -moz-border-radius: 2px;
                -webkit-border-radius: 2px;
                border-radius: 2px;
                background: transparent;
                border: 1px solid #d9d9d9;
                width: 11px;
                height: 11px;
                margin: -2px 8px 0 0;
            }
            body .container .content .checkbox:checked + label:before {
                content: "✓";
            }
            body .container .content .submit-wrap {
                position: absolute;
                bottom: 0;
                width: 100%;
            }
            body .container .content .submit-wrap a {
                font-size: 12px;
                display: block;
                margin-top: 20px;
                text-align: center;
                text-decoration: none;
                color: #999999;
            }
            body .container .content .submit-wrap a:hover {
                text-decoration: underline;
            }
            body .container .content .signup-cont {
                display: none;
            }

            @keyframes slideIn {
                0% {
                    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
                    opacity: 0;
                    margin-left: -320px;
                }
                100% {
                    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
                    opacity: 1;
                    margin-left: 0px;
                }
            }
            @-webkit-keyframes slideIn {
                0% {
                    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
                    opacity: 0;
                    margin-left: -320px;
                }
                100% {
                    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
                    opacity: 1;
                    margin-left: 0px;
                }
            }
            .credits {
                display: block;
                position: absolute;
                right: 0;
                bottom: 0;
                color: #999999;
                font-size: 14px;
                margin: 0 10px 10px 0;
            }
            .credits a {
                filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
                opacity: 0.8;
                color: inherit;
                font-weight: 700;
                text-decoration: none;
            }
            .form-horizontal .control-label {
                margin-bottom: 5px;
                margin-top: 35px;
                width: 540px;
                height: 35px;
            }
            .form-horizontal .form-group {
                margin-bottom: 5px;
                margin-left:0px;
                margin-right:0px;
            }
            .btn {
               height: 35px; 
               width: 540px;
               margin-top: 25px;
            }
         </style>
    </head>

    <body style="background-color: #ebebeb">
        <section class="container">
            <div class="half bg" style="height:30%">
            </div>
            <article class="half">
                <div class="content">
                    <h2 style="text-align:center">Forgot Password</h2>
                    <form action="forgotpassword" method="post" class="form-horizontal" id="formForgotPassword" data-toggle="validator" role="form">
                        <div class="form-group">
                            
                            <input class="control-label" name="inputEmail" type="email" id="inputEmail" placeholder="  Enter Email" required>
                        </div>
                        <div class="form-group">
                            <button style="width:100%" type="submit" class="btn">Send Verification Link</button>
                        </div>
                    </form>
                </div>

            </article>
        </section>
    </body>
</html>

