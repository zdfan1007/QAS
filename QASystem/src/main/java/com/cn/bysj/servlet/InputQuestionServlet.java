package com.cn.bysj.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ansj.vec.Word2VEC;
import com.cn.bysj.jdbc.DbOperate;
import com.cn.bysj.training.SimilarityBetweenQA;

public class InputQuestionServlet extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
		//设置处理完之后跳转的结果展示页面路径
		String path = "answershow.jsp";
		//设置页面字符编码
		req.setCharacterEncoding("UTF-8");
		//获取session，并获得用户邮箱(邮箱和问题ID共同作为用户提问表的主键)
		HttpSession session = req.getSession();
		String email = (String) session.getAttribute("4");
		//获取用户提问的问题
		String question = req.getParameter("question");  //和inputquestion.jsp中input标签里面的name名一致
		
		
		//将用户提问内容记录到数据表中
		//1. create sql
		String sql = "insert into question_history(question,date,userEmail) values(?,?,?)";
		//2. 执行insert,并传入参数
		int result = DbOperate.update(sql, question, new Date(), email);
		
		
		
		//相似度计算核心模块
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
	    List<String> questionkeywordList = SimilarityBetweenQA.useANSJGetKeyWords(question,null,keywordsNum);
	    float[][] questionkeywordListMatrix = SimilarityBetweenQA.getKeywordsMatrixByWord2VEC(questionkeywordList,vec);
	    
	    //5.得到问题和答案库各文件余弦相似性计算结果
	    Map<String,Float> reslutMap = SimilarityBetweenQA.getCosResult(questionkeywordListMatrix,answermodel);
	    
	    //6.对相似性计算结果按相似性降序排列
	    LinkedHashMap<String,Float> topNResult = new LinkedHashMap<String,Float>(topN);
		for(int i=0;i<topN;i++){
			float sim = 0.0f;
			String answer ="";
			for(Map.Entry<String, Float> entity:reslutMap.entrySet()){
				if(entity.getValue()>sim){
					sim = entity.getValue();
				    answer = entity.getKey();
				}
			}
			topNResult.put(answer, sim);
			reslutMap.remove(answer);   //很可能有问题
		}
		
		
		
		
		//将问题和结果传递到answershow页面进行展示
		req.setAttribute("topNResult", topNResult);
		req.setAttribute("question", question);
		//设置页面跳转并传参
		req.getRequestDispatcher(path).forward(req, resp);
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
		this.doPost(req, resp);//調用doPost操作
	}
	
}
