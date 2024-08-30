<%--
  Created by IntelliJ IDEA.
  User: kjk98
  Date: 2024-08-10
  Time: 오전 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시글 작성</title>
  <script src="<%= request.getContextPath() %>/assets/board.js"></script>
  <link href="<%= request.getContextPath() %>/assets/dist/css/board.css" rel="stylesheet">
  <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/headers/">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
  <link href="<%= request.getContextPath() %>/assets/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
  <c:if test="${empty userInfo}">
    <script type="text/javascript">
      window.location.href = "/board"; // 유저 정보가 없으면 /board로 이동
    </script>
  </c:if>
<header class="p-3 text-bg-dark">
  <div class="container">
    <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
      <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
      </a>

      <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
        <li><a href="<c:url value='/user' />" class="nav-link px-2 text-white">Home</a></li>
        <li><a href="<c:url value='/board' />" class="nav-link px-2 text-secondary">게시판</a></li>
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

<div class="container">
  <h1>게시글 작성</h1>
  <form id="create-post-form" name="create" action="/board/create-content" method="post">
    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" id="title" name="title" required>
    </div>
    <div class="form-group">
      <label for="content">내용</label>
      <textarea id="content" name="contents" required></textarea>
    </div>
    <button type="submit" class="btns">작성하기</button>
  </form>
</div>

<script src="<%= request.getContextPath() %>/assets/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>