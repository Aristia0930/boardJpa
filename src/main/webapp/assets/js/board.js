document.addEventListener('DOMContentLoaded', function () {
    // 게시글 목록을 불러오는 함수
    function loadPosts() {
        const postList = document.getElementById('post-list');
        // 임시 데이터
        const posts = [
            { id: 1, title: '첫 번째 게시글', author: '작성자1', date: '2024-08-07' },
            { id: 2, title: '두 번째 게시글', author: '작성자2', date: '2024-08-07' }
        ];

        posts.forEach(post => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${post.id}</td>
                <td><a href="view.html?id=${post.id}">${post.title}</a></td>
                <td>${post.author}</td>
                <td>${post.date}</td>
            `;
            postList.appendChild(row);
        });
    }

    // 게시글 작성 폼 제출 처리
    const createPostForm = document.getElementById('create-post-form');
    if (createPostForm) {
        createPostForm.addEventListener('submit', function (e) {
            e.preventDefault();
            const title = document.getElementById('title').value;
            const author = document.getElementById('author').value;
            const content = document.getElementById('content').value;
            // 게시글 저장 로직 추가
            alert('게시글이 작성되었습니다!');
            window.location.href = 'board.html';
        });
    }

    // 게시글 상세보기 페이지 로드
    const viewPost = document.getElementById('post');
    if (viewPost) {
        const params = new URLSearchParams(window.location.search);
        const postId = params.get('id');
        // 게시글 로드 로직 추가 (임시 데이터 사용)
        const post = { id: postId, title: '첫 번째 게시글', author: '작성자1', content: '내용입니다.', date: '2024-08-07' };
        document.getElementById('post-title').textContent = post.title;
        document.getElementById('post-author').textContent = `작성자: ${post.author}`;
        document.getElementById('post-content').textContent = post.content;
        document.getElementById('post-date').textContent = `작성일: ${post.date}`;

        // 수정하기 버튼 링크 설정
        const editButton = document.getElementById('edit-button');
        if (editButton) {
            editButton.href = `edit.html?id=${post.id}`;
        }

        // 삭제하기 버튼 클릭 이벤트
        const deleteButton = document.getElementById('delete-button');
        if (deleteButton) {
            deleteButton.addEventListener('click', function () {
                // 삭제 로직 추가
                alert('게시글이 삭제되었습니다!');
                window.location.href = 'board.html';
            });
        }
    }

    // 게시글 목록 로드
    loadPosts();
});
