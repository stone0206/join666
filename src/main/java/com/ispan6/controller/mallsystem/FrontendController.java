package com.ispan6.controller.mallsystem;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan6.bean.mallsystem.OrderBean;
import com.ispan6.bean.mallsystem.OrderItems;
import com.ispan6.bean.mallsystem.Product;
import com.ispan6.bean.mallsystem.ProductLabel;
import com.ispan6.bean.mallsystem.ProductType;
import com.ispan6.bean.mallsystem.ShoppingCartItem;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.service.mallsystem.OrderBeanService;
import com.ispan6.service.mallsystem.OrderItemService;
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

	@Autowired
	private OrderBeanService orderBeanService;

	@Autowired
	private OrderItemService orderItemService;

	/**
	 * 重置整個網頁，同時將資料product、label、type存進session
	 * 
	 * @param session
	 * @return
	 */
	@GetMapping("/product")
	public String getProduct(HttpSession session) {
		// 先將網頁全部重置
		List<ProductLabel> labels = productLabelService.findAllLabel();
		List<ProductType> types = productTypeService.findAllType();
		List<Product> products = productService.getAllProductOnSell();
		session.setAttribute("products", products);
		session.setAttribute("types", types);
		session.setAttribute("labels", labels);
		return "productpage";
	}

	/**
	 * 開啟購物車時取得商品資料
	 * 
	 * @param session
	 * @param model
	 */
	@GetMapping("/openShoppingCart")
	@ResponseBody
	public List<ShoppingCartItem> openShoppingCart(HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		if (member != null) {
			return shoppingCartItemService.findAllByMemberId(member.getId());
		}
		return null;
	}

	/**
	 * 商品按照價格高到低進行排序
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/priceHightToLow")
	public String priceHightToLow(Model model) {
		List<Product> productByType = productService.findAllProductOrderByPriceDesc();
		model.addAttribute("products", productByType);
		return "productpage";
	}

	/**
	 * 商品按照價格低到高進行排序
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/priceLowToHight")
	public String priceLowToHight(Model model) {
		List<Product> productByType = productService.findAllProductOrderByPriceAsc();
		model.addAttribute("products", productByType);
		return "productpage";
	}

	/**
	 * 按照商品類型進行查找
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@GetMapping("/searchByTypeId")
	public String searchByTypeId(@RequestParam Integer id, Model model) {
		List<Product> products = productService.findByTypeId(id);
		model.addAttribute("products", products);
		return "productpage";
	}

	/**
	 * 按照商品標籤進行查找
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@GetMapping("/searchByLabelId")
	public String searchByLabelId(@RequestParam Integer id, Model model) {
		List<Product> products = productService.findByLabelId(id);
		model.addAttribute("products", products);
		return "productpage";
	}

	/**
	 * 按照商品價格範圍進行查找
	 * 
	 * @param lowPrice
	 * @param highPrice
	 * @param model
	 * @return
	 */
	@PostMapping("/searchByHLPrice")
	public String searchByHLPrice(@RequestParam Integer lowPrice, Integer highPrice, Model model) {
		List<Product> products = productService.findAllByPrice(lowPrice, highPrice);
		model.addAttribute("products", products);
		return "productpage";
	}

	/**
	 * 新增商品進購物車
	 * 
	 * @param id
	 * @param session
	 * @return
	 */
	@GetMapping("/addToCart")
	@ResponseBody
	public String addToCart(@RequestParam Integer id, HttpSession session) {
		// 先取得會員和商品id
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		if (member == null) {
			return "請先登入";
		}
		Product product = productService.findById(id);
		Integer memberId = member.getId();

		// 查詢購物車項目是否有重複（判斷方式為是不是空的）
		boolean flag = shoppingCartItemService.itemEmpty(memberId, id);

		// 如果不是空的
		if (flag == false) {
			// 先查詢是哪個用戶的哪個商品
			ShoppingCartItem shoppingCartItem = shoppingCartItemService.findByMemberIdAndProductId(memberId, id);
			// 然後把數量加1再保存
			shoppingCartItem.setCount(shoppingCartItem.getCount() + 1);
			shoppingCartItemService.addToCart(shoppingCartItem);
			return "商品已存在，數量加1";
		}

		// 如果是空的
		if (flag == true) {
			ShoppingCartItem shoppingCartItem = new ShoppingCartItem();
			shoppingCartItem.setCount(1);
			shoppingCartItem.setMemberTest(member);
			shoppingCartItem.setProduct(product);
			shoppingCartItemService.addToCart(shoppingCartItem);
			return "商品添加成功";
		}

		// 如果都不是
		return "unexpect wrong please contact with engineer";
	}

	/**
	 * 刪除購物車商品
	 * 
	 * @param sciId
	 * @param session
	 * @return
	 */
	@GetMapping("/deleteShoppingCart")
	@ResponseBody
	public List<ShoppingCartItem> deleteShoppingCart(@RequestParam Integer sciId, HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		shoppingCartItemService.deleteShoppingCartItem(sciId);
		return shoppingCartItemService.findAllByMemberId(member.getId());
	}

	/**
	 * 點擊確認結帳後送出到訂單確認頁面
	 * 
	 * @return
	 */
	@GetMapping("/sendCartToCheck")
	public String sendCartToCheck() {
		return "ordercheck";
	}

	@GetMapping("checkCartItem")
	@ResponseBody
	public List<ShoppingCartItem> checkCartItem(HttpSession session) {
		// 取得會員id
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		// 取得會員當前購物車商品
		List<ShoppingCartItem> items = shoppingCartItemService.findAllByMemberId(member.getId());
		return items;
	}

	/**
	 * 新增訂單
	 * 
	 * @param session
	 * @return
	 */
	@GetMapping("/checkedOrder")
	public String sendOrderToCheck(HttpSession session) {
		// 取得會員id
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		// 取得會員當前購物車商品
		List<ShoppingCartItem> items = shoppingCartItemService.findAllByMemberId(member.getId());
		// 計算總金額
		int totalPrice = 0;
		// 將購物車商品設定到訂單商品中
		for (ShoppingCartItem item : items) {
			totalPrice += item.getProduct().getPrice();
		}

		// 生成訂單
		OrderBean orderBean = new OrderBean();
		orderBean.setId(100);
		orderBean.setCount(items.size());
		orderBean.setPrice(totalPrice);
		orderBean.setMemberTest(member);
		List<OrderItems> oiList = new ArrayList<OrderItems>();
		for (ShoppingCartItem item : items) {
			OrderItems orderItem = new OrderItems();
			orderItem.setCount(item.getCount());
			orderItem.setTotalPrice(item.getCount() * item.getProduct().getPrice());
			orderItem.setProduct(item.getProduct());
			orderItem.setOrderBean(orderBean);
			oiList.add(orderItem);
		}
		orderBean.setOrderItems(oiList);
		orderBeanService.save(orderBean);
		return "送到支付畫面";
	}

}
