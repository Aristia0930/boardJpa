package org.example.bbs.board;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BoardRepository extends JpaRepository<Board,Long> {


    Board findByBoardId(Long boardId);

    List<Board> findByState(int state);
}
