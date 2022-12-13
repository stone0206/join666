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
import com.ispan6.bean.mallsystem.ShoppingCartItem;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.service.mallsystem.ProductLabelService;
import com.ispan6.service.mallsystem.ProductService;
import com.ispan6.service.mallsystem.ProductTypeService;
import com.ispan6.service.mallsystem.ShoppingCartItemService;

@Controller
public class FrontendController {

	@Autowired
	private ProductService productService;

	@Autowired
	private ProductLabelService productLabelService;

	@Autowired
	private ProductTypeService productTypeService;
	
	@Autowired
	private ShoppingCartItemService shoppingCartItemService;
	

	@GetMapping("/product")
	public String getProduct(Model model, HttpSession session) {
		List<ProductLabel> labels = productLabelService.findAllLabel();
		List<ProductType> types = productTypeService.findAllType();
		List<Product> products = productService.getAllProduct();
		session.setAttribute("products", products);
		session.setAttribute("types", types);
		session.setAttribute("labels", labels);
		return "productpage";
	}

	@GetMapping("/priceHightToLow")
	public String priceHightToLow(Model model) {
		List<Product> productByType = productService.findAllProductOrderByPriceDesc();
		model.addAttribute("products", productByType);
		return "productpage";
	}

	@GetMapping("/priceLowToHight")
	public String priceLowToHight(Model model) {
		List<Product> productByType = productService.findAllProductOrderByPriceAsc();
		model.addAttribute("products", productByType);
		return "productpage";
	}

	@GetMapping("/searchByTypeId")
	public String searchByTypeId(@RequestParam Integer id, Model model) {
		List<Product> products = productService.findByTypeId(id);
		model.addAttribute("products", products);
		return "productpage";
	}

	@GetMapping("/searchByLabelId")
	public String searchByLabelId(@RequestParam Integer id, Model model) {
		List<Product> products = productService.findByLabelId(id);
		model.addAttribute("products", products);
		return "productpage";
	}
	
	@PostMapping("/searchByHLPrice")
	public String searchByHLPrice(@RequestParam Integer lowPrice,Integer highPrice,Model model) {
		List<Product> products = productService.findAllByPrice(lowPrice,highPrice);
		model.addAttribute("products", products);
		return "productpage";
	}
	
	@GetMapping("/addToCart")
	public String addToCart(@RequestParam Integer id,HttpSession session) {
		//抓到member
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		//抓到productid
		Product product = productService.findById(id);
		
		ShoppingCartItem sci = new ShoppingCartItem();
		sci.setCount(1);
		sci.setMemberTest(member);
		sci.setProduct(product);
		shoppingCartItemService.insertSCI(sci);
		return "product";
	}

}
