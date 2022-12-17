package com.ispan6.service.mallsystem;

import java.util.List;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.ispan6.bean.mallsystem.Product;
import com.ispan6.dao.mallsystem.ProductDAO;

@Service
@Transactional
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	public List<Product> getAllProduct() {
		return productDAO.findAll();
	}
	
	public void insertProduct(Product product) {
		productDAO.save(product);
	}
	
	public void deleteProduct(Integer id) {
		productDAO.deleteById(id);
	}

	public void updateProduct(Integer id) {
		 Product product = productDAO.findById(id).get();
		 product.setStatus(1);
		 productDAO.save(product);
	}

	public List<Product> findByTypeId(Integer id) {
		return productDAO.findByTypeId(id);
	}

	public List<Product> findByLabelId(Integer id) {
		return productDAO.findByLabelId(id);
	}

	public List<Product> findAllProductOrderByPriceDesc() {
		return productDAO.orderByPriceDesc();
	}

	public List<Product> findAllProductOrderByPriceAsc() {
		return productDAO.orderByPriceAsc();
	}

	public List<Product> findAllByPrice(Integer lowPrice, Integer highPrice) {
		return productDAO.findByPriceBetween(lowPrice, highPrice);
	}

	public Product findById(Integer id) {
		 Optional<Product> product = productDAO.findById(id);
		 if(product.isPresent()) {
			 return product.get();
		 }
		 return null;
	}

	public List<Product> getAllProductOnSell() {
		return productDAO.getAllProductOnSell();
	}
	
	
	
	



	
}
