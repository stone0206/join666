package com.ispan6.dao.mallsystem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.ispan6.bean.mallsystem.OrderBean;

public interface OrderBeanDao extends JpaRepository<OrderBean, Integer>,CrudRepository<OrderBean, Integer>{

	
	
	@Query(value = "select * from orders where o_memberid = ?1" ,nativeQuery = true)
	public List<OrderBean> findByMemberId(int id);
	
}
