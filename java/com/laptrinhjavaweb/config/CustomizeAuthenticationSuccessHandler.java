package com.laptrinhjavaweb.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomizeAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	public RedirectStrategy getRedirectStrategy() {
		return redirectStrategy;
	}

	public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
		this.redirectStrategy = redirectStrategy;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		HttpSession session = request.getSession();
		boolean admin = false;
		for (GrantedAuthority auth : authentication.getAuthorities()) {
			if ("ROLE_ADMIN".equals(auth.getAuthority())){
				admin = true;
			}
		}
		if(admin){
			if (response.isCommitted()) {
				return;
			}
			String url="/admin";
			redirectStrategy.sendRedirect(request, response, url);
		}else{
			String redirectUrl = (String) session.getAttribute("url_prior_login");
			if(redirectUrl!=null && redirectUrl.equals("http://localhost:8080/spring-mvc/register")==false)
			{
				session.removeAttribute("url_prior_login");
				getRedirectStrategy().sendRedirect(request, response, redirectUrl);
			}
			else {
				String url = "/trang-chu";
				redirectStrategy.sendRedirect(request, response, url);
			}
		}
	}
}
