package com.jspider.cardekho_case_study_mvcapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jspider.cardekho_case_study_mvcapp.pojo.UserPOJO;
import com.jspider.cardekho_case_study_mvcapp.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository repository;

	public UserPOJO createAccount(String username, String password, String name, long mobile, String email) {
		
		UserPOJO pojo= repository.createUser(username,password,name,mobile,email);
		return pojo;
	}

	public UserPOJO login(String username, String password) {
		UserPOJO pojo=repository.login(username,password);
		return pojo;
	}

	public UserPOJO forgotPassWord(String username, long mobile, String email) {
		
		UserPOJO user =repository.forgotPass(username,mobile,email);
		return null;
	}

	
}
