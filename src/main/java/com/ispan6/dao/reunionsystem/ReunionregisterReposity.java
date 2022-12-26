package com.ispan6.dao.reunionsystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.ispan6.bean.reunionsystem.Register;

public interface ReunionregisterReposity extends JpaRepository<Register,Integer>,CrudRepository<Register, Integer>{

	@Query(value = "select * from register where reunionid = ?1 and memberid = ?2",nativeQuery = true)
	List<Register> findRegisterByReunionidAndMemberid(Integer reunionid, Integer memberid);
}
