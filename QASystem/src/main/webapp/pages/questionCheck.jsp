<%@page import="com.cn.bysj.jdbc.DbOperate"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>questionCheck</title> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="<%=path%>/css/outputanswer2.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=path%>/script/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/script/outputanswer.js"></script>
    <script src="<%=path%>/script/userquestionmanage.js"></script>
</head> 

<body>  
<%  
    request.setCharacterEncoding("utf-8");
	//获取ajax传递过来的question和id
	String id = request.getParameter("id");
	//System.out.println(id);
	
	String sql = "select question from question_history where qid = ?";
	String userquestion = (String)DbOperate.queryForParam(sql, id);
	//System.out.println(userquestion);
	
	//1.引入答案库关键词文件
    String answerfilemodel = "D:/workspace/workspace-sts-3.7.0.RELEASE/QASystem/library/bysj_titlekeywords.txt";   //答案库关键词文件
    int keywordsNum = 5;   //抽取关键词个数
    int topN = 3;   //获取排序前N个答案
    
    //2.加载Word2VEC模型
    Word2VEC vec = new Word2VEC();
    vec.loadJavaModel("D:/workspace/workspace-sts-3.7.0.RELEASE/QASystem/library/corpus01_model");
    
    //3.读取答案库关键词文件，对关键词的词向量建模
    Map<String,float[][]> answermodel = SimilarityBetweenQA.readAnswersFile(answerfilemodel,vec);
    
    //4.处理问题，进行建模
    List<String> questionkeywordList = SimilarityBetweenQA.useANSJGetKeyWords(userquestion,null,keywordsNum);
    float[][] questionkeywordListMatrix = SimilarityBetweenQA.getKeywordsMatrixByWord2VEC(questionkeywordList,vec);
    
    //5.得到问题和答案库各文件余弦相似性计算结果
    Map<String,Float> resultMap = SimilarityBetweenQA.getCosResult(questionkeywordListMatrix,answermodel);
    
    //6.对相似性计算结果按相似性降序排列
    LinkedHashMap<String,Float> topNResult = new LinkedHashMap<String,Float>(topN);
	for(int i=0;i<topN;i++){
		float sim = 0.0f;
		String title ="";
		for(Map.Entry<String, Float> entity:resultMap.entrySet()){
			if(entity.getValue()>sim){
				sim = entity.getValue();
			    title = entity.getKey();
			}
		}
		if(sim >= 0.6){
			topNResult.put(title, sim);
		}
		resultMap.remove(title);   //很可能有问题
		pageContext.setAttribute("topNResult", topNResult);
	}
	
	////answer中按相似度降序存放Entry<String, Float> --> content的键值对
	////Entry<String, Float>里面是title和对应的相似度，每一个entry对应着一个content
	//LinkedHashMap<Map.Entry<String, Float>,String> answer = new LinkedHashMap<>(topN);
	//String sql0 = "select content from knowledge_data where title = ?";
	//for(Map.Entry<String, Float> entry : topNResult.entrySet()){
	//	//依次根据title从数据库select获得content，并和entry一起存入answer
	//	String content = (String) DbOperate.queryForParam(sql0, entry.getKey());
	//	answer.put(entry, content);
	//}
%>

<h1><%=userquestion%></h1>
<div class="out">
    <div class="web_qr_login" id="web_qr_login">
      <c:if test="${not empty topNResult }">
        <label class="input-tips">
        
            <%
            //7.输出TopN的结果
            int i = 0;
            String[] title = {"title1","title2","title3"};
            String[] answer = {"answer1","answer2","answer3"};
            String[] showdiv = {"showdiv1","showdiv2","showdiv3"};
            String[] showbox = {"showbox1","showbox2","showbox3"};
            String[] mainlist = {"mainlist1","mainlist2","mainlist3"};
            for(Map.Entry<String, Float> entity:topNResult.entrySet()){
                String str1 = i+1+".";
                String str2 = "相关度："+entity.getValue();
                //数据库表中查询title所对应的答案
        		//1. create sql
                String sql2 = "select content from knowledge_data where title=?";
                //2. 执行sql语句,并传入参数
                session.setAttribute(title[i],entity.getKey());
                String ans0 = (String)DbOperate.queryForParam(sql2, entity.getKey());
                String ans1 = ans0.replaceAll("； ", ";<br/>&nbsp;&nbsp;");
                String ans2 = ans1.replaceAll("： ", ":<br/>&nbsp;&nbsp;");
                String ansfinal = ans2.replaceAll("。 ", "。<br/>&nbsp;&nbsp;");
                session.setAttribute(answer[i],ansfinal);
            %>
            <div class=<%=showdiv[i]%>>
                <%=str1%>
                <a href = "#">&nbsp;&nbsp;<%=session.getAttribute(title[i])%></a>&nbsp;&nbsp;&nbsp;&nbsp;<%=str2%>
                <br/>
            </div>
            
            <div class=<%=showbox[i]%> style="display: none;">
                <h2><%=session.getAttribute(title[i])%><a class="close" href="#">关闭</a></h2>
                <div class=<%=mainlist[i]%>>
                    <p><%=session.getAttribute(answer[i])%></p>
                </div>
            </div>
            <%
	            i++;
	        }
            %>
            <!-- <div id="zhezhao"></div> -->
        </label>
      </c:if>
      <c:if test="${empty topNResult }">
      	<h3>对不起，您搜索的问题在知识库中没有找到对应的答案！</h3>
      </c:if>
      
    </div>
    <div style="text-align:center;clear:both;padding:20px">
    	<p><a href="userquestionmanage" target="_self"> 返 回</a></p>
	</div>
</div>

</body>  
</html> 