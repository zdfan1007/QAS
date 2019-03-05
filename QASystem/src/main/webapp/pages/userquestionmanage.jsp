<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"  %>
<%@ page import="com.cn.bysj.pojo.Question" %>
<%@ page import="com.cn.bysj.jdbc.DbOperate" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>userquestionmanage</title>
    <meta name="questionmanager" content="QAS" />
    <meta name="description" content="QAS" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="<%=path%>/script/jquery-1.9.0.min.js"></script>
    <link href="<%=path%>/css/tablestyle.css" rel="stylesheet" type="text/css" />
    <link href="<%=path%>/css/dataTables.bootstrap.css" type="text/css" />
</head>

<body class="app header-fixed sidebar-fixed aside-menu-fixed aside-menu-hidden">

<%
    String email = (String)request.getSession().getAttribute("4");
	String sql = "select qid id, question, date, status from question_history where userEmail = ? and status = 1";
	List<Question> questions = DbOperate.queryForList(sql, Question.class, email);
	//System.out.println(questions);
	//System.out.println(questions.get(1).getDate());
	pageContext.setAttribute("questions", questions);
	//pageContext.setAttribute("userquestion", questions.get(1));
%>   

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
                                    <i class="fa fa-align-justify"></i> 我的提问记录
                                </div>
                                <div class="card-block">
                                    <table class="table table-bordered table-striped table-condensed" id="dataTables-userquestion">
                                        <thead>
                                            <tr>
                                                <th>提问内容</th>
                                                <th>提问日期</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>
											<c:forEach var="question" items="${questions}">
												<tr>
														<td>${question.question}</td>
														<td><fmt:formatDate value="${question.date}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>	
														<td>
															<div data-bind="${question.id}" id="userquestion_idContainer" class="visible-md visible-lg hidden-sm hidden-xs btn-group">
														        <button class="btn_check_own btn btn-sm btn-danger">查看</button>														
															</div>
														</td>
												</tr>
											</c:forEach>
                                        </tbody>
                                    </table>
                                    <a href="inputquestion" class="zcxy" target="_self" style="text-align:center;clear:both;font-color:red;">返 回 </a>
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
    
    <!-- js import -->
    <script src="<%=path%>/script/userquestionmanage.js"></script>
	<!-- DATA TABLE SCRIPTS -->
	<script src="<%=path%>/script/jquery.dataTables.js"></script>
	<script src="<%=path%>/script/dataTables.bootstrap.js"></script>
	<script>
        $(document).ready(function () {
            $('#dataTables-userquestion').dataTable();
        });
	</script>
	
</body>
</html>