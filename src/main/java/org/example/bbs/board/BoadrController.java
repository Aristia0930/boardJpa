package org.example.bbs.board;

import jakarta.servlet.http.HttpSession;
import org.example.bbs.user.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoadrController {

    @Autowired
    BoardService boardService;

    @Autowired
    CommentService commentService;

    //게시판 페이지 진입
    @GetMapping("")
    public String boardMain(Model model){
        model.addAttribute("LIST",boardService.list());

        return "board";
    }

    //게시글작성페이지로
    @GetMapping("/create")
    public String create(){
        return "create";
    }

    //게시글 작성
    @PostMapping("/create-content")
    public String createContent(String title, String contents, HttpSession session, RedirectAttributes redirectAttributes){
        Board board = new Board();
        board.setTitle(title);
        board.setContents(contents);
        Users users=(Users) session.getAttribute("userInfo");
        board.setUserName(users.getName());
        board.setUserId(users.getId());
        board.setState(1);
        board.setCreated(LocalDateTime.now());
        boolean check =boardService.createContent(board);
        if (check){
            return "redirect:/board";
        }
        else {
            redirectAttributes.addFlashAttribute("create", "게시글 등록 실패");
            return "redirect:/board";

        }



    }

    //게시글 확인
    @GetMapping("/view")
    public String viewPost(
            @RequestParam("boardId") Long boardId,
            Model model,HttpSession session) {

        //보더 아이디로 게시글  내용 조회 하기
        Board board = boardService.viewPost(boardId);

        //세션의 정보 확인 절차

        boolean check=boardService.postCheck(session,board);

        //댓글 조회
        List<Comment> comments = commentService.commentFind(boardId);

        Users users =(Users)session.getAttribute("userInfo");

        if (users!=null){
            model.addAttribute("userid",users.getId());
        }

        // 받은 파라미터를 사용한 로직 작성
        model.addAttribute("Board", board);
        model.addAttribute("check",check);
        model.addAttribute("comments",comments);


        return "viewPost"; // viewPost.jsp로 데이터 전달
    }

    //게시글 수정페이지로 진입
    @GetMapping("/edit")
    public String editPage(@RequestParam("boardId")Long boardId,
                           Model model){
        Board board = boardService.viewPost(boardId);

        model.addAttribute("Board", board);
        return "editPage";
    }

    //게시글 수정
    @PostMapping("/edit-post")
    public String editPost(String title, String contents,Long boardId, HttpSession session, RedirectAttributes redirectAttributes) {
        Board board = boardService.viewPost(boardId);
        board.setTitle(title);
        board.setContents(contents);
        board.setUpdated(LocalDateTime.now());
        boolean check = boardService.editPage(board);
        if (check) {
            redirectAttributes.addFlashAttribute("create", "게시글 수정 성공");
            return "redirect:/board";
        } else {
            redirectAttributes.addFlashAttribute("create", "게시글 수정 실패");
            return "redirect:/board";

        }
    }

        //게시글 삭제
        @PostMapping("/delete")
        public String delete(@RequestParam("boardId")Long boardId,
                             RedirectAttributes redirectAttributes){

            Board board = boardService.viewPost(boardId);
            board.setDeleted(LocalDateTime.now());
            board.setState(0);
            boolean check = boardService.editPage(board);


            if (check) {
                redirectAttributes.addFlashAttribute("create", "게시글 삭제 성공");
                return "redirect:/board";
            } else {
                redirectAttributes.addFlashAttribute("create", "게시글 삭제 실패");
                return "/board";

            }
        }






}
