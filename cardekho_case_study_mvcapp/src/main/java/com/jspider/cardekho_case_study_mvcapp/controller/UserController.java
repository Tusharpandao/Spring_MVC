package com.jspider.cardekho_case_study_mvcapp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jspider.cardekho_case_study_mvcapp.pojo.UserPOJO;
import com.jspider.cardekho_case_study_mvcapp.service.UserService;



@Controller
public class UserController {
	@Autowired
	private UserService service;

	@GetMapping("/createAccount")
	public String createAccountPage() {
		return "CreateAccount";
	}
	
	@PostMapping("/createAccount")
	public String createAccount(@RequestParam String username,@RequestParam String password,
							@RequestParam String name,@RequestParam long mobile,@RequestParam String email
							,ModelMap map) {
		UserPOJO pojo = service.createAccount(username,password,name,mobile,email);
		
		//Success
		if (pojo != null) {
			map.addAttribute("msg", "Account created successfully Login to procced..!");
			return "Login";
		}
		
		//Failure
		map.addAttribute("msg", "Account allready Exists  login to procced..!");
		return "Login";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam String username,@RequestParam String password,ModelMap map , HttpSession session) {
		
		UserPOJO pojo = service.login(username, password);
		//Success
		if (pojo != null) {
			
			session.setAttribute("login", pojo);
			session.setMaxInactiveInterval(60);
			return "Home";
		}
		//fial
		map.addAttribute("msg", "Invalid username or password..!");
		return "Login";
	}
	@GetMapping("/forgotpassword")
	public String forgotPassword() {
		return "ForgotPassWord";
	}
	@PostMapping("/forgotPassword")
	public String forgotPass(@RequestParam  String username, @RequestParam long mobile,@RequestParam String email) {
		
		UserPOJO user=service.forgotPassWord(username,mobile,email);
		
		return "Login";
	}
	
	//Logout Controller
		@GetMapping("/logout")
		public String logout(ModelMap map, HttpSession session) {
			session.invalidate();
			map.addAttribute("msg","Logged out  successfully");
			return "Login";
		}


	
}
