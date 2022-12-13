package com.ispan6.service.mallsystem;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan6.bean.mallsystem.Product;
import com.ispan6.bean.mallsystem.ShoppingCartItem;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.dao.mallsystem.ShoppingCartItemDao;



@Service
@Transactional
public class ShoppingCartItemService {
	
	@Autowired
	private ShoppingCartItemDao shoppingCartItemDao;

	public void addToCart(ShoppingCartItem shoppingCartItem) {
		shoppingCartItemDao.save(shoppingCartItem);
	}

	public boolean itemEmpty(Integer memberId, Integer id) {
		return shoppingCartItemDao.findByMemberIdAndProductId(memberId, id).isEmpty();
		
	}

	public ShoppingCartItem findByMemberIdAndProductId(Integer memberId, Integer id) {
		return shoppingCartItemDao.findByMemberIdAndProductId(memberId, id).get(0);
	}

}
