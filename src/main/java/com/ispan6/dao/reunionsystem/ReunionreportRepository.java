package com.ispan6.dao.reunionsystem;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import com.ispan6.bean.mallsystem.ShoppingCartItem;
import com.ispan6.bean.reunionsystem.Reunion;
import com.ispan6.bean.reunionsystem.Reunionreport;

public interface ReunionreportRepository extends JpaRepository<Reunionreport, Integer>,CrudRepository<Reunionreport, Integer>{

	
//	@Query("from reunionreport order by reunionreportid")
//	public List<Reunionreport> orderByrReunionreportid();
	
	
	@Transactional
	@Modifying
	@Query(value = "delete from Reunionreport where reunionid = ?1")
	public void deleteReunionreportById(Integer id);
	
	
	
}
