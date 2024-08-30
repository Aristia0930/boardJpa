<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 보기</title>
    <link href="<%= request.getContextPath() %>/assets/dist/css/viewPost.css?after" rel="stylesheet">
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
                <li><a href='/user' class="nav-link px-2 text-white">Home</a></li>
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
<div class="containers">
    <div class="post-header">
        <h2 id="post-title">${Board.title}</h2>
        <c:if test="${check}">
            <div class="actions">
                <button class="btns" id="edit-button" onclick="edit(${Board.boardId})">수정하기</button>
                <button class="btns" id="delete-button" onclick="deleteClick(${Board.boardId})">삭제하기</button>
            </div>
        </c:if>

    </div>
    <div class="post-info">
        <p id="post-author">작성자: ${Board.userName}</p>
        <p id="post-date">작성날짜: ${Board.created}</p>
    </div>
    <div id="contentdiv">
        <p id="post-content">${Board.contents}</p>
    </div>

    <!-- 댓글 섹션 -->
    <div id="comments-section">
        <h3>댓글</h3>
        <!-- 댓글 작성 폼 -->
        <form class="comment-form" name="comment" action="/comment/create" method="post">
            <textarea name="contents" id="comment-content" rows="4" placeholder="댓글을 입력하세요..."></textarea>
            <div class="comment-submit-container">
                <button type="submit" class="submit-comment">댓글 작성</button>
            </div>
            <input type="hidden" name="boardId" value="${Board.boardId}">
        </form>

        <!-- 기존 댓글 목록 -->
        <div class="comment">
            <c:forEach var="comment" items="${comments}">

                <c:if test="${comment.commentId ==0}">
            <div class="comment">


                <p class="comment-author">작성자: ${comment.userName}</p>
                <p class="comment-content">${comment.contents}</p>

                <div class="comment-submit-container">
                    <button class="reply-btn" >답글</button>
                <c:if test="${userid==comment.userId}">
                    <button class="replys-btn" >수정하기</button>
                    <button class="deletes-button"   onclick="commentdeleteClick(${comment.replyId})">삭제하기</button>
                </c:if>
                </div>




                <form class="reply-form" style="display:none;" name="reply" action="/comment/reply-create" method="post">
                    <textarea name="contents" rows="4" placeholder="댓글을 입력하세요..."></textarea>
                    <input type="hidden" name="boardId" value="${Board.boardId}">
                    <input type="hidden" name="replyId" value="${comment.replyId}">
                    <div class="comment-submit-container">
                    <button class="submit-comment">답글 작성</button>
                    </div>
                </form>

                <form class="replys-form" style="display:none;" name="reply" action="/comment/reply-modify" method="post">
                    <textarea name="contents" rows="4" placeholder="${comment.contents}"></textarea>
                    <input type="hidden" name="boardId" value="${Board.boardId}">
                    <input type="hidden" name="replyId" value="${comment.replyId}">
                    <div class="comment-submit-container">
                        <button class="submit-comment">답글 수정</button>
                    </div>
                </form>




                <!-- 대댓글 -->

            </div></c:if>
                <c:if test="${comment.commentId !=0}">
                <div class="reply">
                    <p class="comment-author">작성자:${comment.userName}</p>
                    <p class="comment-content">${comment.contents}</p>
                    <div class="comment-submit-container">
                    <c:if test="${userid==comment.userId}">
                        <button class="replyss-btn" >수정하기</button>
                        <button class="deletes-button"   onclick="commentdeleteClick(${comment.replyId})")">삭제하기</button>
                    </c:if>
                    </div>

                    <form class="replyss-form" style="display:none;" name="reply" action="/comment/reply-modify" method="post">
                        <textarea name="contents" rows="4" placeholder="${comment.contents}"></textarea>
                        <input type="hidden" name="boardId" value="${Board.boardId}">
                        <input type="hidden" name="replyId" value="${comment.replyId}">
                        <div class="comment-submit-container">
                            <button class="submit-comment">답글 수정</button>
                        </div>
                    </form>

                </div>




                </c:if>
            </c:forEach>
        </div>
    </div>
</div>
<script src="<%= request.getContextPath() %>/assets/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 모든 답글 버튼에 대해 클릭 이벤트 리스너 추가
        const replyButtons = document.querySelectorAll('.reply-btn');

        replyButtons.forEach(button => {
            button.addEventListener('click', function() {
                // 현재 버튼과 같은 댓글 내의 답글 작성 폼을 찾기
                const commentDiv = this.closest('.comment');
                const replyForm = commentDiv.querySelector('.reply-form');

                if (replyForm.style.display === "none") {
                    this.textContent = "답글 작성 취소";

                    replyForm.style.display = "block"; // 폼을 표시
                } else {
                    this.textContent = "답글";
                    replyForm.style.display = "none"; // 폼을 숨김
                }
            });
        });
    });

    document.addEventListener('DOMContentLoaded', function() {
        // 모든 답글 버튼에 대해 클릭 이벤트 리스너 추가
        const replyButtons = document.querySelectorAll('.replys-btn');

        replyButtons.forEach(button => {
            button.addEventListener('click', function() {
                // 현재 버튼과 같은 댓글 내의 답글 작성 폼을 찾기
                const commentDiv = this.closest('.comment');
                const replyForm = commentDiv.querySelector('.replys-form');

                if (replyForm.style.display === "none") {
                    this.textContent = "답글 수정 취소";

                    replyForm.style.display = "block"; // 폼을 표시
                } else {
                    this.textContent = "답글 수정";
                    replyForm.style.display = "none"; // 폼을 숨김
                }
            });
        });
    });

    document.addEventListener('DOMContentLoaded', function() {
        // 모든 답글 버튼에 대해 클릭 이벤트 리스너 추가
        const replyButtons = document.querySelectorAll('.replyss-btn');

        replyButtons.forEach(button => {
            button.addEventListener('click', function() {
                // 현재 버튼과 같은 댓글 내의 답글 작성 폼을 찾기
                const commentDiv = this.closest('.reply');
                const replyForm = commentDiv.querySelector('.replyss-form');

                if (replyForm.style.display === "none") {
                    this.textContent = "답글 수정 취소";

                    replyForm.style.display = "block"; // 폼을 표시
                } else {
                    this.textContent = "답글 수정";
                    replyForm.style.display = "none"; // 폼을 숨김
                }
            });
        });
    });

    var message ="${message}";

    if (message) {
        alert(message);

    }

    function edit(boardId){
        window.location.href = "/board/edit?boardId="+boardId;

    }

    function deleteClick(boardId) {
        if (confirm("정말로 삭제하시겠습니까?")) {
            fetch("/board/delete?boardId=" + boardId, {
                method: "POST"
            })
                .then(response => {
                    if (response.redirected) {
                        alert("게시글 삭제 성공");
                        window.location.href = response.url;
                    } else {
                        alert("게시글 삭제 실패");
                    }
                })
                .catch(error => console.error('Error:', error));
        }
    }

    function commentdeleteClick(replyId) {
        if (confirm("정말로 삭제하시겠습니까?")) {
            fetch("/comment/delete?replyId=" + replyId, {
                method: "POST"
            })
                .then(response => {
                    if (response.redirected) {
                        alert("댓글 삭제 성공");
                        window.location.href = response.url;
                    } else {
                        alert("댓글 삭제 실패");
                    }
                })
                .catch(error => console.error('Error:', error));
        }
    }


</script>
</body>
</html>
