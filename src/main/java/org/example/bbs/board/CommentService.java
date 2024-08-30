package org.example.bbs.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class CommentService {
    @Autowired
    CommentRepository commentRepository;
    @Transactional
    public boolean create(Comment comment){
        try {
            commentRepository.save(comment);
            return true; // 저장 성공 시 true 반환
        } catch (Exception e) {
            // 예외 발생 시 false 반환
            return false;
        }

    }

//    댓글 을 조회할때 일단은
//    그 게시글 번호에 포함된 모든 댓글을 조회 댓글아이디가 0인거 조회
//    그후 새로운 댓글 리스트를 만들고
//    조회한 댓글 1번 넣기
//    조회한 댓글번호로된 대대글이 존재하면
//    새로운 댓글리스트에 넣기
//    이걸 끝날때까지 반복한다/.

    public List<Comment> commentFind(Long boardId){
        //댓글조회
        List<Comment> comments = commentRepository.findAllByBoardIdAndCommentIdAndState(boardId,0L,1);
        ArrayList<Comment> list =new ArrayList<>();

        for(int i=0; i<comments.size();i++){
            Comment comment = comments.get(i);
            list.add(comment);
            //대대글 조회
            List<Comment> commentReply = commentRepository.findAllByBoardIdAndCommentIdAndState(boardId,comment.getReplyId(),1);

            if (commentReply != null) {
            for(int j=0; j<commentReply.size();j++){
                list.add(commentReply.get(j));
            }}
        }

        return list;



    }

    public Comment replyMdifye(Long replyId) {
        return commentRepository.findByReplyId(replyId);

    }
}
