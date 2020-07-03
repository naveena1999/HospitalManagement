package com.login.bean;

public class PatientRegistration {
	//private String email;
	private String patientname;
	private String address;
	private String city;
	private String state;
	private String age;
	private String patientssnid;
	public String getTypeofbed() {
		return typeofbed;
	}
	public void setTypeofbed(String typeofbed) {
		this.typeofbed = typeofbed;
	}
	private String typeofbed;
	
	public String getPatientname() {
		return patientname;
	}
	public void setPatientname(String patientname) {
		this.patientname = patientname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getPatientssnid() {
		return patientssnid;
	}
	public void setPatientssnid(String patientssnid) {
		this.patientssnid = patientssnid;
	}
}