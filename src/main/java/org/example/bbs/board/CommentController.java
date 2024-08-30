package org.example.bbs.board;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.example.bbs.user.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    CommentService commentService;


    //댓글작성
    @PostMapping("/create")
    public String create(String contents, Long boardId, HttpServletRequest request, RedirectAttributes redirectAttributes){

        HttpSession session = request.getSession();
        Users users=(Users) session.getAttribute("userInfo");
        String referer = request.getHeader("Referer");
        if (users==null){
            redirectAttributes.addFlashAttribute("message", "로그인 해주세요");
            return "redirect:" + referer;
        }

        Comment comment = new Comment();
        comment.setBoardId(boardId);
        comment.setUserId(users.getId());
        comment.setContents(contents);
        comment.setCreated(LocalDateTime.now());
        comment.setState(1);
        comment.setUserName(users.getName());
        comment.setCommentId(0L);


        boolean check =commentService.create(comment);

        if (check) {
            redirectAttributes.addFlashAttribute("message", "댓글 작성 성공");

        } else {
            redirectAttributes.addFlashAttribute("message", "댓글 작성 실패");


        }



        // 사용자가 요청을 보낸 페이지로 리다이렉트

        return "redirect:" + referer;

    }

    //답글작성
    @PostMapping("/reply-create")
    public String replyCreate(String contents,Long replyId, Long boardId, HttpServletRequest request, RedirectAttributes redirectAttributes){

        HttpSession session = request.getSession();
        Users users=(Users) session.getAttribute("userInfo");
        String referer = request.getHeader("Referer");
        if (users==null){
            redirectAttributes.addFlashAttribute("message", "로그인 해주세요");
            return "redirect:" + referer;
        }

        Comment comment = new Comment();
        comment.setBoardId(boardId);
        comment.setUserId(users.getId());
        comment.setContents(contents);
        comment.setCreated(LocalDateTime.now());
        comment.setState(1);
        comment.setUserName(users.getName());
        comment.setCommentId(replyId);


        boolean check =commentService.create(comment);

        if (check) {
            redirectAttributes.addFlashAttribute("message", "댓글 작성 성공");

        } else {
            redirectAttributes.addFlashAttribute("message", "댓글 작성 실패");


        }



        // 사용자가 요청을 보낸 페이지로 리다이렉트

        return "redirect:" + referer;

    }

    //댓글 수정(대대글) / 삭제
    @PostMapping("/reply-modify")
    public String replyMdifye(String contents,Long replyId, Long boardId, HttpServletRequest request, RedirectAttributes redirectAttributes){

        HttpSession session = request.getSession();
        Users users=(Users) session.getAttribute("userInfo");
        String referer = request.getHeader("Referer");
        if (users==null){
            redirectAttributes.addFlashAttribute("message", "로그인 해주세요");
            return "redirect:" + referer;
        }

        Comment comment = commentService.replyMdifye(replyId);
        comment.setContents(contents);
        comment.setUpdated(LocalDateTime.now());


        boolean check =commentService.create(comment);

        if (check) {
            redirectAttributes.addFlashAttribute("message", "댓글 수정 성공");

        } else {
            redirectAttributes.addFlashAttribute("message", "댓글 수정 실패");


        }



        // 사용자가 요청을 보낸 페이지로 리다이렉트

        return "redirect:" + referer;

    }


    //댓글 삭제
    @PostMapping("/delete")
    public String delete(@RequestParam("replyId")Long replyId,
                         RedirectAttributes redirectAttributes,HttpServletRequest request) {
        HttpSession session = request.getSession();
        Users users = (Users) session.getAttribute("userInfo");
        String referer = request.getHeader("Referer");
        if (users == null) {
            redirectAttributes.addFlashAttribute("message", "로그인 해주세요");
            return "redirect:" + referer;
        }

        Comment comment = commentService.replyMdifye(replyId);
        comment.setDeleted(LocalDateTime.now());
        comment.setState(0);
        boolean check = commentService.create(comment);


        if (check) {
            redirectAttributes.addFlashAttribute("message", "댓글 삭제 성공");

        } else {
            redirectAttributes.addFlashAttribute("message", "댓글 삭제 실패");


        }
        return "redirect:" + referer;
    }


}
