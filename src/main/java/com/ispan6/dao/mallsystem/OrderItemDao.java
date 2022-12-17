package com.ispan6.dao.mallsystem;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.ispan6.bean.mallsystem.OrderBean;
import com.ispan6.bean.mallsystem.OrderItems;

public interface OrderItemDao  extends JpaRepository<OrderItems, Integer>,CrudRepository<OrderItems, Integer>{

	
}
