package com.ispan6.dao.mallsystem;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.ispan6.bean.mallsystem.OrderBean;

public interface OrderBeanDao extends JpaRepository<OrderBean, Integer>,CrudRepository<OrderBean, Integer>{
	
}
