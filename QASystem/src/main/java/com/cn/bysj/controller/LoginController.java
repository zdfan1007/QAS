package com.cn.bysj.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cn.bysj.service.IPersonService;
import com.cn.bysj.core.utils.ResponseUtils;
import com.cn.bysj.pojo.Person;

@Controller  
@RequestMapping("/index")                        //父URL
public class LoginController {
	private static Logger logger = Logger.getLogger(LoginController.class); 
	@Autowired
	private IPersonService personService;
	
	@RequestMapping("/login")                    //子URL_1
    public String toIndex(){
        logger.debug("ws---0011--------");              
        return "login";                          //这里的login指login.jsp，包括登录和注册
    }

	@RequestMapping("/logincheck")                    //子URL_6  登录
    public String toLogincheck(){
        logger.debug("ws---0033--------");              
        return "logincheck";                          //这里的logincheck指logincheck.jsp
    }
	
//	@RequestMapping("/qlogincheck")	                //子URL_4
//	private String login(Person person,ModelMap modelMap){	
//		logger.debug("ws-----activatemail----person.getPassword();="+person.getPassword()+" email="+person.getMail());   
//		String result = this.personService.loginPerson(person);
//		if(result.equals("登录成功")){
//			 return "success";	                //这里的success指success.jsp
//		}
//		modelMap.addAttribute("result",result);
//		logger.debug("ws-----login----result="+result); 
//	    return "redirect:/index/inputquestion";		    //重定向到inputquestion
//	}
	
	@RequestMapping("/inputquestion")                    //子URL_6  进入主页面
    public String toInputquestion(){
        logger.debug("ws---0033--------");              
        return "inputquestion";                          //这里的inputquestion指inputquestion.jsp
    }
	
	@RequestMapping("/inputquestioncheck")                    //子URL_5
    public String toInputquestioncheck(){
        logger.debug("ws---0022--------");              
        return "inputquestioncheck";                          //这里的inputquestioncheck指inputquestioncheck.jsp
    }
	
	@RequestMapping("/outputanswer")                    //子URL_6  进入主页面
//	@ResponseBody
    public String toOutputanswer(){
        logger.debug("ws---0033--------");              
        return "outputanswer";                          //这里的outputanswer指outputanswer.jsp
    }
	
//	@RequestMapping("/person")                   //子URL_2
//	@ResponseBody
//	private Object register(Person person){
//	   logger.debug("ws--register-------"); 
//	   //person.setState(0);
//	   //System.out.println(ResponseUtils.sendSuccess(this.personService.registerPerson(person)));
//	   return ResponseUtils.sendSuccess(this.personService.registerPerson(person));		 
//	}
	
	@RequestMapping("/managerself")                    //子URL_6  进入主页面
    public String toManagerself(){
        logger.debug("ws---0033--------");              
        return "managerself";                          //这里的managerself指managerself.jsp
    }
	
	@RequestMapping("/managerselfcheck")                    //子URL_6  进入主页面
    public String toManagerselfcheck(){
        logger.debug("ws---0033--------");              
        return "managerselfcheck";                          //这里的managerselfcheck指managerselfcheck.jsp
    }
	
	@RequestMapping("/userquestionmanage")                    //子URL_5
    public String toUserquestionmanage(){
        logger.debug("ws---0022--------");              
        return "userquestionmanage";                          //这里的userquestionmanage指userquestionmanage.jsp
    }
	
	@RequestMapping("/userquestioncheck")                    //子URL_5
    public String toUserquestioncheck(){
        logger.debug("ws---0022--------");              
        return "userquestioncheck";                          //这里的userquestioncheck指userquestioncheck.jsp
    }
	
	@RequestMapping("/questionCheck")                    //子URL_5
    public String toQuestionCheck(){
        logger.debug("ws---0022--------");              
        return "questionCheck";                          //这里的questionCheck指questionCheck.jsp
    }
	
//	@RequestMapping("/managerself")                    //子URL_6  进入主页面
//	@ResponseBody
//    public String toManagerself(Person person,Model model){
//        logger.debug("ws---0033--------");   
//        //根据mail查询用户信息，并返回给前端页面
//        model.addAttribute("person",this.personService.getPersonByEMail(person));  
//        return "managerself";                          //这里的managerself指managerself.jsp
//    }
	
//	@RequestMapping("/failure")                    //子URL_6  登录失败返回登录页面
//    public String toFailure(){
//        logger.debug("ws---0033--------");              
//        return "failure";                          //这里的failure指failure.jsp
//    }
	
	@RequestMapping("/protocol")                    //子URL_5
    public String toProtocol(){
        logger.debug("ws---0022--------");              
        return "protocol";                          //这里的protocol指protocol.jsp
    }
	
	@RequestMapping("/person")                   //子URL_2
	@ResponseBody
	private Object register(Person person){
	   logger.debug("ws--register-------"); 
	   //person.setState(0);
	   //System.out.println(ResponseUtils.sendSuccess(this.personService.registerPerson(person)));
	   return ResponseUtils.sendSuccess(this.personService.registerPerson(person));		 
	}
	
	@RequestMapping("/adminlogin")                    //子URL_5
    public String toAdminlogin(){
        logger.debug("ws---0022--------");              
        return "adminlogin";                          //这里的adminlogin指adminlogin.jsp
    }
	
	@RequestMapping("/adminlogincheck")                    //子URL_5
    public String toAdminlogincheck(){
        logger.debug("ws---0022--------");              
        return "adminlogincheck";                          //这里的adminlogincheck指adminlogincheck.jsp
    }
	
	@RequestMapping("/managerkb")                    //子URL_5
    public String toManagerkb(){
        logger.debug("ws---0022--------");              
        return "managerkb";                          //这里的managerkb指managerkb.jsp
    }
	
//	@RequestMapping("/qlogincheck")  
//    public String toRegister(HttpServletRequest request,Model model){  
//        String personMail = String.valueOf(request.getParameter("mail"));  
//        Person person =  personService.registerPerson(personMail);  
//        model.addAttribute("person", person);  
//        return "qlogincheck";  
//    }
	
//	@RequestMapping("/activatemail")             //子URL_3
//	private String activatemail(String actiCode,String email){
//		 
//	    logger.debug("ws-----activatemail----actiCode="+actiCode+" email="+email); 
//	    Person person = new Person();
//		person.setActiCode(actiCode);
//		person.setMail(email);	
//		boolean isAc = this.personService.activatEmail(person);		
//
//		if(isAc){//激活成功，3秒跳转
//			return "activateCode";              //这里的activateCode指activateCode.jsp
//		}else{
//			//激活失败页面
//			 return "activateCode";	            //这里的activateCode指activateCode.jsp
//		}
//	}

}
