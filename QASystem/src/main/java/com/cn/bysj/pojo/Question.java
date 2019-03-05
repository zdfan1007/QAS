package com.cn.bysj.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Question {
	
	private Integer id; //question id 自增
	private String question;//question内容
	private String userEmail;//用户
	private Date date;//提问时间
	private Integer status;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public Date getDate() {
//		String datePattern = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss").format(date);
//		return new SimpleDateFormat("YYYY-MM-dd HH:mm:ss").format(date);
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Question [id=" + id + ", question=" + question + ", userEmail=" + userEmail + ", date=" + date
				+ ", status=" + status + "]";
	}
	
	
}
