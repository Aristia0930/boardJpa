package org.example.bbs.user;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    UserRepository userRepository;

    //회원가입
    public boolean signupOK(UserVo userVo) {
        //아이디 중복확인

        if(userRepository.countById(userVo.getId())>0){
            System.out.println("이미 존재함");
            return false;
        }
        Users userEntity = Users.builder()
                .number(userVo.getNumber())
                .id(userVo.getId())
                .pw(userVo.getPw())
                .name(userVo.getName())
                .build();

        userRepository.save(userEntity);
        return true;
    }

    //로그인
    public int loginOk(UserVo userVo, HttpSession session){
        String id= userVo.getId();
        Users users=userRepository.findById(id);

        if (users == null) {
            return 3; // 유저 정보가 없는 경우
        }

        if (userVo.getPw().equals(users.getPw())) {
            session.setAttribute("userInfo",users);
            session.setMaxInactiveInterval(60*30);

            System.out.println("로그인 성공");
            return 1; // 로그인 성공
        } else {
            return 2; // 비밀번호가 틀린 경우
        }



    }

}
