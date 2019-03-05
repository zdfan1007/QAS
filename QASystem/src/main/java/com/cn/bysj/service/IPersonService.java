package com.cn.bysj.service;

import com.cn.bysj.pojo.Person;

public interface IPersonService {
	
	public String registerPerson(Person person);
	
	public String loginPerson(Person person);

	public boolean activatEmail(Person person);

	public String getPersonByEMail(Person person);  
}
