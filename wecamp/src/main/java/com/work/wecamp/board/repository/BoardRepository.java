package com.work.wecamp.board.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.work.wecamp.board.model.Board;

public interface BoardRepository extends JpaRepository<Board, Integer>{
	
	@Modifying
	@Transactional
	@Query(nativeQuery = true, value = "update Board b set b.count = b.count + 1 where b.board_no = ?1")
	int updateCount(int id);
}
