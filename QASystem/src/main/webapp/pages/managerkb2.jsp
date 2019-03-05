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
    
    <link href="<%=path%>/css/dataTables.bootstrap.css" type="text/css" />
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
	
	            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Advanced Tables
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
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
                                        <tr>
                                            <td>Trident</td>
                                            <td>Internet Explorer 4.0</td>
                                            <td>Win 95+</td>
                                            <td>4</td>
                                            <td>X</td>
                                        </tr>
                                        <tr>
                                            <td>Trident</td>
                                            <td>Internet Explorer 5.0</td>
                                            <td>Win 95+</td>
                                            <td>5</td>
                                            <td>C</td>
                                        </tr>
                                        <tr>
                                            <td>Trident</td>
                                            <td>Internet Explorer 5.5</td>
                                            <td>Win 95+</td>
                                            <td>5.5</td>
                                            <td>A</td>
                                        </tr>
                                        <tr>
                                            <td>Trident</td>
                                            <td>Internet Explorer 6</td>
                                            <td>Win 98+</td>
                                            <td>6</td>
                                            <td>A</td>
                                        </tr>
                                        <tr>
                                            <td>Trident</td>
                                            <td>Internet Explorer 7</td>
                                            <td>Win XP SP2+</td>
                                            <td>7</td>
                                            <td>A</td>
                                        </tr>
                                        <tr>
                                            <td>Trident</td>
                                            <td>AOL browser (AOL desktop)</td>
                                            <td>Win XP</td>
                                            <td>6</td>
                                            <td>A</td>
                                        </tr>
                                        <tr>
                                            <td>Gecko</td>
                                            <td>Firefox 1.0</td>
                                            <td>Win 98+ / OSX.2+</td>
                                            <td>1.7</td>
                                            <td>A</td>
                                        </tr>
                                        <tr>
                                            <td>Gecko</td>
                                            <td>Firefox 1.5</td>
                                            <td>Win 98+ / OSX.2+</td>
                                            <td>1.8</td>
                                            <td>A</td>
                                        </tr>
                                        <tr>
                                            <td>Gecko</td>
                                            <td>Firefox 2.0</td>
                                            <td>Win 98+ / OSX.2+</td>
                                            <td>1.8</td>
                                            <td>A</td>
                                        </tr>
                                        <tr>
                                            <td>Gecko</td>
                                            <td>Firefox 3.0</td>
                                            <td>Win 2k+ / OSX.3+</td>
                                            <td>1.9</td>
                                            <td>A</td>
                                        </tr>
                                        <tr>
                                            <td>Gecko</td>
                                            <td>Camino 1.0</td>
                                            <td>OSX.2+</td>
                                            <td>1.8</td>
                                            <td>A</td>
                                        </tr>
                                        
                                    <c:forEach var="person" items="${persons}">
										<tr>
											
												<td>${person.id}</td>
												<td>${person.username}</td>	
												<td>${person.mail}</td>
												<td>${person.state}</td>
												<td>
													<div data-bind="${person.id}" id="person_idContainer" class="visible-md visible-lg hidden-sm hidden-xs btn-group">
												        <button class="btn_delete_person btn btn-sm btn-danger">删除</button>														
													</div>
												</td>
											
										</tr>
									</c:forEach>  
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
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
    
     <!-- DATA TABLE SCRIPTS -->
    <script src="<%=path%>/script/jquery.dataTables.js"></script>
    <script src="<%=path%>/script/dataTables.bootstrap.js"></script>
    <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
	</script>
    
</body>
</html>