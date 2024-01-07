package com.DAO;

import com.entity.User;

public interface UserDAO {

	public boolean userRegister(User us);
	
	
	public User login(String email,String password);
	
	
	public Boolean checkpassword(int id,String ps1);
	public Boolean updateProfile(User us);
	
	public boolean checkUser(String em);
	
	
	
}
