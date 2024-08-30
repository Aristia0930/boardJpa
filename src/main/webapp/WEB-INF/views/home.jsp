<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>

<html lang="en" data-bs-theme="auto">
<head>
    <script src="<%= request.getContextPath() %>/assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.122.0">
    <title>Main Page</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/headers/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="<%= request.getContextPath() %>/assets/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<main>


    <header class="p-3 text-bg-dark">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                    <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
                </a>

                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="<c:url value='/user' />" class="nav-link px-2 text-secondary">Home</a></li>
                    <li><a href="<c:url value='/board' />" class="nav-link px-2 text-white">게시판</a></li>
                    <li><a href="#" class="nav-link px-2 text-white">Pricing</a></li>
                    <li><a href="#" class="nav-link px-2 text-white">FAQs</a></li>
                    <li><a href="#" class="nav-link px-2 text-white">About</a></li>
                </ul>



                <div class="text-end">

                        <c:choose>
                            <c:when test="${not empty userInfo}">
                            <form action="<c:url value='/user/logout' />" method="post" style="display: inline;">
                                <button type="submit" class="btn btn-warning text-white text-decoration-none">로그아웃</button>
                            </form>
                            </c:when>
                            <c:otherwise>
                                <a href="<c:url value='/user/login' />" class="btn btn-warning text-white text-decoration-none">로그인</a>
                            </c:otherwise>
                        </c:choose>



                </div>
            </div>
        </div>
    </header>

    <div class="container mt-5">
        <div class="row">
            <div class="col-12">
                <img src="path_to_your_image.jpg" alt="Main Image" class="main-image">
            </div>
        </div>
        <div class="row main-content">
            <div class="col-12">
                <h2>사이트 개요</h2>
                <p>
                    여기에 사이트의 개요를 작성합니다. 이 섹션은 웹사이트의 목적과 주요 기능, 제공하는 서비스에 대해 설명하는 부분입니다.
                    예를 들어, 게시판의 기능, 로그인 및 회원가입 절차, 사용자가 사이트를 어떻게 활용할 수 있는지 등을 설명할 수 있습니다.
                    이 개요는 사용자가 사이트를 이해하고 효과적으로 사용할 수 있도록 돕는 역할을 합니다.
                </p>
            </div>
        </div>
    </div>
</main>
<script src="<%= request.getContextPath() %>/assets/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
