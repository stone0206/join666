package com.ispan6.controller.mallsystem;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ispan6.bean.mallsystem.Product;
import com.ispan6.bean.mallsystem.ProductLabel;
import com.ispan6.bean.mallsystem.ProductType;
import com.ispan6.service.mallsystem.ProductLabelService;
import com.ispan6.service.mallsystem.ProductService;
import com.ispan6.service.mallsystem.ProductTypeService;

@Controller
public class BackEndController {

	@Autowired
	private ProductService productService;
	@Autowired
	private ProductLabelService productLabelService;
	@Autowired
	private ProductTypeService productTypeService;
	
	/**
	 * 新增商品
	 * @param product
	 * @return
	 */
	@PostMapping("/insertProduct")
	public String insertProduct(Product product) {
		productService.insertProduct(product);
		return "redirect:/productBackendSet";
	}

	/**
	 * 重置整個頁面
	 * @param model
	 * @return
	 */
	@GetMapping("/productBackendSet")
	public String backEndSet(HttpSession session) {
		List<Product> products = productService.getAllProduct();
		List<ProductLabel> labels = productLabelService.findAllLabel();
		List<ProductType> types = productTypeService.findAllType();
		session.setAttribute("types", types);
		session.setAttribute("labels", labels);
		session.setAttribute("products", products);
		return "productbackend";
	}


	//待寫
	@PostMapping("/updateProduct")
	public String updateProduct(Product product) {
		productService.insertProduct(product);
		return "redirect:/productBackendSet";
	}
	
	/**
	 * 根據id刪除商品
	 * @param id
	 * @return
	 */
	@GetMapping("/deleteProduct")
	public String deleteProduct(@RequestParam Integer id) {
		productService.deleteProduct(id);
		return "redirect:/productBackendSet";
	}
	
	
	@GetMapping("/unSold")
	public String changeStatus(@RequestParam Integer id) {
		productService.updateProduct(id);
		return "redirect:/productBackendSet";
	}
}
