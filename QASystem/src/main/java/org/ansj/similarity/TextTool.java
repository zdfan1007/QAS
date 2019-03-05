package org.ansj.similarity;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.UUID;

public class TextTool {
	private static ArrayList<String> FileList = new ArrayList<String>();
	
		/**
		 * 获取文件夹中的文件列表，包括子文件夹下的文件列表
		 * @param filepath  文件目录
		 * @return  List<String> 各个文件对应的路径List集合
		 * @throws FileNotFoundException  
		 * @throws IOException
		 */
		public static ArrayList<String> readDirs(String filepath) throws FileNotFoundException,IOException{
		       try {
		               File file = new File(filepath);
		               if(!file.isDirectory()){
		                   System.out.println(file.toString()+" is not a directory!"+"\r\n"+"filepath:" + file.getAbsolutePath());           
		                }
		               else{
		                   String[] flist = file.list();
		                   for(int i = 0; i < flist.length; i++){
		                      File newfile = new File(filepath + "\\" + flist[i]);
		                      if(!newfile.isDirectory()){
		                          FileList.add(newfile.getAbsolutePath());
		                      }
		                      else if(newfile.isDirectory()){
		                          readDirs(filepath + "\\" + flist[i]);                  
		                      }                   
		                   }
		               }
		         }
		        catch(FileNotFoundException e){
		           System.out.println(e.getMessage());      
		        }
		        return FileList;
		 }
		
		 /**
		  * 读取文本内容
		  * @param file   输入文件路径
		  * @return  String  返回文件内容
		  * @throws FileNotFoundException
		  * @throws IOException
		  */
		 public static String readFile(String file) throws FileNotFoundException, IOException{
		       StringBuffer strSb = null;
		       strSb = new StringBuffer(); 
		       BufferedReader br = null;
		       br = new BufferedReader(new InputStreamReader(new FileInputStream(file), getCharset(file)));
		       String line = br.readLine();
		       while(line != null){
		             strSb.append(line);
		             line = br.readLine(); 
		       }
		       br.close();
		       return strSb.toString();
		  }
		 
		 /**
		  * 读取文本内容，按句子划分文本
		  * @param file   文本路径
		  * @return
		  * @throws FileNotFoundException
		  * @throws IOException
		  */
		 public static String[] readFilebySentence(String file) throws FileNotFoundException, IOException{
		       StringBuffer strSb = null;
		       strSb = new StringBuffer(); 
		       BufferedReader br = null;
		       br = new BufferedReader(new InputStreamReader(new FileInputStream(file), getCharset(file)));
		       String line = br.readLine();
		       while(line != null){
		             strSb.append(line);
		             line = br.readLine(); 
		       }
		       br.close();
		       String[] sentences = strSb.toString().split("。");
		       return sentences;
		 }
		 
		 /**
		  * 获取文本编码类型
		  * @param filePath 输入文本路径
		  * @return  String 返回文本编码类型
		  */
		  public static String getCharset(String filePath) {
				File file = new File(filePath);
				String charset = "GBK"; // 默认编码
		        byte[] first3Bytes = new byte[3];
		        try {
		            boolean checked = false;
		            BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
		            bis.mark(0);
		            int read = bis.read(first3Bytes, 0, 3);
		            
		            if (read == -1){
		            	bis.close();
		                return charset;
		            }
		            
		            if (first3Bytes[0] == (byte) 0xFF && first3Bytes[1] == (byte) 0xFE) {
		                charset = "UTF-16LE";
		                checked = true;
		            } else if (first3Bytes[0] == (byte) 0xFE && first3Bytes[1]
		                == (byte) 0xFF) {
		                charset = "UTF-16BE";
		                checked = true;
		            } else if (first3Bytes[0] == (byte) 0xEF && first3Bytes[1]
		                    == (byte) 0xBB
		                    && first3Bytes[2] == (byte) 0xBF) {
		                charset = "UTF-8";
		                checked = true;
		            }
		            bis.reset();
		            if (!checked) {
		                while ((read = bis.read()) != -1) {
		                    if (read >= 0xF0)
		                        break;
		                    //单独出现BF以下的，也算是GBK
		                    if (0x80 <= read && read <= 0xBF)
		                        break;
		                    if (0xC0 <= read && read <= 0xDF) {
		                        read = bis.read();
		                        if (0x80 <= read && read <= 0xBF)// 双字节 (0xC0 - 0xDF)
		                            // (0x80 -
		                            // 0xBF),也可能在GB编码内
		                            continue;
		                        else
		                            break;
		                     // 也有可能出错，但是几率较小
		                    } else if (0xE0 <= read && read <= 0xEF) {
		                        read = bis.read();
		                        if (0x80 <= read && read <= 0xBF) {
		                            read = bis.read();
		                            if (0x80 <= read && read <= 0xBF) {
		                                charset = "UTF-8";
		                                break;
		                            } else
		                                break;
		                        } else
		                            break;
		                    }
		                }
		            }
		            bis.close();
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
				return charset;
		    }
		  
		  /**
		   * 保存文件到磁盘文件中
		   * @param content  需要保存的内容
		   * @param filepath  输出的文件路径
		   * @return  boolean 判断是否保存成功
		   */
			public static  boolean saveFile(String content, String filepath) {
				OutputStream ops = null;
				PrintWriter pw = null;
				try{
					 ops = new FileOutputStream(filepath);
					 pw = new PrintWriter(new BufferedWriter(new OutputStreamWriter(ops,"UTF-8")));
				     pw.write(content);
				     pw.flush();
				     ops.close();
				 	 pw.close();
				 	 return true;
				}catch(Exception e){   
					System.out.println("保存文件出现异常:"+e.getMessage());
					return false;
				}
			}
			
			public static  boolean  saveFile(String content, String filepath,boolean isAdd) {
				FileWriter writer = null;
		        try {   
			            writer = new FileWriter(filepath,  isAdd);   // 打开一个写文件器，构造函数中的第二个参数true表示以追加形式写文件   
			            writer.write(content); 
			            return true;
		        } catch (IOException e) {   
		            	e.printStackTrace();  
		            	return false;
		        } finally {   
			            try {   
			            	if(writer != null){
			            		writer.close(); 
			            	}
			            } catch (IOException e) {   
			                e.printStackTrace();   
			            }   
		        } 
			}
			
			/**
			 * 删除某目录，以及目录下的所有文件
			 * @param dir   输入待删文件目录
			 * @return  boolean 文件是否删除成功
			 */
			public static boolean deleteDir(File dir) {
		        if (dir.isDirectory()) {
		            String[] children = dir.list();
		            for (int i=0; i<children.length; i++) {
		                boolean success = deleteDir(new File(dir, children[i]));
		                if (!success) {
		                	System.out.println("删除目录及其目录下的文件失败！");
		                    return false;
		                }
		            }
		        }
		        return dir.delete();
		    }
			
			/**
			 * 获取文本的扩展名
			 * @param filePath  输入文本路径
			 * @return String  返回文本扩展名（.txt  .doc  .pdf等）
			 */
			public static String getFileExt(String filePath) {
				File ff = new File(filePath);
				String[] arr = ff.getName().split("\\.");
				return arr[arr.length-1].toLowerCase();
			}
			
			/**
			 * 获取文件所在的目录
			 * @param filePath  输入文本路径
			 * @return  String  返回文本所在目录
			 */
			public static  String getTextDir(String filePath) {
				File ff = new File(filePath);
				int lengths = filePath.length()-ff.getName().length();
				String textDir = filePath.substring(0, lengths);
				return textDir;
			}
			
			/**
			 * 获取一个随机的UUID（通用唯一识别码）用作文本名称
			 * @return  String  文本名称
			 */
			public static String getRandomFileName() {
				return UUID.randomUUID().toString().replaceAll("-", "");
			}
}
