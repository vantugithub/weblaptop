package com.laptrinhjavaweb.dao;

import java.util.List;

import com.laptrinhjavaweb.dto.MyUser;
import com.laptrinhjavaweb.dto.Role;

public interface UserDao {
	public void authentication(String userName);
	public List<Role> findUser(String name,String password);
	public MyUser showDetailsUser(String name);
	public int insertUser(String name,String hashPassword,String fullName ,int status);
	public int insertRole(int  idUser);
	public int findIdUser(String userName);
	public int checkUser(String nameUser);
	public int isUserNameExists(String userName);
	public MyUser getUserByName(String name);
	public int updateProfileUser(MyUser myUser);
	public int changePasswordUser(String newPass,String nameUser);
	public String getPasswordUser(String username);
	
}
