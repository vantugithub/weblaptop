package com.laptrinhjavaweb.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{
	
	@Autowired
	DataSource dataSource;
	
	@Autowired
	CustomizeAuthenticationSuccessHandler customizeAuthenticationSuccessHandler;
	
	@Bean
    public PasswordEncoder passwordEncoder(){
        PasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder;
    }
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(dataSource).passwordEncoder(passwordEncoder())
		.usersByUsernameQuery("select username, password, status from users where username = ? ").
		authoritiesByUsernameQuery("select username, roles.name from roles, roles_users, users where users.username = ? "
				+ "and users.iduser = roles_users.user and roles_users.role = roles.idroles");
		
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests().antMatchers("/admin/**").hasRole("ADMIN")
		.and().authorizeRequests().antMatchers("/user/**").hasRole("USER")
		.anyRequest().permitAll().and().formLogin().loginPage("/dang-nhap").loginProcessingUrl("/loginn")
		.usernameParameter("username").passwordParameter("password").successHandler(customizeAuthenticationSuccessHandler).
		failureUrl("/dang-nhap?failed").and().logout().logoutUrl("j_spring_security_logout").logoutSuccessUrl("/trang-chu").
		and().exceptionHandling().accessDeniedPage("/dang-nhap?deny");
	}
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/template/**");
	}
	
	
}
