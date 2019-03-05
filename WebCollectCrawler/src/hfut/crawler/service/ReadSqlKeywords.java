package hfut.crawler.service;

import java.io.*;
import java.sql.*;

public class ReadSqlKeywords {
    
	public static void main(String[] args){ 
	    Connection conn=null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
		    Class.forName("com.mysql.jdbc.Driver");
		    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
		    stmt = conn.createStatement();
		}
		catch (ClassNotFoundException e) {
		    e.printStackTrace();
		}
		catch (SQLException ex) {
		    System.out.println("SQLException: " + ex.getMessage());
		    System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
		}
		// 要执行的SQL语句
		try{
		    rs = stmt.executeQuery("select title,keywords from knowledge_data"); 
		    String title = "";
		    String keywords = "";
		    while(rs.next()){ 
		    	title = rs.getString("title");
		    	keywords = rs.getString("keywords");
		        newFile("bysj_titlekeywords.txt",title,keywords);
		        System.out.println(keywords); 
		   }
		   rs.close(); 
		   conn.close();
	   }
	   catch(SQLException e) {
	       e.printStackTrace();  
	   } catch(Exception e) { 
		   e.printStackTrace(); 
	   } 
    } 
		 
		 public static void newFile(String filePathAndName,String fileTitle, String fileContent) {
		        try {
		            File myFilePath = new File(filePathAndName.toString());
		            if (!myFilePath.exists()) { // 如果该文件不存在,则创建
		                myFilePath.createNewFile();
		            }
		            //FileWriter(myFilePath, true); 实现不覆盖追加到文件里
		            //FileWriter(myFilePath); 覆盖掉原来的内容
		            FileWriter resultFile = new FileWriter(myFilePath, true);
		            PrintWriter myFile = new PrintWriter(resultFile);
		            // 给文件里面写内容,原来的会覆盖掉
		            myFile.println(fileTitle+" "+fileContent);
		            //myFile.write("/r/n");
		            resultFile.close();
		        } 
		        catch (Exception e) {
		            e.printStackTrace();
		        }
		 }
}
