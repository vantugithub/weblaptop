package com.laptrinhjavaweb.controller.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.Catalog;
import com.laptrinhjavaweb.dto.ListItem;
import com.laptrinhjavaweb.dto.MyUser;
import com.laptrinhjavaweb.dto.Order;
import com.laptrinhjavaweb.dto.Product;
import com.laptrinhjavaweb.service.impl.OrderServiceImpl;
import com.laptrinhjavaweb.service.impl.ProductServiceImpl;
import com.laptrinhjavaweb.service.impl.UserServiceImpl;

@Controller(value = "orderControllerOfWeb")
public class OrderController {

	@Autowired
	private ProductServiceImpl productServiceImpl;
	@Autowired
	private UserServiceImpl userServiceImpl;
	@Autowired
	private OrderServiceImpl orderServiceImpl;
	
	@RequestMapping(value="/orthers/addToCart/{id}/{quantity}",method = RequestMethod.GET)
	public ModelAndView addTocart(@PathVariable(value="id",required = true) long id,
			@PathVariable(value="quantity",required = false) int quantity,
			HttpSession httpSession,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("web/numberofproductsordered");
		Product	product = productServiceImpl.getProductById(id);
		
		if(httpSession.getAttribute("cart")==null) {
			ListItem item = new ListItem();
			if(quantity != 0) {
				item.setQuantity(quantity);
			}else {
				item.setQuantity(1);
			}
			item.setProduct(product);
			List<ListItem> items = new ArrayList<ListItem>();
			items.add(item);
			Order order = new Order();
			order.setItems(items);
			httpSession.setAttribute("cart"	, order);
			request.getSession().setAttribute("quantity",1);
		}
		else {
			Order order  = (Order) httpSession.getAttribute("cart");
			List<ListItem> items = new ArrayList<ListItem>();
			items = order.getItems();
			boolean temp = true;
			for(ListItem item : items) {
				if(item.getProduct().getId()==id) {
					if(quantity != 0)
					{
						item.setQuantity(item.getQuantity()+quantity);
						temp = false;
						break;
					}
					else {
						item.setQuantity(item.getQuantity()+1);
						temp = false;
						break;
					}
				}
			}
			if(temp==true) {
				ListItem item = new ListItem();
				item.setQuantity(1);
				item.setProduct(product);
				items.add(item);
			}
			httpSession.setAttribute("cart", order);
			request.getSession().setAttribute("quantity",items.size());
		}
		return mav;
	}
	
	@RequestMapping(value="/cart",method = RequestMethod.GET)
	public ModelAndView cart(HttpServletRequest request,HttpSession httpSession) {
		long cart_total_value = 0;
		ModelAndView mav = new ModelAndView("web/cart");
		if(httpSession.getAttribute("cart") != null ) {
			Order order  = (Order) httpSession.getAttribute("cart");
			mav.addObject("list" , order.getItems());
			for(ListItem item : order.getItems()) {
				cart_total_value=cart_total_value+item.getQuantity()*item.getProduct().getPrice();
			}
		}
		String referrer = request.getRequestURL().toString();
		request.getSession().setAttribute("url_prior_login", referrer);
		List<Catalog> listCatalog = new ArrayList<Catalog>();
		listCatalog = productServiceImpl.listCategories();
		mav.addObject("listCatalog",listCatalog);
		mav.addObject("cart_total_value",cart_total_value);
		return mav;
	}
	
	@RequestMapping(value="/orthers/clearCart" , method = RequestMethod.GET)
	public ModelAndView clearCart(WebRequest request, SessionStatus status) {
		status.setComplete();
	    request.removeAttribute("cart", WebRequest.SCOPE_SESSION);
		return new ModelAndView("web/clearcart");
	}
	
	@RequestMapping(value="/orthers/deleteItem/{id}",method = RequestMethod.GET)
	public ModelAndView deleteItem(@PathVariable(value="id",required = true)int id,
			HttpSession  httpSession) {
		ModelAndView mav = new ModelAndView("web/deleteitem");
		Order order = (Order) httpSession.getAttribute("cart");
		if(order != null) {
			List<ListItem> items  = order.getItems();
			for(ListItem item : items) {
				if(item.getProduct().getId() == id) {
					items.remove(item);
					order.setItems(items);
					break;
				}
			}
		}
		mav.addObject("list" , order.getItems());
		List<Catalog> listCatalog = new ArrayList<Catalog>();
		listCatalog = productServiceImpl.listCategories();
		mav.addObject("listCatalog",listCatalog);
		return mav;
	}
	
	@RequestMapping(value="/orthers/updateQuantityInc/{idproduct}/{quantity}",method =RequestMethod.GET)
	public ModelAndView updateCartInc(@PathVariable(value="idproduct",required = true) int idproduct,
			@PathVariable(value="quantity",required = true) int quantity,
			HttpSession httpSession) {
		ModelAndView mav = new ModelAndView("web/updatequantity");
		Order order = (Order) httpSession.getAttribute("cart");
		int resutl = 0;
		if(order!=null) {
			List<ListItem> items  = order.getItems();
			for(ListItem item : items) {
				if(item.getProduct().getId()==idproduct) {
					item.setQuantity(quantity+1);
					resutl = item.getQuantity();
					order.setItems(items);
					break;
				}
			}
		}
		List<Catalog> listCatalog = new ArrayList<Catalog>();
		listCatalog = productServiceImpl.listCategories();
		mav.addObject("quantityProduct",resutl);
		mav.addObject("listCatalog",listCatalog);
		return mav;
	}
	
	@RequestMapping(value="/orthers/updateQuantityDec/{idproduct}/{quantity}",method = RequestMethod.GET)
	public ModelAndView updateCartDec(@PathVariable(value="idproduct",required = true) int idproduct,
			@PathVariable(value="quantity",required = true) int quantity,
			HttpSession httpSession) {
		ModelAndView mav = new ModelAndView("web/updatequantity");
		Order order = (Order) httpSession.getAttribute("cart");
		int resutl = 1;
		if(order!=null) {
			List<ListItem> items  = order.getItems();
			for(ListItem item : items) {
				if(item.getProduct().getId()==idproduct && item.getQuantity() >=2 ) {
					item.setQuantity(quantity-1);
					resutl = item.getQuantity();
					order.setItems(items);
					break;
				}
			}
		}
		List<Catalog> listCatalog = new ArrayList<Catalog>();
		listCatalog = productServiceImpl.listCategories();
		mav.addObject("quantityProduct",resutl);
		mav.addObject("listCatalog",listCatalog);
		return mav;
	}
	
	@RequestMapping(value="/checkout",method = RequestMethod.GET)
	public ModelAndView processToCheckOut(HttpSession httpSession) {
		ModelAndView mav = new ModelAndView("web/placeorder");
		List<Catalog> listCatalog = new ArrayList<Catalog>();
		listCatalog = productServiceImpl.listCategories();
		
		Order order = (Order) httpSession.getAttribute("cart");
		long cart_total_value = 0;
		List<ListItem> check = order.getItems();
		if(check.size()==0 || order == null) {
			ModelAndView mavv = new ModelAndView("web/failed");
			mavv.addObject("listCatalog",listCatalog);
			return mavv;
		}
		if(order != null) {
			mav.addObject("list" , order.getItems());
			for(ListItem item : order.getItems()) {
				cart_total_value=cart_total_value+item.getQuantity()*item.getProduct().getPrice();
			}
			mav.addObject("list",order.getItems());
		}
		MyUser myUser = new MyUser();
		String name = SecurityContextHolder.getContext().getAuthentication().getName();
		myUser = userServiceImpl.getUserByName(name);
		mav.addObject("myUser",myUser);
		mav.addObject("total",cart_total_value);
		mav.addObject("listCatalog",listCatalog);
		return mav;
	}
	
	@RequestMapping(value="/cart/placeorder",method = RequestMethod.POST)
	public ModelAndView processPlaceOrder(HttpSession httpSession,SessionStatus status,WebRequest request) {
		ModelAndView mav = new ModelAndView("web/noticeplaceorder");
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		String strDate = formatter.format(date);
		formatter = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
		strDate = formatter.format(date);
		Order order = (Order) httpSession.getAttribute("cart");
		order.setOrderDate(strDate);
		int idUser = userServiceImpl.findIdUser(SecurityContextHolder.getContext().getAuthentication().getName());
		MyUser myUser = new MyUser();
		myUser.setId(idUser);
		order.setMyUser(myUser);
		if(order!=null && order.getItems().size() != 0 ) {
			if(orderServiceImpl.orderedList(order)!=0) {
				int orderId = orderServiceImpl.getOrderId(strDate,idUser);
				for(ListItem item : order.getItems()) {
					@SuppressWarnings("unused")
					int check = orderServiceImpl.detailedOrderList(item, orderId);
				}
			}
		}
		status.setComplete();
	    request.removeAttribute("cart", WebRequest.SCOPE_SESSION);
		return mav;
	}
}
