package org.example.bbs.user;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @GetMapping("")
    public  String main(){


        return "home";

    }


    //로그인 페이지로
    @GetMapping("/login")
    public String showRegistrationPage() {
        return "login"; // JSP 파일명 (login.jsp)
    }

    //회원가입
    @PostMapping("/signUp")
    public String signupOK(UserVo userVo, Model model){
        boolean check=userService.signupOK(userVo);
        if (check){
            model.addAttribute("check","true");
            return "login";
        }
        else{
            model.addAttribute("check","false");


            return "login";
        }

    }

    //로그인

    @PostMapping("/loginCheck")
    public String loginOk(UserVo userVo, RedirectAttributes redirectAttributes, HttpSession session) {
        int loginResult = userService.loginOk(userVo,session);
        if (loginResult == 1) {
            //세션 방식으로 로그인 정보 저장

            return "redirect:/user"; // 로그인 성공 시 /home으로 리다이렉트
        } else if (loginResult == 2) {
            redirectAttributes.addFlashAttribute("error", "Invalid password.");
            return "redirect:/user/login"; // 비밀번호가 틀린 경우
        } else {
            redirectAttributes.addFlashAttribute("error", "User not found.");
            return "redirect:/user/login"; // 유저 정보가 없는 경우
        }
    }

    //로그아웃
    @PostMapping("/logout")
    public String logout(HttpServletRequest request){
        //세션 삭제
        HttpSession session = request.getSession(false);

        if(session !=null){
            session.invalidate();
        }

        return "redirect:/user";
    }





}
