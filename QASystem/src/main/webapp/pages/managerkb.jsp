<%@ page language="java" import="java.sql.*,java.util.*,com.cn.bysj.pojo.*,com.cn.bysj.jdbc.DbOperate" contentType="text/html;charset=utf-8"%>  
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
    <meta http-equiv="pragma" content="no-cache" /> 
    <meta http-equiv="cache-control" content="no-cache" /> 
    <meta http-equiv="expires" content="0" />  
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="<%=path%>/script/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/script/manager.js"></script>
    <script type="text/javascript" src="<%=path%>/script/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="<%=path%>/script/jquery.form.min.js"></script>
    
    <link href="<%=path%>/css/manager2.css" rel="stylesheet" type="text/css" />
    <link href="<%=path%>/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="<%=path%>/css/bootstrap-switch.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/css/tablestyle.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/css/dataTables.bootstrap.css" type="text/css" />
</head> 

<body>
<%
	String sql1 = "select id, username, mail, state from person where state = 1";
	List<Person> persons = DbOperate.queryForList(sql1, Person.class);
	//System.out.println(questions);
	//System.out.println(questions.get(1).getDate());
	pageContext.setAttribute("persons", persons);
	//System.out.println(persons.size());
	//System.out.println(persons);
	
	String email = (String)request.getSession().getAttribute("4");
	String sql = "select qid id, question, date, userEmail, status from question_history where status = 1";
	List<Question> questions = DbOperate.queryForList(sql, Question.class);
	//System.out.println(questions);
	//System.out.println(questions.get(1).getDate());
	pageContext.setAttribute("questions", questions);
%>

<div class="banner"></div>
<div class="box">
	<ul class="fl_l">
	    <li class="active"><a href="##">用户管理</a></li>
		<li><a href="##">知识库更新</a></li>
		<li><a href="##">问题管理</a></li>
	</ul>
	
	<ul class="fl_r">
	    <li style="height: 500px;padding: 10px auto;">
	
	            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	 用户信息
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-person">
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
	    
		<li style="height: 400px;padding: 10px 120px;">
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
		
		<li style="height: 500px;padding: 10px auto;">
			<div class="app-body">

          		<!-- Main content -->
          		<main class="main">

            		<!-- Breadcrumb -->
            		<div class="container-fluid">
                		<div class="animated fadeIn">
                 
                    		<!--/.row-->
                    		<div class="row">
		                        <div class="col-lg-12">
		                            <div class="card">
		                                <div class="card-header">
		                                    <i class="fa fa-align-justify"></i>用户提问记录
		                                </div>
		                                <div class="card-block">
		                                    <table class="table table-bordered table-striped table-condensed" id="dataTables-question">
		                                        <thead>
		                                            <tr>
		                                                <th>提问内容</th>
		                                                <th>提问日期</th>
		                                                <th>用户名</th>
		                                                <th>操作</th>
		                                            </tr>
		                                        </thead>
		                                        <tbody>
													<c:forEach var="question" items="${questions}">
														<tr>
															
																<td>${question.question}</td>
																<td><fmt:formatDate value="${question.date}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>	
																<td>${question.userEmail}</td>
																<td>
																	<div data-bind="${question.id}" id="question_idContainer" class="visible-md visible-lg hidden-sm hidden-xs btn-group">
																        <button class="btn_delete_own btn btn-sm btn-danger">删除</button>														
																	</div>
																</td>
															
														</tr>
													</c:forEach>
		                                        </tbody>
		                                    </table>
		                                    
		                                </div>
		                            </div>
		                        </div>
                        		<!--/.col-->
                    		</div>
                    		<!--/.row-->
                		</div>
            		</div>
            		<!-- /.conainer-fluid -->
        		</main>
    		</div>
		</li>
	</ul>
	<div style="clear: both;"></div>
</div>
<script type="text/javascript" src="<%=path%>/script/question-manage.js"></script>
<script type="text/javascript" src="<%=path%>/script/person-manage.js"></script>
<script type="text/javascript" src="<%=path%>/script/knowledge-manage.js"></script>
 <!-- DATA TABLE SCRIPTS -->
<script src="<%=path%>/script/jquery.dataTable.js"></script>
<script src="<%=path%>/script/dataTable.bootstrap.js"></script>
<script>
        $(document).ready(function () {
            $('#dataTables-person').dataTable();
            $('#dataTables-question').dataTable();
        });
</script>

</body>
</html>