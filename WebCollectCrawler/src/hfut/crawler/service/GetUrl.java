package hfut.crawler.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
//import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class GetUrl {
    public static String getURLContent(String urlStr){
        StringBuffer restUrl = new StringBuffer();
        try {
            URL url = new URL(urlStr);

            BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
            String str = null;

            while ((str = br.readLine()) != null) {
            	restUrl.append(str);
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //System.out.println(restUrl.toString());
        return restUrl.toString();
    }

    public static ArrayList<String> getMatherSubstrs(String restStr) {
    	
    	String regexStr = "href=\"(.+?)\"";
    	//String regexStr = "[a-z0-9-/]{1,}\\.htm";
        Pattern pattern = Pattern.compile(regexStr);
        Matcher matcher = pattern.matcher(restStr);
        ArrayList<String> restList = new ArrayList<String>();
        while(matcher.find()){
            //System.out.println(mather.group());
            //System.out.println(mather.group(1));
            restList.add(matcher.group(1));
        }

        return restList;
    }

    public static void main(String[] args) throws IOException {
    	String[] classifiedStr =new String[]{"fdj","csfj","dpxt","rcby","dqsb","ylsy","qcmr"};
    	BufferedWriter bufw=new BufferedWriter(new FileWriter(new File("getUrl.txt")));
    	for(int i =0;i<classifiedStr.length;i++){
    	    String urlStr = "http://www.qcwxjs.com/html/xiaozhishi/"+classifiedStr[i]+"/index.htm";
    	    String restUrl = getURLContent(urlStr);
    	    ArrayList<String> list = getMatherSubstrs(restUrl);
    	
    	    for (String temp : list) {
    	    	if (temp.contains("..")==false && temp.contains("www")==false) {
    	            String weburl = "http://www.qcwxjs.com/html/xiaozhishi/"+classifiedStr[i]+"/"+temp;
    	            bufw.write(weburl);
                    bufw.newLine();
                    bufw.flush();
    	    	}
    	    }
    	}
    	bufw.close();
    }
}

