package com.laptrinhjavaweb.Services;

import com.laptrinhjavaweb.dto.MyUser;

public interface UserService {
	public MyUser showDetailsUser(String name);
	public int insertUser(String name,String hashPassword,String fullName ,int status);
	public int checkUser(String nameUser);
	public int findIdUser(String userName);
	public int insertRole(int  idUser);
	public int isUserNameExists(String userName);
	public MyUser getUserByName(String name);
	public int updateProfileUser(MyUser myUser);
	public int changePasswordUser(String newPass,String nameUser);
	public String getPasswordUser(String username);
}
