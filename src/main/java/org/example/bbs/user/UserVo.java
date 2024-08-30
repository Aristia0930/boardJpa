package org.example.bbs.user;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@NoArgsConstructor
@Setter
public class UserVo {

    private Long number;
    private String id;
    private String pw;
    private String name;

    @Builder
    public UserVo(Long number, String id, String pw, String name) {
        this.number = number;
        this.id = id;
        this.pw = pw;
        this.name = name;
    }
}