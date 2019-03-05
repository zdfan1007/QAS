package com.file.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class FileCombine {
	/**
	 * 合并文件夹下所有.txt文件的内容到一个新的.txt文件中
	 * @param fileName 需要合并的文件夹
	 * @param endFile 合并内容后存放的文件名
	 * @return 合并之后的.txt文件
	 */
	static void getCombineFile(String fileName,String endFile){
		StringBuffer content = new StringBuffer();
		File finalFile = new File(endFile);
		File initFile = new File(fileName);
		if(initFile.isDirectory()){
			//获取文件夹所有txt文件对象
			FilenameFilter filter = new FileFilter("txt");
			File[] files = initFile.listFiles(filter);
			//读取所有txt文件内容,存放在content中
			BufferedReader reader = null;
			System.out.println("需合并的文件数目："+files.length);
			for(int i=0;i<files.length;i++){
				try {
					reader = new BufferedReader(new InputStreamReader(new FileInputStream(files[i])));
					String s = null;
					while((s = reader.readLine()) != null){
						content.append(s);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			try {
				reader.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			System.out.println("方法参数fileName并不是文件夹，请设置正确的文件夹名称！");
		}
		//将合并后的内容输出到新txt文件中
		try {
			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(finalFile), "UTF-8"));
			writer.write(content.toString());
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
			
	}
	
	public static void main(String[] args) {
		String fileName = "D:/TrainSet/car";
		String endFile = "D:/TrainSet/car/汽车评论.txt";
		getCombineFile(fileName, endFile);

	}

}
