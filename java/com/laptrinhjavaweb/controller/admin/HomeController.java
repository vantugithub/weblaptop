package com.laptrinhjavaweb.controller.admin;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.MyUser;
import com.laptrinhjavaweb.service.impl.UserServiceImpl;

@Controller(value = "homeControllerOfAdmin")
public class HomeController {
	
	@Autowired
	private UserServiceImpl userServiceImpl;
	
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView homePage(HttpServletRequest request, Principal principal) {
		MyUser myUser = new MyUser();
		myUser = userServiceImpl.showDetailsUser(principal.getName());
		request.setAttribute("fullname", myUser.getFullName());
		ModelAndView mav = new ModelAndView("admin/home");
		return mav;
	}
}
