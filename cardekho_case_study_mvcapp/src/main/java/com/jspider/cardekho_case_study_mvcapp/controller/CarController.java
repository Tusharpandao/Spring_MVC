package com.jspider.cardekho_case_study_mvcapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.jspider.cardekho_case_study_mvcapp.pojo.CarPOJO;
import com.jspider.cardekho_case_study_mvcapp.pojo.UserPOJO;
import com.jspider.cardekho_case_study_mvcapp.service.CarService;


@Controller
public class CarController {
	@Autowired
	private CarService service;
	
	@GetMapping("/home")
	public String home(@SessionAttribute(name = "login",required = false)UserPOJO user, ModelMap map) {

		if(user != null) {
			return "Home";
		}
		map.addAttribute("msg", "Session inactive !");
		return "Login";
	}
	//add car page controller
	@GetMapping("/add")
	public String addPage(@SessionAttribute(name = "login",required = false)UserPOJO user, ModelMap map) {
		
		if (user != null) {
			List<CarPOJO>cars=service.findAllCars();
			if(cars.isEmpty()==false) {
				map.addAttribute("cars", cars);
				return "AddCar";
			}
			
			return "AddCar";
			
		}
		map.addAttribute("msg", "Session inactive !");
		return "Login";
		
	}
	// add single car controller
	@PostMapping("/add")
	public String addCar(@RequestParam String carName, @RequestParam String brandName, @RequestParam String fuelType,
						@RequestParam String model, @RequestParam double price,
						@SessionAttribute(name = "login",required = false)UserPOJO user, ModelMap map) {
		
		if (user != null) {
			
			CarPOJO pojo = service.addCar(carName,brandName,fuelType,model, price);
			
			//success
			if(pojo != null) {
				map.addAttribute("msg","Car Data Inserted");
				List<CarPOJO> cars=service.findAllCars();
				map.addAttribute("cars", cars);
				return "AddCar";
			}
			//fail
			map.addAttribute("msg","Car data Not inserted");
			List<CarPOJO> cars=service.findAllCars();
			if (cars.isEmpty()==false) {
				System.out.println(" fail flow");
				map.addAttribute("cars",cars);
			}
			return "AddCar";
		}
		map.addAttribute("msg", "Session inactive");
		return "Login";
			
	}
	
	
	//removecar page controller
	@GetMapping("/remove")
	public String removePage(@SessionAttribute(name = "login",required = false)UserPOJO user, ModelMap map) {
		if (user != null) {
			List<CarPOJO>cars=service.findAllCars();
			//Success
			if(cars.isEmpty()==false) {
				map.addAttribute("cars", cars);
			return "RemoveCar";
			}
			//fail
			map.addAttribute("msg", "NO Car Data present");
			return "RemoveCar";	
		}
		map.addAttribute("msg", "Session inactive");
		return "Login";
	}
	
	// remove car controller using id
	@PostMapping("/remove")
	public String removeCar(@RequestParam int id,@SessionAttribute(name = "login",required = false)UserPOJO user, ModelMap map) {
		if(user != null) {
			CarPOJO pojo=service.removeCar(id);
			List<CarPOJO>cars=service.findAllCars();
			
			
			//success
			if(pojo != null) {
				
				map.addAttribute("msg", "Car Id "+pojo.getId() + " and Car Name "+ pojo.getCarName()+" Car Data removed successfully...!");
				map.addAttribute("cars", cars);
				return "RemoveCar";
			}
			//fail
			map.addAttribute("msg", " Car data does not exist ");
			map.addAttribute("cars", cars);
			return "RemoveCar";	
		}
		map.addAttribute("msg", "Session inactive");
		return "Login";
		
	}
	//searchCar page controller
	@GetMapping("/search")
	public String searchCar(@SessionAttribute(name = "login",required = false)UserPOJO user, ModelMap map) {
		if (user != null) {
			
			return "SearchCar";
		}
		map.addAttribute("msg", "Session inactive");
		return "Login";
	}
	
	
	@GetMapping("/searchAllCar")
	public String searchAllCar(@SessionAttribute(name = "login",required = false)UserPOJO user, ModelMap map) {
		if (user != null) {
			List<CarPOJO>cars=service.findAllCars();
			if(cars.isEmpty()==false) {
				map.addAttribute("cars", cars);
				map.addAttribute("msg", "All Car Data found");
			return "SearchAllCar";
			
		}
			map.addAttribute("msg","Car Data not found !!!");
			return"SearchAllCar";
		
	}
		map.addAttribute("msg", "Session inactive");
		return "Login";
	}
	
	@GetMapping("/carId")
	public String searchCarId(@SessionAttribute(name = "login",required = false)UserPOJO user, ModelMap map) {
		if (user != null) {
			
			return "CarId";
		}
		map.addAttribute("msg", "Session inactive");
		return "Login";
	}
	// searchCarById controller
	@PostMapping("/carId")
	public String searchCarById(@RequestParam int id,@SessionAttribute(name = "login",required = false)UserPOJO user, ModelMap map) {
		if (user != null) {
			CarPOJO pojo =service.searchCarById(id);
			
			//success
			if (pojo != null) {
				map.addAttribute("car", pojo);
				map.addAttribute("msg", "Car data found successfully...!");
				return "CarId";
			}
			map.addAttribute("msg", "Car data does not exist ...!");
			return "CarId";
		}
		map.addAttribute("msg", "Session inactive");
		return "Login";
	}
	// searchCarName page controller
	@GetMapping("/carName")
	public String searchCarName(@SessionAttribute(name = "login",required = false)UserPOJO user, ModelMap map) {
		if (user != null) {
			
			return "CarName";
		}
		map.addAttribute("msg", "Session inactive");
		return "Login";
	}
	// searchCarName response controller
	@PostMapping("/carName")
	public String searchCarName(@RequestParam String carName,@SessionAttribute(name = "login",required = false)UserPOJO user, ModelMap map) {
		if (user != null) {
			
			List<CarPOJO>cars=service.findCarByName(carName);
			if (cars.isEmpty()==false) {
				map.addAttribute("cars", cars);
				map.addAttribute("msg", " Car Data found Which name as "+carName+"");
				return "CarName";
				
			}
			map.addAttribute("msg", "Car Data not found which name as "+carName+"");
			return "CarName";
		}
		map.addAttribute("msg", "Session inactive");
		return "Login";
	}
	// searchCarBrand page controller
	@GetMapping("/carBrand")
	public String searchCarBrand(@SessionAttribute(name = "login",required = false)UserPOJO user, ModelMap map) {
		// here Checking the session active or not 
		if (user != null) {
			
			return "CarBrand";
		}
		map.addAttribute("msg", "Session inactive");
		return "Login";
	}
	//search car By brand controller
	@PostMapping("/carBrand")
	public String searchCarBrand(@RequestParam String carBrand,@SessionAttribute(name = "login",required = false)UserPOJO user, ModelMap map) {
		if (user != null) {
			
			List<CarPOJO>cars=service.findCarByBrand(carBrand);
			if (cars.isEmpty()==false) {
				map.addAttribute("cars", cars);
				map.addAttribute("msg", " Car Data found Which Brand as "+carBrand+"");
				return "CarBrand";
				
			}
			map.addAttribute("msg", "Car Data not found which Brand as "+carBrand+"");
			return "CarBrand";
		}
		map.addAttribute("msg", "Session inactive");
		return "Login";
	}
	
	@GetMapping("/fuelType")
	public String searchCarByFuelType(@SessionAttribute(name = "login",required = false)UserPOJO user, ModelMap map) {
		// here Checking the session active or not 
		if (user != null) {
			
			return "FuelType";
		}
		map.addAttribute("msg", "Session inactive");
		return "Login";
	}
	
	@PostMapping("/fuelType")
	public String searchCarByFuelType(@RequestParam String fuelType ,@SessionAttribute(name = "login",required = false)UserPOJO user, ModelMap map) {
		// here Checking the session active or not 
		if (user != null) {
			List<CarPOJO>cars=service.findCarByFuelType(fuelType);
			//success flow
			if (cars.isEmpty()==false) {
				map.addAttribute("cars", cars);
				map.addAttribute("msg", "Car data found where fuelType as " + fuelType+"");
				return "FuelType";
			}
			map.addAttribute("msg", "Car data not found which is FuelType as "+ fuelType+ "");
			return "FuelType";
		}
		map.addAttribute("msg", "Session inactive");
		return "Login";
	}
	//update car page controller
	@GetMapping("/update")
	public String updateCarDitails(@SessionAttribute(name = "login",required = false)UserPOJO user, ModelMap map) {
		// here Checking the session active or not 
		if (user != null) {
			List<CarPOJO>cars=service.findAllCars();
			map.addAttribute("cars", cars);
			return "UpdateCar";
		}
		map.addAttribute("msg", "Session inactive");
		return "Login";
	}
	//Update form Controller
	@PostMapping("/update")
	public String updateformResPonse(@RequestParam int id,@SessionAttribute(name = "login",required = false)UserPOJO user, ModelMap map) {
		// here Checking the session active or not 
		if (user != null) {
			CarPOJO car=service.searchCarById(id);
			//success
			if (car != null) {
			map.addAttribute("car", car);
			return "UpdateCar";
		}
			//fail flow
			List<CarPOJO>cars=service.findAllCars();
			map.addAttribute("cars", cars);
			map.addAttribute("msg", "Car Data not exists");
			return "UpdateCar";
		}
		map.addAttribute("msg", "Session inactive");
		return "Login";
	}
	@PostMapping("/updateCar")
	public String updateCarDetails(@RequestParam int id,@RequestParam String carName, @RequestParam String brandName,@RequestParam String model, @RequestParam String fuelType,
			@RequestParam double price,@SessionAttribute(name = "login",required = false)UserPOJO user, ModelMap map) {

		if (user != null) {
			CarPOJO car=service.updateCarDetails(id,carName,brandName,model,fuelType,price);
	
			//success
			if (car != null) {
				List<CarPOJO>cars=service.findAllCars();
				map.addAttribute("cars", cars);
				map.addAttribute("msg", "Car Data updated successfully ");
				return "UpdateCar";
				
			}
			//fail
			List<CarPOJO>cars=service.findAllCars();
			map.addAttribute("cars", cars);
			map.addAttribute("msg", "Car Data not updated try again ...! ");
			return "UpdateCar";
			
		}
		map.addAttribute("msg","Session inactive");
		return " Login";
	}
	
	
}



