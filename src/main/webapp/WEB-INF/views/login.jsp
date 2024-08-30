<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
    <script src="<%= request.getContextPath() %>/assets/js/login.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.122.0">
    <title>Main Page</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/headers/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="<%= request.getContextPath() %>/assets/dist/css/login.css" rel="stylesheet">

</head>
<body>
<main>
<div class="cotn_principal">



    <div class="cont_centrar">

        <div class="cont_login">
            <div class="cont_info_log_sign_up">
                <div class="col_md_login">
                    <div class="cont_ba_opcitiy">

                        <h2>LOGIN</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        <button class="btn_login" onclick="change_to_login()">LOGIN</button>
                    </div>
                </div>
                <div class="col_md_sign_up">
                    <div class="cont_ba_opcitiy">
                        <h2>SIGN UP</h2>


                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>

                        <button class="btn_sign_up" onclick="change_to_sign_up()">SIGN UP</button>
                    </div>
                </div>
            </div>


            <div class="cont_back_info">
                <div class="cont_img_back_grey">
                    <img src="https://images.unsplash.com/42/U7Fc1sy5SCUDIu4tlJY3_NY_by_PhilippHenzler_philmotion.de.jpg?ixlib=rb-0.3.5&q=50&fm=jpg&crop=entropy&s=7686972873678f32efaf2cd79671673d" alt="" />
                </div>

            </div>
            <div class="cont_forms" >
                <div class="cont_img_back_">
                    <img src="https://images.unsplash.com/42/U7Fc1sy5SCUDIu4tlJY3_NY_by_PhilippHenzler_philmotion.de.jpg?ixlib=rb-0.3.5&q=50&fm=jpg&crop=entropy&s=7686972873678f32efaf2cd79671673d" alt="" />
                </div>
                <form name="loginForm" action="/user/loginCheck" method="post" onsubmit="return validateForm()">
                <div class="cont_form_login">
                    <a href="#" onclick="hidden_login_and_sign_up()"  ><i class="material-icons"  >&#xE5C4;</i></a>
                    <h2>LOGIN</h2>
                    <input type="text" name="id" placeholder="id" required  />
                    <input  type="password" name="pw" placeholder="Password" required />
                    <button class="btn_login" onclick="change_to_login()">LOGIN</button>
                </div></form>

                <form name="signUpForm" action="/user/signUp" method="post" onsubmit="return validateForm()">
                <div class="cont_form_sign_up">
                    <a href="#" onclick="hidden_login_and_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
                    <h2>SIGN UP</h2>
                    <input type="text" name="id" placeholder="id" required />
                    <input type="text" name="name" placeholder="User" required />
                    <input type="password" name="pw" placeholder="Password" required />
                    <input type="password" name="confirmPassword" placeholder="Confirm Password" required />
                    <button type="submit" class="btn_sign_up">SIGN UP</button>

                </div> </form>

            </div>

        </div>
    </div>
</div>

<script src="<%= request.getContextPath() %>/assets/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function validateForm() {
            var password = document.forms["signUpForm"]["pw"].value;
            var confirmPassword = document.forms["signUpForm"]["confirmPassword"].value;
            if (password != confirmPassword) {
                alert("Passwords do not match.");
                return false;
            }
            return true;
        }

        window.onload = function() {
            var check = "${check}";
            var value= "${error}";
            if (check === "false") {
                alert("아이디가 중복되었습니다.");
            }
            else if(check=="true"){
                alert("회원가입 성공")
            }

            if(value){
                alert(value)
            }
        }
    </script>

</main>
</body>
</html>