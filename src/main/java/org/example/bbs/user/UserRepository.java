package org.example.bbs.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserRepository extends JpaRepository <Users,Long> {
  //갑 저장


  @Query(value = "SELECT * FROM users WHERE id = :id", nativeQuery = true)
  List<Users> findAllByIdNative(@Param("id") String id);

  @Query("select u from Users u where u.id = :id" )
  List<Users> findAllByIdNative2(@Param("id") String id);

  //아이디 중복 확인
  @Query("select count(u) from Users u where u.id=:id")
  int countById(@Param("id") String id);

  //로그인
  //계정 정보 찾기
  Users findById(String id);




}
