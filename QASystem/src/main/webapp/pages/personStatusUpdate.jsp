<%@page import="com.cn.bysj.jdbc.DbOperate"%>
<%@ page 
  language="java" 
  import="java.io.*,java.util.*,com.cn.bysj.training.SimilarityBetweenQA,com.ansj.vec.Word2VEC,org.ansj.app.keyword.KeyWordComputer,org.ansj.splitWord.analysis.NlpAnalysis" 
  contentType="text/html;charset=utf-8"%>  
<%  
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>personStatusUpdate</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head> 

<body>  
<%  
    request.setCharacterEncoding("utf-8");
	//获取ajax传递过来的question的status和id
	String status = request.getParameter("status");
	System.out.println(status);
	String id = request.getParameter("id");
	System.out.println(id);
	
	//将question status更新为0，表示用户以删除该记录
	String sql = "update person set state = 0 where id = ?";
    DbOperate.update(sql, id);
	
	
%>  
  
  
    <!--           
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
                                       -->       
                                            
                                            
  
  
  
</body>  
</html> 