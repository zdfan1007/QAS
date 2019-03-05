<%@ page language="java" import="java.sql.*,java.util.*,com.cn.bysj.pojo.Question,com.cn.bysj.jdbc.DbOperate" contentType="text/html;charset=utf-8"%>  
<%@ page import="com.cn.bysj.pojo.Person" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%  
 String path = request.getContextPath();  
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>managerkb</title>
    <meta name="keywords" content="QAS" />
    <meta name="description" content="QAS" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="<%=path%>/script/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/script/manager.js"></script>
    <script type="text/javascript" src="<%=path%>/script/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="<%=path%>/script/jquery.form.min.js"></script>
    
    <link href="<%=path%>/css/manager2.css" rel="stylesheet" type="text/css" />
    <link href="<%=path%>/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="<%=path%>/css/bootstrap-switch.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
</head> 

<body>

<%
    String email = (String)request.getSession().getAttribute("4");
	String sql = "select qid id, question, date, status from question where userEmail = ?";
	List<Question> questions = DbOperate.queryForList(sql, Question.class, "123456");
	//System.out.println(questions);
	//System.out.println(questions.get(1).getDate());
	pageContext.setAttribute("questions", questions);
	
	
	String sql1 = "select id, username, mail, state from person ";
	List<Person> persons = DbOperate.queryForList(sql1, Person.class);
	pageContext.setAttribute("persons", persons);
	//System.out.println(persons.size());
	//System.out.println(persons);
%>

<div class="banner"></div>
<div class="box">
	<ul class="fl_l">
	    <li class="active"><a href="##">用户管理</a></li>
		<li><a href="##">知识库管理</a></li>
		<li><a href="##">问题管理</a></li>
	</ul>
	
	<ul class="fl_r">
	    <li style="height: 500px;">
	        
	        <div class="widget">
	
                <div class="widget-head">
                  <div class="pull-left">用户信息</div>
                  
                  <div class="clearfix"></div>
                </div>
	
                <div class="widget-content">
                    <table class="table table-striped table-bordered table-hover">
	                    <thead>
	                      <tr>
	                        <th>id</th>
	                        <th>用户名</th>
	                        <th>用户邮箱</th>
	                        <th>账号状态</th>
	                        <th>操作</th>
	                      </tr>
	                    </thead>
	                    <tbody>
	                        <c:forEach var="person" items="${persons}">
								<tr>
									<c:if test="${person.state eq 1}">
										<td>${person.id}</td>
										<td>${person.username}</td>	
										<td>${person.mail}</td>
										<td>${person.state}</td>
										<td>
											<div data-bind="${person.id}" id="person_idContainer" class="visible-md visible-lg hidden-sm hidden-xs btn-group">
										        <button class="btn_delete_person btn btn-sm btn-danger">删除</button>														
											</div>
										</td>
									</c:if>
								</tr>
							</c:forEach>  
	                    </tbody>
                    </table>

					<div class="widget-foot">
						<ul class="pagination pull-right">
							<li><a href="#">Prev</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">Next</a></li>
						</ul>
						
						<div class="clearfix"></div> 
	
					</div>
                </div>
			</div>
	    </li>
	    
		<li style="height: 500px;padding: 10px 120px;">
		    <form class="form-horizontal" role="form" id="knowledgeForm">
	        
	            <div class="form-group">
	                <label class="col-lg-4 control-label">文本标题：</label>
	                <span id="msg" style="color:red"></span>
	                <div class="col-lg-8">
	                    <input type="text" name="title" class="form-control" placeholder="请输入标题" />
	                </div>
	            </div>
	            
	            <div class="form-group">
	                <label class="col-lg-4 control-label">文本内容：</label>
	                <div class="col-lg-8">
	                    <textarea name="content" class="form-control" rows="8" placeholder="请输入内容"></textarea>
	                </div>
	            </div>
	            
	            <div class="form-group">
	                <div class="col-lg-offset-4 col-lg-9">
	                    <button type="submit" class="btn_knowledge_add btn btn-success">添加</button>
	                    <button type="reset" class="btn btn-warning">重置</button>
	                </div>
	            </div>    
	        </form>
		</li>
	
		<li style="height: 500px;">

            <div class="widget">

                <div class="widget-head">
                  <div class="pull-left">用户提问记录</div>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="widget-content">
	
                 		 <table class="table table-striped table-bordered table-hover">
                           <thead>
                               <tr>
                                   <th>提问内容</th>
                                   <th>提问日期</th>
                                   <th>用户名</th>
                                   <th>操作</th>
                               </tr>
                           </thead>
                           <tbody>
                               <tr>
                                   <td>hello</td>
                                   <td>2012/02/01</td>
                                   <td>Staff</td>
                                   <td>
                                       <span class="badge badge-danger">Banned</span>
                                   </td>
                               </tr>
                               <tr>
                                   <td>world</td>
                                   <td>2012/02/01</td>
                                   <td>Admin</td>
                                   <td>
                                       <span class="badge badge-default">Inactive</span>
                                   </td>
                               </tr>
							<c:forEach var="question" items="${questions}">
								<tr>
									<c:if test="${question.status eq 1}">
								<td>${question.question}</td>
								<td><fmt:formatDate value="${question.date}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>	
								<td>${question.userEmail}</td>
								<td>
									<div data-bind="${question.id}" id="question_idContainer" class="visible-md visible-lg hidden-sm hidden-xs btn-group">
								        <button class="btn_delete_question btn btn-sm btn-danger">删除</button>														
									</div>
								</td>
								</c:if>
								</tr>
							 </c:forEach>
                               
                           </tbody>
                       </table>
                       <div class="widget-foot">
	
	                        <ul class="pagination pull-right">
	                          <li><a href="#">Prev</a></li>
	                          <li><a href="#">1</a></li>
	                          <li><a href="#">2</a></li>
	                          <li><a href="#">3</a></li>
	                          <li><a href="#">4</a></li>
	                          <li><a href="#">Next</a></li>
	                        </ul>
	                     
	                        <div class="clearfix"></div> 
	
	                    </div>
                   </div>
               </div>
		</li>	
	</ul>
	<div style="clear: both;"></div>
</div>
 	<!-- js import -->
    <script src="<%=path%>/script/question-manage.js"></script>
    <script src="<%=path%>/script/person-manage.js"></script>
    <script src="<%=path%>/script/knowledge-manage.js"></script>
</body>
</html>