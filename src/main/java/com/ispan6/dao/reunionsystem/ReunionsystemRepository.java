package com.ispan6.dao.reunionsystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.ispan6.bean.reunionsystem.Reunion;

public interface ReunionsystemRepository extends JpaRepository<Reunion, Integer> {

//	@Query("from WorkMessages where text=?1")
//	public List<Reunion> findMsgByText(String text);
//
//	@Query("from WorkMessages where text=:t")
//	public List<Reunion> findMsgByText2(@Param("t") String text);
//
//	@Query(value = "select * from WorkMessages where text = :t", nativeQuery = true)
//	public List<Reunion> findMsgByTextNative(@Param("t") String text);
//
//	@Query(value = "from WorkMessages where text like %?1% ")
//	public List<Reunion> findMsgLikeText(String text);
//
//	@Query(value = "from WorkMessages where text like %:t% ")
//	public List<Reunion> findMsgLikeText2(@Param("t") String text);
//
//	@Transactional
//	@Modifying
//	@Query(value = "delete from WorkMessages where id = ?1")
//	public void deleteMsgById(Integer id);
//
//	public List<Reunion> findByTextOrderByAdded(String text);
//
//	// 來源:https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#appendix.query.method.predicate
//	public List<Reunion> findByTextContainingOrderByAdded(String text);
//
//	public Reunion findFirstByOrderByAddedDesc();
}
