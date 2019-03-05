package org.ansj.similarity;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

import org.ansj.domain.Result;
import org.ansj.splitWord.analysis.NlpAnalysis;

public class Jaccard_Distance {

public static void main(String[] args) throws FileNotFoundException, IOException{
		
		Map<String,String> map = LoadSynonymsWord.loadSynonymsWord("library/synonyms.dict"); //加载同义词典
		
		ArrayList<WordEntity> enList1=new ArrayList<WordEntity>(); 
		enList1 = CalcuP("F:\\4年级信管\\毕业设计\\语料\\2.txt");
		enList1.remove(0); //移除空元素
		ArrayList<WordEntity> enList2=new ArrayList<WordEntity>(); 
		enList2 = CalcuP("F:\\4年级信管\\毕业设计\\语料\\2.txt");
		enList2.remove(0);  //移除空元素
		System.out.println("文本相似性为："+jaccard_distance(enList1,enList2,map));
	}
	
       //调用ANSJ分词
        public static String useANSJSegment(String content){
	
	        Result parseR = NlpAnalysis.parse(content);
			StringBuilder builder = new StringBuilder();
			builder .append(parseR.toStringWithOutNature(" "));
//		    System.out.println(builder.toString());
			return builder.toString();
	    }

	/**
	 * 计算两个集合的Jaccard系数
	 * @param list1
	 * @param list2
	 * @return
	 */
	public static float jaccard_distance(ArrayList<WordEntity>list1,ArrayList<WordEntity>list2,Map<String,String> map){
		int intersectionNum =0;  //共同特征项的个数
		
//		Iterator<WordEntity> int1 = list1.iterator();
//		Iterator<WordEntity>int2 = list2.iterator();
//		while(int1.hasNext()){
//			String word1 = int1.next().getWord();
//			while(int2.hasNext()){
//				String word2 = int2.next().getWord();
//				if(word1.equals(word2)||(map.get(word1)!=null&&map.get(word1).equals(word2))){
//					intersectionNum++;
//				}
//			}
//		}
		
		for(WordEntity wordentity1:list1){
			String word1 = wordentity1.getWord(); 
			for(WordEntity wordentity2:list2){
				String word2 = wordentity2.getWord(); 
				if(word1.equals(word2)||(map.get(word1)!=null&&map.get(word1).equals(word2))){
					intersectionNum++;
				}
			}
		}
		
		
		int mm = list1.size()+list2.size()-intersectionNum;
		float jaccard = (float)intersectionNum/mm;
		return jaccard;
	}
	
	/**
     * 文本分词，获取特征项及频率
     */
	public static ArrayList<WordEntity> CalcuP(String file) throws FileNotFoundException, IOException {   
		
		//以词为单位计算相对熵   
		String content = TextTool.readFile(file);
		String result = useANSJSegment(content);   
		
        //以字为单位计算相对熵   
//        String result=CutTextBySingleCharacter.cutTextSingleCharacter( file);   
		
        String[] words=result.split("\\s");   
           
        ArrayList<WordEntity> enList=new ArrayList<WordEntity>(); 
        
        for(String w: words) {  
        	w=w.trim();   
            WordEntity en=new WordEntity();   
            en.word=w;   
            en.pValue=1;   
            
            enList.add(en);   
            //System.out.println(w);   
        }   
       
//        float total=enList.size();   
        for(int i=0;i<enList.size()-1;i++){    
            if(!enList.get(i).word.isEmpty()){   
                for(int j=i+1;j<enList.size();j++){   
                    if(enList.get(i).word.equals(enList.get(j).word)){   
                        enList.get(i).pValue++;   
                        enList.get(j).pValue=0;   
                        enList.get(j).word="";   
                    }   
                }   
            }   
        }   
        
        for(int i=enList.size()-1;i>=0;i--){   
            if(enList.get(i).pValue<1.0)   
                enList.remove(i);   
        }
            
       return enList;   
    }  
}
