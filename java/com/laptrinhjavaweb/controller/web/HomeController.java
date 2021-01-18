package com.laptrinhjavaweb.controller.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.Catalog;
import com.laptrinhjavaweb.dto.Comment;
import com.laptrinhjavaweb.dto.Description;
import com.laptrinhjavaweb.dto.MyUser;
import com.laptrinhjavaweb.dto.Product;
import com.laptrinhjavaweb.dto.ReplyComment;
import com.laptrinhjavaweb.service.impl.ProductServiceImpl;
import com.laptrinhjavaweb.service.impl.UserServiceImpl;



@Controller(value = "homeControllerOfWeb")
public class HomeController {

	@Autowired
	private UserServiceImpl userServiceImpl;
	@Autowired
	private ProductServiceImpl productServiceImpl;

	@Bean
	BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage(HttpServletRequest request) {
		Product product  =  new Product();
		List<Catalog> listCatalog = new ArrayList<Catalog>();
		listCatalog = productServiceImpl.listCategories();
		product.setListResult(productServiceImpl.findAlll());
		ModelAndView mav = new ModelAndView("web/home");
		mav.addObject("list",product);
		mav.addObject("listCatalog",listCatalog);
		return mav;
	}

	@RequestMapping(value="/dang-nhap",method = RequestMethod.GET)
	public ModelAndView loginPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("login");
		String referrer = request.getHeader("Referer");
		request.getSession().setAttribute("url_prior_login", referrer);
		return mav;
	}

	@RequestMapping(value="/j_spring_security_logout", method=RequestMethod.GET)  
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {  
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();  
		if (auth != null){      
			new SecurityContextLogoutHandler().logout(request, response, auth);  
		}  
		return "redirect:/trang-chu";
	}

	@RequestMapping(value="/register",method = RequestMethod.GET)
	public ModelAndView register(Model model) {
		ModelAndView mav = new ModelAndView("register");
		MyUser myUser = new MyUser();
		model.addAttribute("user", myUser);
		return mav;
	}

	@RequestMapping(value="/registerAction",method = RequestMethod.POST,produces = "application/x-www-form-urlencoded;charset=UTF-8")
	public ModelAndView formRegister(@ModelAttribute("user") MyUser user) {
		int check = userServiceImpl.isUserNameExists(user.getUsername());
		if(check==0) 
		{
			ModelAndView mav = new ModelAndView("redirect:/dang-nhap");
			String hashedPassword = passwordEncoder().encode(user.getPassword());
			userServiceImpl.insertUser(user.getUsername(),hashedPassword,user.getFullName(),1);
			int id = userServiceImpl.findIdUser(user.getUsername());
			userServiceImpl.insertRole(id);
			return mav;
		}
		ModelAndView mav1 = new ModelAndView("redirect:/dang-nhap");
		return mav1;
	}

	@RequestMapping(value="/product/{id}" , method= RequestMethod.GET)
	public ModelAndView detailProduct(@PathVariable(value="id") int id)
	{
		Product product  = new Product();
		product.setListResult(productServiceImpl.findOneProductById(id));
		List<String> strListImage = new ArrayList<String>();
		String strImage = "";
		for (Product pro : product.getListResult())
		{
			strImage+=pro.getImage();
		}
		String [] words = strImage.split(";"); 
		for(String w : words) {
			strListImage.add(w);
		}
		
		List<Description> desList = new ArrayList<Description>();
		desList = productServiceImpl.displayDetailsDescriptionProduct(id);
		List<Description> descriptionList = new ArrayList<Description>();
		if(desList.size() != 0) {
			Description strDes = desList.get(0);
			String [] wordss = strDes.getContent().split(";");
			int size = wordss.length/4;
				for(int i = 0 ; i < size ; i++ ) {
					Description description = new Description();
					description.setTitle(wordss[4*i]);
					description.setHeadContent(wordss[4*i+1]);
					description.setImage(wordss[4*i+2]);
					description.setFootContent(wordss[4*i+3]);
					descriptionList.add(description);
				}
		}
		
		List<ReplyComment> listReplyComment = new ArrayList<ReplyComment>();
		listReplyComment = productServiceImpl.findAllReplyCommentById(id);
		List<Comment> listComment = new ArrayList<Comment>();
		listComment = productServiceImpl.getCommentByIdProduct(id);
		List<Catalog> listCatalog = new ArrayList<Catalog>();
		listCatalog = productServiceImpl.listCategories();
		ModelAndView mav  = new ModelAndView("web/detailproduct");
		mav.addObject("listReplyComment",listReplyComment);
		mav.addObject("sumComment",productServiceImpl.getSumCommentByIdProduct(id));
		mav.addObject("idProduct1",id);
		mav.addObject("listComment",listComment);
		mav.addObject("fistImage",strListImage.get(0));
		mav.addObject("strListImage",strListImage);
		mav.addObject("strImage",strImage);
		mav.addObject("product",product);
		mav.addObject("nTagInDatabase","\n");
		mav.addObject("brTagInHtml","<br/>");
		mav.addObject("descriptionProduct",descriptionList);
		mav.addObject("listCatalog",listCatalog);
		return mav;
	}

	@RequestMapping(value="/comment/{id}/{content}" , method=RequestMethod.POST)
	public ModelAndView saveComment(@PathVariable("id") long id,
			@PathVariable("content") String content,HttpServletRequest request) 
	{
		String auth = SecurityContextHolder.getContext().getAuthentication().getName();
		
		if(auth.equals("anonymousUser")==false) {
			List<ReplyComment> listReplyComment = new ArrayList<ReplyComment>();
			int id1 = (int) id;
			listReplyComment = productServiceImpl.findAllReplyCommentById(id1);
			ModelAndView mav = new ModelAndView("comment");
			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
			String strDate = formatter.format(date);
			formatter = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
			strDate = formatter.format(date);
			Comment comment  = new Comment();
			comment.setIdProduct(id);
			comment.setContent(content);
			comment.setDate(strDate);
			comment.setIdUser(userServiceImpl.findIdUser(auth));
			@SuppressWarnings("unused")
			int check = productServiceImpl.saveCommentUser(comment);
			List<Comment> listComment = new ArrayList<Comment>();
			listComment = productServiceImpl.getCommentByIdProduct(id);
			mav.addObject("listComment",listComment);
			mav.addObject("listReplyComment",listReplyComment);
			return mav;
		}
		else
		{
			return new ModelAndView("redirect:/dang-nhap");
		}
	}
	
	@RequestMapping(value="/comment/reply/{id}/{idReplycomment}/{content}",method = RequestMethod.POST)
	public ModelAndView saveReplyComment(@PathVariable("id") long id,
			@PathVariable("idReplycomment") int idReplyComment,
			@PathVariable("content") String content) {
		String auth = SecurityContextHolder.getContext().getAuthentication().getName();
		if(auth.equals("anonymousUser")==false) {
		ModelAndView mav = new ModelAndView("replycomment");
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
		String strDate = formatter.format(date);
		formatter = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
		strDate = formatter.format(date);
		ReplyComment replyComment = new ReplyComment();
		replyComment.setCommentId(idReplyComment);
		replyComment.setContent(content);
		replyComment.setDate(strDate);
		replyComment.setUserId(userServiceImpl.findIdUser(auth));
		replyComment.setIdProduct((int)id);
		@SuppressWarnings("unused")
		int check = productServiceImpl.saveReplyCommentUser(replyComment);
		List<ReplyComment> listReplyComment = new ArrayList<ReplyComment>();
		listReplyComment = productServiceImpl.getReplyCommentByIdProduct((int)id, idReplyComment);
		mav.addObject("listReplyComment",listReplyComment);
		mav.addObject("CommentId",idReplyComment);
		return mav;
	}
	else
	{
		return new ModelAndView("redirect:/dang-nhap");
	}
}
	
	@RequestMapping(value="/profile",method = RequestMethod.GET)
	public ModelAndView profile() {
		ModelAndView mav = new ModelAndView("web/profileUser");
		MyUser myUser = new MyUser();
		String name = SecurityContextHolder.getContext().getAuthentication().getName();
		myUser = userServiceImpl.getUserByName(name);
		MyUser myUser2 = new MyUser();
		mav.addObject("user2",myUser2);
		mav.addObject("user1",myUser);
		List<Catalog> listCatalog = new ArrayList<Catalog>();
		listCatalog = productServiceImpl.listCategories();
		mav.addObject("listCatalog",listCatalog);
		return mav;
	}
	
	@RequestMapping(value="/updateProfile",method = RequestMethod.POST)
	public ModelAndView updateProfileUser(@ModelAttribute("user2") MyUser myUser) {
		ModelAndView mav = new ModelAndView("redirect:/profile");
		String name = SecurityContextHolder.getContext().getAuthentication().getName();
		myUser.setUsername(name);
		@SuppressWarnings("unused")
		int check = userServiceImpl.updateProfileUser(myUser);
		return mav;
	}
	
	@RequestMapping(value="/orthers/changePass/{newPass}/{currentPass}",method= RequestMethod.POST)
	public ModelAndView changePass(@PathVariable("newPass") String newPass,
			@PathVariable("currentPass") String currentPass) {
		ModelAndView mav = new ModelAndView("web/messageChangePassword");
		BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
		String name = SecurityContextHolder.getContext().getAuthentication().getName();
		boolean isPasswordMatches  = bcrypt.matches(currentPass, userServiceImpl.getPasswordUser(name));
		String notice = "";
		if(isPasswordMatches==true) {
			String hashedPassword = passwordEncoder().encode(newPass);
			if(userServiceImpl.changePasswordUser(hashedPassword,name)!=0) {
				notice+="Change password Success";
			}
			else notice+="Change password faild";
		}else {
			notice+="Password is incorrect";
		}
		mav.addObject("notice", notice);
		return mav;
	}
	
	
	@RequestMapping(value="/categories",method = RequestMethod.GET)
	public ModelAndView Categories()
	{
		ModelAndView mav = new ModelAndView("web/categories");
		List<Catalog> listCatalog = new ArrayList<Catalog>();
		listCatalog = productServiceImpl.listCategories();
		mav.addObject("listCatalog",listCatalog);
		return mav;
	}
	
	
	@RequestMapping(value="/{name}",method = RequestMethod.GET)
	public ModelAndView DetailsCategory(@PathVariable(name="name",required = true) String name) {
		ModelAndView mav = new ModelAndView("web/listproduct");
		List<Product> listProduct = new ArrayList<Product>();
		listProduct = productServiceImpl.listProductByCategory(name);
		List<Catalog> listCatalog = new ArrayList<Catalog>();
		listCatalog = productServiceImpl.listCategories();
		mav.addObject("listCatalog",listCatalog);
		mav.addObject("listProduct",listProduct);
		mav.addObject("NAME",listProduct.get(0).getContent());
		return mav;
	}
	
	@RequestMapping(value="/orthers/search/{name}" , method = RequestMethod.POST)
	public ModelAndView search(@PathVariable(name="name",required = true) String name) {
		ModelAndView mav  = new  ModelAndView("web/search");
		List<Product> listProduct = new ArrayList<Product>();
		listProduct = productServiceImpl.searchProductByName(name);
		mav.addObject("resultSearch",listProduct);
		return mav;
	}
	
	
	@RequestMapping(value="/cart/placeorder",method = RequestMethod.GET)
	public ModelAndView test(HttpServletRequest request) {
		ModelAndView mav = new  ModelAndView("web/noticeplaceorder");
		return mav;
	}
	
	
	
}
