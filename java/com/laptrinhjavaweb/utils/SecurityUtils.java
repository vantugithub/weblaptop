package com.laptrinhjavaweb.utils;
import org.springframework.security.core.context.SecurityContextHolder;

import com.laptrinhjavaweb.dto.MyUser;


public class SecurityUtils {
	
	public static MyUser getPrincipal() {
		MyUser myUser = (MyUser) (SecurityContextHolder.getContext()).getAuthentication().getPrincipal();
        return myUser;
    }
	
}
