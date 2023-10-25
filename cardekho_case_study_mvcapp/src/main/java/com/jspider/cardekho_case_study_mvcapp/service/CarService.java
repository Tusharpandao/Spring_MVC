package com.jspider.cardekho_case_study_mvcapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jspider.cardekho_case_study_mvcapp.pojo.CarPOJO;
import com.jspider.cardekho_case_study_mvcapp.pojo.UserPOJO;
import com.jspider.cardekho_case_study_mvcapp.repository.CarRepository;

@Service
public class CarService {
	@Autowired
	private CarRepository repository;

	public CarPOJO addCar(String carName, String brandName, String fuelType, String model, double price) {
		CarPOJO pojo=repository.addCar(carName,brandName,fuelType,model,price);
		return pojo;
	}

	public List<CarPOJO> findAllCars() {
		List<CarPOJO> cars=repository.findAllCar();
		
		return cars;
	}

	public CarPOJO removeCar(int id) {
		CarPOJO pojo=repository.removeCar(id);
		return pojo;
	}

	public CarPOJO searchCarById(int id) {
		CarPOJO pojo=repository.searchCarId(id);
		return pojo;
	}

	public List<CarPOJO> findCarByName(String carName) {
		List<CarPOJO>cars=repository.findCarByName(carName);
		return cars;
	}

	public List<CarPOJO> findCarByBrand(String carBrand) {
		List<CarPOJO>cars=repository.findCarByBrand(carBrand);
		return cars;
	}

	public List<CarPOJO> findCarByFuelType(String fuelType) {
		List<CarPOJO> cars=repository.carByFuelType(fuelType);
		return cars;
	}

	public CarPOJO updateCarDetails(int id, String carName, String brandName, String model, String fuelType,
			double price) {
		CarPOJO pojo=repository.updateCar(id,carName,brandName,model,fuelType,price);
		return pojo;
	}
}
