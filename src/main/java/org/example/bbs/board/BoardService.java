package org.example.bbs.board;

import jakarta.servlet.http.HttpSession;
import org.example.bbs.user.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BoardService {

    @Autowired
    BoardRepository boardRepository;


    //게시글 작성
    @Transactional
    public boolean createContent(Board board) {
        try {
            boardRepository.save(board);
            return true; // 저장 성공 시 true 반환
        } catch (Exception e) {
            // 예외 발생 시 false 반환
            return false;
        }
    }

    //목록조회
    public List<Board> list(){
        return boardRepository.findByState(1);
    }

    //게시글 내용 조히회
    public Board viewPost(Long boardId){
        return boardRepository.findByBoardId(boardId);
    }

    //게시글 수정 삭제 가능한지 본인확인 절차
    public boolean postCheck(HttpSession session,Board board){
        Users users = (Users)session.getAttribute("userInfo") ;
        if (users == null) {
            return false;
        }
        if((users.getId()).equals(board.getUserId())){
            return true;
        }
        else{
            return false;
        }

    }

    //게시글 수정/삭제
    @Transactional
    public boolean editPage(Board board) {
        try {
            boardRepository.save(board);
            return true; // 저장 성공 시 true 반환
        } catch (Exception e) {
            // 예외 발생 시 false 반환
            return false;
        }
    }



}
