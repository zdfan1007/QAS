package org.ansj.similarity;

public class WordEntity {
	String word;//存储字符   
    float pValue;//存储该字符对应的频数或概率  
    public WordEntity() {     
        this.pValue=0;   
        this.word="";   
           
    }
    
    public void setpValue(float pValue){
    	this.pValue = pValue;
    }
    
   
    
    public float getPValue(){
    	return pValue;
    }
    
    public String getWord(){
    	return word;
    }
    
    public void setWord(String word){
    	this.word = word;
    }
}
