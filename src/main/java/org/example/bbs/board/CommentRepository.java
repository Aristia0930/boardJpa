package org.example.bbs.board;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment,Long> {

    List<Comment> findAllByBoardIdAndCommentId(Long boardId, Long commentId);

    List<Comment> findAllByBoardIdAndCommentIdAndState(Long boardId, Long commentId,int state);

    Comment findByReplyId(Long replyId);
}
