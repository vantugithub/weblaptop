package com.laptrinhjavaweb.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.dao.UserDao;
import com.laptrinhjavaweb.dto.MyUser;
import com.laptrinhjavaweb.dto.Role;

@Repository
public class UserDaoImpl implements UserDao{

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public void authentication(String userName) {
		
	}

	@Override
	public List<Role> findUser(String name, String password) {
		String sql = "select roles.name from roles, roles_users, users where users.username = ? and users.password = ? "
				+ "and users.iduser = roles_users.user and roles_users.role = roles.idroles";

		return jdbcTemplate.query(sql, new Object[] {name,password}, new RowMapper<Role>() {

			@Override
			public Role mapRow(ResultSet rs, int rowNum) throws SQLException {
				Role role = new Role();
				role.setName(rs.getString("name"));
				return role;
			}
		});
	}

	@Override
	public MyUser showDetailsUser(String name) {
		String sql = "select fullname,username,password from users where username = ?";

		return jdbcTemplate.queryForObject(sql, new Object[] {name},new RowMapper<MyUser>() {
			@Override
			public MyUser mapRow(ResultSet rs, int rowNum) throws SQLException {
				MyUser myUser = new MyUser();
				myUser.setFullName(rs.getString("fullname"));
				myUser.setUsername(rs.getString("username"));
				myUser.setPassword(rs.getNString("password"));
				return myUser;
			}
		});
	}

	@Override
	public int insertUser(String userName, String hashPassword, String fullName ,int status) {
		String sql = "insert into users(username,password,status,fullname) values(?,?,?,?)";
		return jdbcTemplate.update(sql,userName,hashPassword,status,fullName);
	}

	@Override
	public int checkUser(String nameUser) {
		String sql="select iduser from users where username = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {nameUser}, int.class );
	}

	@Override
	public int insertRole(int idUser) {
		String sql= "insert into roles_users(user,role) values(?,?)";
		jdbcTemplate.update(sql,idUser,2);
		return 0;
	}

	@Override
	public int findIdUser(String userName) {
		String sql = "select iduser from users where username = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {userName},Integer.class);
	}

	@Override
	public int isUserNameExists(String userName) {
		String sql =  "SELECT EXISTS(select  username  from users  where username = ?)";
		return jdbcTemplate.queryForObject(sql, new Object[] {userName},Integer.class);
	}

	@Override
	public MyUser getUserByName(String name) {
		String sql= "select username,fullname,address,phone,city from users where username = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {name},new RowMapper<MyUser>() {

			@Override
			public MyUser mapRow(ResultSet rs, int rowNum) throws SQLException {
				MyUser myUser = new MyUser();
				myUser.setFullName(rs.getNString("fullname"));
				myUser.setCity(rs.getNString("city"));
				myUser.setPhone(rs.getNString("phone"));
				myUser.setUsername(rs.getNString("username"));
				myUser.setAddress(rs.getNString("address"));
				return myUser;
			}
		});
	}

	@Override
	public int updateProfileUser(MyUser myUser) {
		String sql="update users set fullname = ?, address = ?, phone = ?, city = ? where username = ?";
		return jdbcTemplate.update(sql,myUser.getFullName(),myUser.getAddress(),myUser.getPhone(),
				myUser.getCity(),myUser.getUsername());
	}

	@Override
	public int changePasswordUser(String newPass, String nameUser) {
		String sql = "update users set password = ? where username = ?";
		return jdbcTemplate.update(sql,newPass,nameUser);
	}

	@Override
	public String getPasswordUser(String username) {
		String sql="select password from users where username = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {username},String.class) ;
	}


}

