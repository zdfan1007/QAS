package com.cn.bysj.service.impl;

import java.security.NoSuchAlgorithmException;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.bysj.controller.LoginController;
import com.cn.bysj.dao.IPersonDao;
import com.cn.bysj.pojo.Person;
import com.cn.bysj.service.IPersonService;
import com.cn.bysj.core.utils.MailUtils;

@Service("personService")
public class PersonServiceImpl implements IPersonService {
//@Resource
@Autowired	
private IPersonDao personDao;
private static Logger logger = Logger.getLogger(LoginController.class); 

	public String registerPerson(Person person) {
 	
		if(null ==person.getUsername() || null ==person.getPassword() || null ==person.getMail()){		 
			 return "请补全信息！";
		 }
		
//		if(null != personDao.selectByUsername(person.getUsername())){
//			return "此用户名已经注册";
//		}
		if(null != personDao.selectByMail(person.getMail())){
			System.out.println(personDao.selectByMail(person.getMail()));
			return "该邮箱已注册成功！请登录";
		}
					
//			try {
//			person=	MailUtils.sendMail(person);
//			} catch (AddressException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (NoSuchAlgorithmException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (MessagingException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			
			if(this.personDao.insert(person) == -1){
				return "注册失败！";
			}else{
				return "注册成功啦！请登录";
			}
		
		
	}
	
	public String displayInfo(Person person){
		return personDao.selectByMail(person.getMail()).toString();
	}

	public String loginPerson(Person person) {
		Person personEnty = personDao.selectByPwdAndEmail(person);
		if(null == personEnty){
			return "账号或密码错误！";
		}
		
		if(personEnty.getState() ==0){
			return "账号未激活";
		}
		
		
		return "登录成功";
	}

	public boolean activatEmail(Person person) {
			
		Person personEnty = personDao.selectByCodeAndEmail(person);
		if(null !=personEnty && personEnty.getState()==0 ){//如果存在，且未激活，则激活。修改数据库
		   personEnty.setState(1);	   
		   if(-1 != personDao.updateStateByCode(personEnty)){
			   //修改数据状态成功，可登录
			   logger.debug("ws--activatEmail----成功---");
			   return true;
		   }else {
			   logger.debug("ws--activatEmail----updateStateByCode失败---");
		   }
		   
		}		 
		return false;
	}
	
	public String getPersonByEMail(Person person){
		Person personEnty = personDao.selectByEMail(person);
	    System.out.println(this.personDao.selectByEMail(person));
	    if(null == personEnty){
	    	return"请先注册";
	    }
	    return "修改成功";
	}

}
