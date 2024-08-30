<%--
  Created by IntelliJ IDEA.
  User: kjk98
  Date: 2024-08-08
  Time: 오전 12:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <script src="<%= request.getContextPath() %>/assets/board.js"></script>
    <link href="<%= request.getContextPath() %>/assets/dist/css/board.css" rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/headers/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="<%= request.getContextPath() %>/assets/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
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
    <h1 class="board-text">게시판</h1>

    <div class="actions">
        <a href="#" class="btns" onclick="createBoard()">글 작성하기</a>
    </div>
    <table>
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
        </tr>
        </thead>
        <tbody id="post-list">
        <!-- 게시글 목록이 여기에 추가됩니다 -->
        <c:forEach var="post" items="${LIST}">

            <tr onclick="viewPost(${post.boardId})">

                <td>${post.boardId}</td>
                <td>${post.title}</td>
                <td>${post.userName}</td>
                <td>${post.created}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="<%= request.getContextPath() %>/assets/dist/js/bootstrap.bundle.min.js"></script>
<script>
        // Retrieve the flash message from the server-side
        var message ="${create}";

        if (message) {
            alert(message);

        }
    function createBoard(){
        var info="${userInfo}";
        if(info){
            window.location.href = "/board/create";

        }
        else{
            alert("로그인해주세요")
        }


    }

    function viewPost(boardId) {
        window.location.href = "/board/view?boardId="+boardId;
    }
</script>
</body>

</html>