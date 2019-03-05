package com.cn.bysj.training;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.ansj.app.keyword.KeyWordComputer;
import org.ansj.app.keyword.Keyword;

import com.ansj.vec.Word2VEC;
import com.cn.bysj.training.TextTool;

public class SimilarityBetweenQA {
   
//	public static void main(String[] args) throws IOException{
//		
//		   //String answerfileDirectory = "test_corpus/answers";    //答案库目录
//		   //String questionfilepath = "test_corpus/1.txt";   //问题文件
//		    
//		   String answerfilemodel = "library/bysj_titlekeywords.txt";   //答案库关键词文件
//		   int keywordsNum = 5;   //抽取关键词个数
//		   int topN = 5;   //获取排序前N个答案
//		   
//		   //1.生成答案库关键词文件
//		   //generateAnswersFile(answerfileDirectory,answerfilemodel,keywordsNum);  
//		   
//		    //2.加载Word2VEC模型
//			Word2VEC vec = new Word2VEC();
//			vec.loadJavaModel("library/corpus01_model");
//			
//			//3.读取答案库关键词文件，对关键词的词向量建模
//			Map<String,float[][]> answermodel = readAnswersFile(answerfilemodel,vec);
//			
//			//4.处理问题，进行建模
//			//String title = TextTool.readFile(questionfilepath);
//			String question = "汽车车外灯具的保养";
//			List<String> questionkeywordList = useANSJGetKeyWords(question,"",keywordsNum);
//			float[][] questionkeywordListMatrix = getKeywordsMatrixByWord2VEC(questionkeywordList,vec);
//			
//			//5.得到问题和答案库各文件余弦相似性计算结果
//			Map<String,Float> reslutMap = getCosResult(questionkeywordListMatrix,answermodel);
//			
//			//6.对相似性计算结果按相似性降序排列
//			//List<Entry<String,Float>> list = sortMap(reslutMap);
//			
//			LinkedHashMap<String,Float> topNResult = new LinkedHashMap<String,Float>(topN);
//			for(int i=0;i<topN;i++){
//				float sim = 0.0f;
//				String answer ="";
//				for(Map.Entry<String, Float> entity:reslutMap.entrySet()){
//					if(entity.getValue()>sim){
//						sim = entity.getValue();
//					    answer = entity.getKey();
//					}
//				}
//				topNResult.put(answer, sim);
//				reslutMap.remove(answer);   //很可能有问题
//			}
//			//7.输出TopN的结果
//			System.out.println("问题【"+question+"】的相关答案为：");
//			
//			for(Map.Entry<String, Float> entity:topNResult.entrySet()){
//				System.out.println(entity.getKey()+"\t相关度："+entity.getValue());
//			}
//	}
	
	//对Map按值降序排列
//     public static ArrayList<Map.Entry<String,Float>> sortMap(Map<String,Float> map){
//        List<Map.Entry<String, Float>> entries = new ArrayList<Map.Entry<String, Float>>(map.entrySet());
//        Collections.sort(entries, new Comparator<Map.Entry<String, Float>>() {
//            public int compare(Map.Entry<String, Float> obj1 , Map.Entry<String, Float> obj2) {
//                return obj2.getValue().intValue() - obj1.getValue().intValue();
//            }
//        });
//         return (ArrayList<Entry<String, Float>>) entries;
//     }
	
	//生成答案库关键词文件
//	public static void generateAnswersFile(String fileDirectory,String savefilepath,int keyordsNum) throws FileNotFoundException, IOException{
//		
//		ArrayList<String>  filepathlist = TextTool.readDirs(fileDirectory);   //读取目录及其子目录的的文件绝对路径
//		StringBuilder sb = new StringBuilder();
//		for(String filepath:filepathlist){
//			String fileName = new File(filepath).getName(); //获取带有后缀的文件名
//			String title = fileName.substring(0, fileName.indexOf(".")); //获取文件名
//			sb.append(title+" ");
//			List<String> keywordList = useANSJGetKeyWords(title,"",keyordsNum);
//			for(String keyword:keywordList){
//				sb.append(keyword+" ");
//			}
//			sb.append("\r\n");
//		}
//		TextTool.saveFile(sb.toString(), savefilepath);  //保存文件
//	}
	
	//读取答案库关键词文件，进行建模
	public static Map<String,float[][]> readAnswersFile(String filepath,Word2VEC vec) throws IOException{
		Map<String,float[][]> answers = new HashMap<String,float[][]>();
		
		 BufferedReader br = null;
	       br = new BufferedReader(new InputStreamReader(new FileInputStream(filepath), "UTF-8"));
	       String line = br.readLine();
	       while(line != null){
	    	     String[] str = line.split("\\s");
	    	     String[] keywordstr = new String[str.length-1];
	    	     for(int i=1;i<str.length;i++){
	    	    	 keywordstr[i-1] = str[i];
	    	     }
	    	     List<String> keywordList  = new ArrayList<String>(keywordstr.length);
	    	     keywordList = Arrays.asList(keywordstr);
	    	     float[][] keywordListMatrix = getKeywordsMatrixByWord2VEC(keywordList,vec);
	    	     answers.put(str[0], keywordListMatrix);
	             line = br.readLine(); 
	       }
	       br.close();
		
		return answers;
	}
	
	/**
	 * 提取关键词
	 * @param title 标题
	 * @param content 内容
	 * @param numkeyword 关键词数
	 * @return 关键词List
	 */
	public static List<String> useANSJGetKeyWords(String title,String content,int numkeyword){
		List<String> keywordList = new ArrayList<String>(numkeyword);
		KeyWordComputer kwc = new KeyWordComputer(numkeyword);
		Collection<Keyword> keywordCollection = kwc.computeArticleTfidf(title, content);
		for(Keyword keywordentity:keywordCollection){
			keywordList.add(keywordentity.getName());
		}
		return keywordList;
	}
	
	/**
	 * 返回余弦相似度计算的结果
	 * @param question   问题
	 * @param answers   答案Map
	 * @return
	 */
	public static Map<String,Float> getCosResult(float[][] question,Map<String,float[][]> answers){
		Map<String,Float> topNAnwsers = new HashMap<String,Float>();
		
       for(Map.Entry<String, float[][]>entry:answers.entrySet()){
    	   float cos_similarity = getSimilarity(question,entry.getValue());
           topNAnwsers.put(entry.getKey(), cos_similarity);
       }
       return topNAnwsers;
	}
	
	/**
	 * 构造关键词的二维矩阵
	 * @param keywordList 关键词List
	 * @param vec  Word2VEC加载模型
	 * @return 关键词二维矩阵float[][]
	 */
	public static float[][] getKeywordsMatrixByWord2VEC(List<String> keywordList,Word2VEC vec){

		float[][] keywordsMatrix = new float[keywordList.size()][200];
		int count= 0;
		for(String keyword:keywordList){
			float[] keywordVEC = new float[200];
			if(vec.getWordVector(keyword)!=null){     //只统计有词向量表示的关键词
					keywordVEC = vec.getWordVector(keyword);
					for(int i =0;i<keywordVEC.length;i++){
						keywordsMatrix[count][i] = keywordVEC[i];
					}
					count++;
		    }
	    }
		return keywordsMatrix;
	}
	
	/**
	 * 计算余弦相似性
	 * @param keywords1  默认为提问的句子关键词词向量组合
	 * @param keywords2  默认为答案的句子关键词词向量组合
	 * @return
	 */
	public static float getSimilarity(float[][] keywords1,float[][] keywords2){
		float avgSimilarity = 0.0f;
		float sum_cos = 0.0f;
		int num = keywords1.length;
		
		//用keywords1中关键词的词向量和keywords2中每个关键词的词向量计算余弦相似性，并取最大值
		for(int i=0;i<keywords1.length;i++){
			 
			 float every_max_cos = -10.0f;  
			 
			 for(int k =0;k<keywords2.length;k++){
				 
				    float cos = 0.0f,
				    element = 0.0f,  denominator1 = 0.0f, denominator2 = 0.0f;
				    
					for(int j=0;j<keywords1[i].length;j++){
						element += keywords1[i][j]*keywords2[k][j];
						denominator1 += keywords1[i][j]*keywords1[i][j];
						denominator2 += keywords2[k][j]*keywords2[k][j];
					}
					
					if(denominator1 * denominator2!=0) //保证分母不为零
					    cos =  (float)(element / Math.sqrt(denominator1 * denominator2));  //计算余弦相似性
					else
						cos = 0.0f;   //分母为零，则设置相似性为零
					
					if(cos>every_max_cos) //找出每个关键词余弦相似性计算的最大值
						every_max_cos = cos;
			 }
			 
//			 System.out.println(every_max_cos);
			 
			 if(every_max_cos==0)
				    num--;          //去除没有词向量的关键词计数,因为相似度为0的一定是无词向量的关键词计算产生的
			 
			 
			 if(every_max_cos<0)    //如果余弦相似性计算结果小于0,则把结果设置为零
					every_max_cos = 0.0f;
			 
			 sum_cos +=every_max_cos;    //统计所有有效关键词余弦值的和
			
	  }
		
		avgSimilarity = sum_cos/num;   //取计算结果的均值
		
		return avgSimilarity;
  }
	
}
