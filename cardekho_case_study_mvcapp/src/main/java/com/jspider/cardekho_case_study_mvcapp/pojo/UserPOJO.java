package com.jspider.cardekho_case_study_mvcapp.pojo;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class UserPOJO {
	@Id
	private String username;
	private String passworld;
	private String name;
	private long mobile;
	private String email;
	

}
