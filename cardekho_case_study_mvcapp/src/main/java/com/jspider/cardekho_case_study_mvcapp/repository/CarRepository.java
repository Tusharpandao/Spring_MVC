package com.jspider.cardekho_case_study_mvcapp.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.jspider.cardekho_case_study_mvcapp.pojo.CarPOJO;
import com.jspider.cardekho_case_study_mvcapp.pojo.UserPOJO;

@Repository
public class CarRepository {

	private static EntityManagerFactory factory;
	private static EntityManager manager;
	private static EntityTransaction transaction;
	private static Query query;
	
	private static void openConnection() {
		
		factory= Persistence.createEntityManagerFactory("cardekho");
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
	public CarPOJO addCar(String carName, String brandName, String fuelType, String model, double price) {
		openConnection();
		transaction.begin();
		CarPOJO pojo=new CarPOJO();
		pojo.setCarName(carName);
		pojo.setBrandName(brandName);
		pojo.setFuelType(fuelType);
		pojo.setModel(model);
		pojo.setPrice(price);
		manager.persist(pojo);
		transaction.commit();
		closeConnection();
		return pojo;
	}
	public List<CarPOJO> findAllCar() {
		openConnection();
		transaction.begin();
		String jpql="from CarPOJO";
		
		query=manager.createQuery(jpql);
		List<CarPOJO>cars=query.getResultList();
		
		transaction.commit();
		closeConnection();
		
		return cars;
	}
	public CarPOJO removeCar(int id) {
		openConnection();
		transaction.begin();
		CarPOJO car=manager.find(CarPOJO.class, id);
		if(car != null) {
			manager.remove(car);
		}
		transaction.commit();
		closeConnection();
		
		return car;
	}
	public CarPOJO searchCarId(int id) {
		
		openConnection();
		transaction.begin();
		
		CarPOJO pojo=manager.find(CarPOJO.class, id);
		
		transaction.commit();
		closeConnection();
		return pojo;
	}
	public List<CarPOJO> findCarByName(String carName) {
		
		openConnection();
		transaction.begin();
		
		String jpql="from CarPOJO where carName = '"+carName+"'";
		query=manager.createQuery(jpql);
		List<CarPOJO>cars=query.getResultList();
		
		transaction.commit();
		closeConnection();
		
		return cars;
	}
	public List<CarPOJO> findCarByBrand(String carBrand) {
		
		openConnection();
		transaction.begin();
		
		String jpql="from CarPOJO where  brandName = '"+carBrand+"'";
		query=manager.createQuery(jpql);
		List<CarPOJO>cars=query.getResultList();
		
		transaction.commit();
		closeConnection();
		
		return cars;
	}
	public List<CarPOJO> carByFuelType(String fuelType) {
		openConnection();
		transaction.begin();
		
		String jpql="from CarPOJO where fuelType = '"+fuelType+"'";
		query=manager.createQuery(jpql);
		List<CarPOJO>cars=query.getResultList();
		
		transaction.commit();
		closeConnection();
		return cars;
	}
	public CarPOJO updateCar(int id, String carName, String brandName, String model, String fuelType, double price) {
		openConnection();
		transaction.begin();
		CarPOJO car=manager.find(CarPOJO.class, id);
		car.setCarName(carName);
		car.setBrandName(brandName);
		car.setModel(model);
		car.setFuelType(fuelType);
		car.setPrice(price);
		
		manager.persist(car);
		transaction.commit();
		closeConnection();
		return car;
	}
	
	
	
	
}
