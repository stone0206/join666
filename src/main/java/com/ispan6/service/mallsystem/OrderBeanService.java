package com.ispan6.service.mallsystem;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan6.bean.mallsystem.OrderBean;
import com.ispan6.dao.mallsystem.OrderBeanDao;

@Service
@Transactional
public class OrderBeanService {

	@Autowired
	private OrderBeanDao orderBeanDao;

	public void save(OrderBean orderBean) {
		orderBeanDao.save(orderBean);
	}

	public List<OrderBean> findByMemberId(int id) {
		return orderBeanDao.findByMemberId(id);
	}

	
}
