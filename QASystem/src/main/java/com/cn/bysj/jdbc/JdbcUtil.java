package com.cn.bysj.jdbc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
//import java.io.InputStream;
//import java.util.Properties;
//import javax.sql.DataSource;
//import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JdbcUtil {
//	private static DataSource dataSource = null;
//	//数据库连接池应只被初始化一次，一个项目一般只用一个连接池
//	//且数据库连接池中的connection对象调用close()方法时，并不是真的关闭该连接
//	//只是将该连接归还到数据库连接池。
//	static{
//		dataSource = new ComboPooledDataSource("testC3P0");
//	}
	
//	/**
//	 * 获取数据库连接（1.从jdbc.properties文件加载数据库连接配置信息 2.从C3P0数据源获取连接.）
//	 * @return 
//	 * @throws IOException
//	 * @throws ClassNotFoundException
//	 * @throws SQLException
//	 */
//	public static Connection getConnection() throws IOException, ClassNotFoundException, SQLException{
//	    //从jdbc.properties文件加载数据库连接配置信息
//		Properties prop = new Properties();
//		InputStream inStream = JdbcUtil.class.getClassLoader().getResourceAsStream("jdbc.properties");
//		prop.load(inStream);
//		
//		String driver = prop.getProperty("driver");
//		String url = prop.getProperty("url");
//		String user = prop.getProperty("user");
//		String password = prop.getProperty("password");
//		
//		Class.forName(driver);
//		Connection conn = DriverManager.getConnection(url, user, password);
//		
//		return dataSource.getConnection();
//	}
//	/**
//	 * 获取DataSource
//	 * @return
//	 */
//	public static DataSource getDataSource(){
//		DataSource dataSource = null;
//		dataSource = new ComboPooledDataSource();
//		
//		return dataSource;
//	}
	
	/**
	 * 获取数据库连接
	 * @return 
	 * @throws IOException
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public static Connection getConnection() throws IOException, ClassNotFoundException, SQLException{
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/test";
	String user = "root";
	String password = "root";
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, password);
	
	return conn;
}
	
	/**
	 * 关闭数据库连接资源
	 * @param rs ResultSet，若不是select操作，则ResultSet为null
	 * @param st Statement，可以是Statement或者preparedStatement(statement的子类)
	 * @param conn Connection
	 */
	public static void releaseResource(ResultSet rs, Statement st, Connection conn){
		if(rs != null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(st != null){
			try {
				st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
