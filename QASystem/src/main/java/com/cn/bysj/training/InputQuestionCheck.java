package com.cn.bysj.training;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.ansj.app.keyword.KeyWordComputer;
import org.ansj.app.keyword.Keyword;
import org.ansj.recognition.impl.StopRecognition;
import org.ansj.splitWord.analysis.NlpAnalysis;

public class InputQuestionCheck {
    	
	public static String extractKeywords(String question){
		KeyWordComputer kwc = new KeyWordComputer(5,new NlpAnalysis());
		return kwc.computeArticleTfidf(question).toString();
	}
	
	
	
//	StopRecognition filter = new StopRecognition();
//    
//	filter.insertStopNatures("uj"); //过滤词性
//	filter.insertStopNatures("ul");
//	filter.insertStopNatures("null");
//	filter.insertStopWord("我"); //过滤单词
}
