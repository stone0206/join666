package com.ispan6.service.mallsystem;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan6.bean.mallsystem.ShoppingCartItem;
import com.ispan6.dao.mallsystem.ShoppingCartItemDao;



@Service
@Transactional
public class ShoppingCartItemService {
	
	private ShoppingCartItemDao shoppingCartItemDao;
	
	public void insertSCI(ShoppingCartItem shoppingCartItem) {
		shoppingCartItemDao.save(shoppingCartItem);
	}
}
