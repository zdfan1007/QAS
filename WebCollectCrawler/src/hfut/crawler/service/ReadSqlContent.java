package hfut.crawler.service;

import org.ansj.app.keyword.KeyWordComputer;
import org.ansj.app.keyword.Keyword;
import org.ansj.domain.Term;

import org.ansj.library.DicLibrary;
import org.ansj.splitWord.analysis.BaseAnalysis;
import org.ansj.splitWord.analysis.DicAnalysis;
import org.ansj.splitWord.analysis.NlpAnalysis;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import hfut.crawler.dbhelper.JDBCTemplate;
import org.springframework.jdbc.core.JdbcTemplate;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.sql.*;  
import java.util.ArrayList;
import java.util.List;

public class ReadSqlContent {
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
		    rs = stmt.executeQuery("select content from knowledge_data"); 
		    System.out.println("-----------------");
		    System.out.println("执行结果如下所示:");
		    System.out.println("-----------------");
		    String content = "";
		    while(rs.next()){ 
		        content = rs.getString("content");
		        // 首先使用ISO-8859-1字符集将name解码为字节序列并将结果存储新的字节数组中。
		        // 然后使用GB2312字符集解码指定的字节数组
		        // name = new String(name.getBytes("ISO-8859-1"),"GB2312");
		        newFile("bysj_content.txt",content);
		        System.out.println(content); 
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
		 
		 public static void newFile(String filePathAndName, String fileContent) {
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
		            myFile.println(fileContent);
		            //myFile.write("/r/n");
		            resultFile.close();
		        } 
		        catch (Exception e) {
		            e.printStackTrace();
		        }
		 }
}
