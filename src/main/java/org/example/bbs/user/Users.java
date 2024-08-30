package org.example.bbs.user;


import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Table(name = "users")
@NoArgsConstructor
@Entity
public class Users {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long number;

    @Column
    private String id;

    @Column
    private String pw;

    @Column
    private String name;

    @Builder
    public Users(Long number,String id,String pw,String name){
        this.number=number;
        this.id=id;
        this.pw=pw;
        this.name=name;
    }

}
