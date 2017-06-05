package com.eataholic.model;

import javax.persistence.*; 

@Entity  
@Table(name="Users")  
public class Users {
	private String userName;
	private String passCode;
	private String email;
	private String description;
	private String profil;
	private String gender;
	
	@Id
	@Column(name = "userName")  
	public String getUserName(){  
		return userName;
	}
	public void setUserName(String userName){
		this.userName=userName;
	}
	@Column(name = "passCode")  
	public String getPassCode(){
		return passCode;
	}
	public void setPassCode(String passCode){
		this.passCode=passCode;
	}
	@Column(name = "eamil")  
	public String getEmail(){
		return email;
	}
	public void setEmail(String email){
		this.email=email;
	}
	@Column(name = "description") 
	public String getDescription(){
		return description;
	}
	public void setDescription(String description){
		this.description=description;
	}
	@Column(name = "profil") 
	public String getProfil(){
		return profil;
	}
	public void setProfil(String profil){
		this.profil=profil;
	}
	@Column(name = "gender") 
	public String getGender(){
		return gender;
	}
	public void setGender(String gender){
		this.gender=gender;
	}
	
}
