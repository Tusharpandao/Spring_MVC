package com.jspider.cardekho_case_study_mvcapp.repository;


import javax.persistence.EntityManager;

import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import org.springframework.stereotype.Repository;

import com.jspider.cardekho_case_study_mvcapp.pojo.UserPOJO;

@Repository
public class UserRepository {
	
	private static EntityManagerFactory factory;
	private static EntityManager manager;
	private static EntityTransaction transaction;
	private static void openConnection() {
		factory=Persistence.createEntityManagerFactory("cardekho");
		manager=factory.createEntityManager();
		transaction= manager.getTransaction();
	}
	private static void closeConnection() {
		if (factory != null) {
		factory.close();	
		}
		if (manager != null) {
			
			manager.close();
		}
		if (transaction != null) {
			if (transaction.isActive()) {
				transaction.rollback();
			}
		}
	}
	public UserPOJO createUser(String username, String password, String name, long mobile, String email) {
		openConnection();
		transaction.begin();
		
		UserPOJO user=manager.find(UserPOJO.class, username);
		
		if (user == null) {
			
			UserPOJO pojo=new UserPOJO(username, password, name, mobile, email);
			manager.persist(pojo);
			transaction.commit();
			closeConnection();
			return pojo;
		}
		transaction.commit();
		closeConnection();
		
		return null;
	}
	public UserPOJO login(String username, String password) {
		openConnection();
		transaction.begin();
		
		UserPOJO pojo =manager.find(UserPOJO.class, username);
		if (pojo.getUsername().equals(username) && pojo.getPassworld().equals(password)) {
			
			transaction.commit();
			closeConnection();
			return pojo;
			
		}
		transaction.commit();
		closeConnection();
		return null;
	}
	public UserPOJO forgotPass(String username, long mobile, String email) {
		
		openConnection();
		transaction.begin();
		
			UserPOJO user  = manager.find(UserPOJO.class,username);
			
		if (user != null) {
			
			if (user.getUsername().equals(username)) {
				
			}
		}	
		
		transaction.commit();
		closeConnection();
		return null;
	}
}
