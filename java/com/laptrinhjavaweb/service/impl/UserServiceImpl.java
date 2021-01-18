package com.laptrinhjavaweb.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.Services.UserService;
import com.laptrinhjavaweb.dao.impl.UserDaoImpl;
import com.laptrinhjavaweb.dto.MyUser;
@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDaoImpl userDaoImpl;
	
	@Override
	public MyUser showDetailsUser(String name) {
		return userDaoImpl.showDetailsUser(name);
	}

	@Override
	public int insertUser(String name, String hashPassword, String fullName, int status) {
		return userDaoImpl.insertUser(name, hashPassword, fullName, status);
	}

	@Override
	public int checkUser(String nameUser) {
		return userDaoImpl.checkUser(nameUser);
	}

	@Override
	public int findIdUser(String userName) {
		return userDaoImpl.findIdUser(userName);
	}

	@Override
	public int insertRole(int idUser) {
		return userDaoImpl.insertRole(idUser);
	}

	@Override
	public int isUserNameExists(String userName) {
		return userDaoImpl.isUserNameExists(userName);
	}

	@Override
	public MyUser getUserByName(String name) {
		return userDaoImpl.getUserByName(name);
	}

	@Override
	public int updateProfileUser(MyUser myUser) {
		return userDaoImpl.updateProfileUser(myUser);
	}

	@Override
	public int changePasswordUser(String newPass, String nameUser) {
		return userDaoImpl.changePasswordUser(newPass, nameUser);
	}

	@Override
	public String getPasswordUser(String username) {
		return userDaoImpl.getPasswordUser(username);
	}

}
