package com.cn.bysj.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConversionException;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

import com.cn.bysj.jdbc.JdbcUtil;

public class DbOperate {
	/**
	 * 执行数据库更新操作，包括：delete、insert、update
	 * @param sql 不带通配符的sql语句
	 * @return result 返回一个int，代表受影响的行数，默认返回0，即更新失败
	 */
	public static int update(String sql){
		int result = 0;
		Connection conn = null;
		PreparedStatement pst = null;
		try{
			conn = JdbcUtil.getConnection();
			pst = conn.prepareStatement(sql);
			result = pst.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JdbcUtil.releaseResource(null, pst, conn);
		}
		return result;
	}
	
	/**
	 * 执行数据库更新操作，包括：delete、insert、update
	 * @param sql 带占位符的sql语句
	 * @param args 可变参数，与sql语句的占位符对应，逗号隔开
	 * @return result 返回一个int，代表受影响的行数，默认返回0，即更新失败
	 */
	public static int update(String sql, Object ... args){
		int result = 0;
		Connection conn = null;
		PreparedStatement pst = null;
		try{
			conn = JdbcUtil.getConnection();
			pst = conn.prepareStatement(sql);
			for(int i = 0; i < args.length; i++){
				pst.setObject(i + 1, args[i]);
			}
			result = pst.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JdbcUtil.releaseResource(null, pst, conn);
		}
		return result;
	}
	
	//以下query方法大部分用到泛型，以面向对象的思想对数据库查询结果进行了封装
	//要求所有的非连接型数据库表都有对应的实体类，即POJO(plain ordinary java object)
	//因为只有对实体的表述和getter、setter，不涉及任何业务操作，所以称之为POJO
	//这也就可以理解为MVC中的M，即模型层
	
	/**
	 * 查询并返回单条数据的封装对象
	 * @param sql 待填充的sql语句
	 * @param clazz 要封装的对象类型
	 * @param args sql语句参数
	 * @return entity 
	 */
	public static <T> T queryForObject(String sql, Class<T> clazz, Object ... args){
		T entity = null;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try{
			conn = JdbcUtil.getConnection();
			pst = conn.prepareStatement(sql);
			for(int i = 0; i < args.length; i++){
				pst.setObject(i + 1, args[i]);
			}
			rs = pst.executeQuery();
			List<String> columnLabels = getColumnLabels(rs);
			
			if(rs.next()){
				if(rs.isLast()){
					entity = clazz.newInstance();
					for(String label : columnLabels){
						String value = rs.getString(label);
						BeanUtils.setProperty(entity, label, value);
					}
				}else{
					throw new RuntimeException("except one, find more.");
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			JdbcUtil.releaseResource(rs, pst, conn);
		}
		return entity;
	}
	
	/**
	 * 查询多条数据并以List封装返回
	 * @param sql 待填充的sql语句
	 * @param clazz 要封装的对象类型
	 * @param args sql语句参数
	 * @return
	 */
	public static <T> List<T> queryForList(String sql, Class<T> clazz, Object ... args){
		T entity = null;
		List<T> list = null;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try{
			conn = JdbcUtil.getConnection();
			pst = conn.prepareStatement(sql);
			for(int i = 0; i < args.length; i++){
				pst.setObject(i + 1, args[i]);
			}
			rs = pst.executeQuery();
			
			List<String> columnLabels = getColumnLabels(rs);
			list = new ArrayList<>();
			
			
			ConvertUtils.register(new Converter()    
		    {    
		        @SuppressWarnings("rawtypes")    
		        @Override    
		        public Object convert(Class arg0, Object arg1)    
		        {    
//		            System.out.println("注册字符串转换为date类型转换器");    
		            if(arg1 == null)    
		            {    
		                return null;    
		            }    
		            if(!(arg1 instanceof String))    
		            {    
		                throw new ConversionException("只支持字符串转换 !");    
		            }    
		            String str = (String)arg1;    
		            if(str.trim().equals(""))    
		            {    
		                return null;    
		            }    
		                 
		            SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");    
		                 
		            try{    
		                return sd.parse(str);    
		            }    
		            catch(ParseException e)    
		            {    
		                throw new RuntimeException(e);    
		            }    
		                 
		        }    
		             
		    }, java.util.Date.class);  
			
			
			while(rs.next()){
				entity = clazz.newInstance();
				for(String label : columnLabels){
					String value = rs.getString(label);
					BeanUtils.setProperty(entity, label, value);
				}
				list.add(entity);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			JdbcUtil.releaseResource(rs, pst, conn);
		}
		return list;
	}
	
	/**
	 * 查询多条数据并以List封装返回
	 * @param sql 待填充的sql语句
	 * @param clazz 要封装的对象类型
	 * @return
	 */
	public static <T> List<T> queryForList(String sql, Class<T> clazz){
		T entity = null;
		List<T> list = null;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try{
			conn = JdbcUtil.getConnection();
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			
			List<String> columnLabels = getColumnLabels(rs);
			list = new ArrayList<>();
			
			
			ConvertUtils.register(new Converter()    
		    {    
		        @SuppressWarnings("rawtypes")    
		        @Override    
		        public Object convert(Class arg0, Object arg1)    
		        {    
//		            System.out.println("注册字符串转换为date类型转换器");    
		            if(arg1 == null)    
		            {    
		                return null;    
		            }    
		            if(!(arg1 instanceof String))    
		            {    
		                throw new ConversionException("只支持字符串转换 !");    
		            }    
		            String str = (String)arg1;    
		            if(str.trim().equals(""))    
		            {    
		                return null;    
		            }    
		                 
		            SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");    
		                 
		            try{    
		                return sd.parse(str);    
		            }    
		            catch(ParseException e)    
		            {    
		                throw new RuntimeException(e);    
		            }    
		                 
		        }    
		             
		    }, java.util.Date.class);  
			
			
			while(rs.next()){
				entity = clazz.newInstance();
				for(String label : columnLabels){
					String value = rs.getString(label);
					BeanUtils.setProperty(entity, label, value);
				}
				list.add(entity);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			JdbcUtil.releaseResource(rs, pst, conn);
		}
		return list;
	}
	
	
//	/**
//	 * 查询多条数据并以List封装返回
//	 * @param sql 待填充的sql语句
//	 * @param clazz 要封装的对象类型
//	 * @param args sql语句参数
//	 * @return
//	 */
//	public static <T> List<T> queryForList(String sql, Class<T> clazz, Object ... args){
//		T entity = null;
//		List<T> list = null;
//		Connection conn = null;
//		PreparedStatement pst = null;
//		ResultSet rs = null;
//		try{
//			conn = JdbcUtil.getConnection();
//			pst = conn.prepareStatement(sql);
//			for(int i = 0; i < args.length; i++){
//				pst.setObject(i + 1, args[i]);
//			}
//			rs = pst.executeQuery();
//			
//			List<String> columnLabels = getColumnLabels(rs);
//			list = new ArrayList<>();
//			while(rs.next()){
//				entity = clazz.newInstance();
//				for(String label : columnLabels){
//					String value = rs.getString(label);
//					BeanUtils.setProperty(entity, label, value);
//				}
//				list.add(entity);
//			}
//		}catch(Exception e){
//			e.printStackTrace();
//		}finally {
//			JdbcUtil.releaseResource(rs, pst, conn);
//		}
//		return list;
//	}
	
	/**
	 * 查询指定的属性集或统计结果集
	 * @param sql
	 * @param args
	 * @return
	 */
	public static List<Map<String, Object>> queryForList(String sql){
		List<Map<String, Object>> list = null;
		Map<String, Object> map = null;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try{
			conn = JdbcUtil.getConnection();
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			
			List<String> columnLabels = getColumnLabels(rs);
			list = new ArrayList<>();
			
			while(rs.next()){
				map = new HashMap<>();
				for(String label : columnLabels){
					String value = rs.getString(label);
					map.put(label, value);
				}
				list.add(map);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			JdbcUtil.releaseResource(rs, pst, conn);
		}
		return list;
	}
	
	/**
	 * queryForParam
	 * @param sql
	 * @param args
	 * @return
	 */
	public static Object queryForParam(String sql, Object ... args){
		Object answer = null;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try{
			conn = JdbcUtil.getConnection();
			pst = conn.prepareStatement(sql);
			for(int i = 0; i < args.length; i++){
				pst.setObject(i + 1, args[i]);
			}
			rs = pst.executeQuery();
			
			if(rs.next()){
				if(rs.isLast()){
					answer = rs.getObject(1);
				}else{
					throw new RuntimeException("expect one, find more.");
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			JdbcUtil.releaseResource(rs, pst, conn);
		}
		return answer;
	}
	
	/**
	 * 查询指定的单个属性或单列统计结果
	 * @param sql
	 * @param args
	 * @return
	 */
	public static Object queryForValue(String sql){
		Object value = null;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try{
			conn = JdbcUtil.getConnection();
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			
			if(rs.next()){
				if(rs.isLast()){
					value = rs.getObject(1);
				}else{
					throw new RuntimeException("expect one, find more.");
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			JdbcUtil.releaseResource(rs, pst, conn);
		}
		return value;
	}
	
	/**
	 * 获取resultSet对应的Column labels
	 * @param rs
	 * @return labels
	 * @throws SQLException 
	 */
	private static List<String> getColumnLabels(ResultSet rs) throws SQLException{
		ResultSetMetaData rsmd = rs.getMetaData();
		int count = rsmd.getColumnCount();
		List<String> labels = new ArrayList<>(count);
		for(int i = 0; i < count; i++){
			labels.add(rsmd.getColumnLabel(i + 1));
		}
		
		return labels;
	}
}
