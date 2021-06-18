package com.tmeal.member;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

public class tmmemberbean {

	private String id;
	private String pw;
	private String pwck;
	private String name;
	private String phoneNumber;
	private String email;
	private String address;
	private String gender;
	private String birth;
	private Timestamp regdate;
	
	private String newpw;
	private String newpwck;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPwck() {
		return pwck;
	}
	public void setPwck(String pwck) {
		this.pwck = pwck;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getNewpw() {
		return newpw;
	}
	public void setNewpw(String newpw) {
		this.newpw = newpw;
	}
	public String getNewpwck() {
		return newpwck;
	}
	public void setNewpwck(String newpwck) {
		this.newpwck = newpwck;
	}
	@Override
	public String toString() {
		return "tmmemberbean [ id=" + id + ", pw=" + pw + ", pwck=" + pwck + ", name=" + name
				+ ", phoneNumber=" + phoneNumber + ", email=" + email + ", address=" + address + newpw + ", newpwck=" + newpwck + "]";
	}
	


	
	
}