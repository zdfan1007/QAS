 package org.ansj.similarity;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

//加载同义词典
public class LoadSynonymsWord {
       public static Map<String,String> loadSynonymsWord(String filepath) throws IOException{
          Map<String,String> synonymsword = new HashMap<String,String>();
          BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(filepath),"utf-8"));
          String s = null;
          while ((s = br.readLine()) !=null) {
              String[] synonymsEnum = s.split("=");
              synonymsword.put(synonymsEnum[0], synonymsEnum[1]);
              synonymsword.put(synonymsEnum[1], synonymsEnum[0]);
            }
          br.close();
          return synonymsword;
          
       }
}

