package org.example.bbs.board;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@NoArgsConstructor
@Getter
@Setter
@Table(name = "board")
public class Board {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long boardId;

    @Column
    private String title;

    @Column
    private String userName;

    @Column
    private String contents;

    @Column
    private int state;

    @Column
    private String userId;

    @Column
    private LocalDateTime created;

    @Column
    private LocalDateTime updated;

    @Column
    private LocalDateTime deleted;
}
