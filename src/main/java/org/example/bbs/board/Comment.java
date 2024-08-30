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
@Table(name = "comment")
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long replyId;

    @Column
    private Long boardId;

    @Column
    private Long commentId;

    @Column
    private String userId;

    @Column
    private String contents;

    @Column
    private String userName;

    @Column
    private int state;

    @Column
    private String commentUserId;

    @Column
    private LocalDateTime created;

    @Column
    private LocalDateTime updated;

    @Column
    private LocalDateTime deleted;
}
