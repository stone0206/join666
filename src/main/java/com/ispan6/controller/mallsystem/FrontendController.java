package com.ispan6.controller.mallsystem;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@ResponseBody
	@GetMapping("/searchByTypeId")
	public List<Product> searchByTypeId(@RequestParam Integer id, Model model) {
		List<Product> products = productService.findByTypeId(id);
//		model.addAttribute("products", products);
		return products;
	}

	@GetMapping("/searchByLabelId")
	public String searchByLabelId(@RequestParam Integer id, Model model) {
		List<Product> products = productService.findByLabelId(id);
		model.addAttribute("products", products);
		return "productpage";
	}

	@PostMapping("/searchByHLPrice")
	public String searchByHLPrice(@RequestParam Integer lowPrice, Integer highPrice, Model model) {
		List<Product> products = productService.findAllByPrice(lowPrice, highPrice);
		model.addAttribute("products", products);
		return "productpage";
	}

	@GetMapping("/addToCart")
	@ResponseBody
	public String addToCart(@RequestParam Integer id, HttpSession session) {
		//先取得會員和商品id
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		Product product = productService.findById(id);
		Integer memberId = member.getId();

		//查詢購物車項目是否有重複（判斷方式為是不是空的）
		boolean flag = shoppingCartItemService.itemEmpty(memberId, id);
		
		//如果不是空的
		if (flag == false) {
			//先查詢是哪個用戶的哪個商品
			ShoppingCartItem shoppingCartItem = shoppingCartItemService.findByMemberIdAndProductId(memberId, id);
			//然後把數量加1再保存
			shoppingCartItem.setCount(shoppingCartItem.getCount() + 1);
			shoppingCartItemService.addToCart(shoppingCartItem);
			return "商品已存在，數量加1";
		}
		
		//如果是空的
		if (flag == true) {
			ShoppingCartItem shoppingCartItem = new ShoppingCartItem();
			shoppingCartItem.setCount(1);
			shoppingCartItem.setMemberTest(member);
			shoppingCartItem.setProduct(product);
			shoppingCartItemService.addToCart(shoppingCartItem);
			return "商品添加成功";
		}
		
		//如果都不是
		return "unexpect wrong please contact with engineer";
	}

}
