package com.ddb.javacore.io;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class BufferedByteDemo {

	public static void main(String[] args) {
		// 创建文件对象
		File file1 = new File("E:\\Share\\Video-Java4\\01JavaBase\\96IO-PPT1-1_2017-04-06_095155.wmv");
		File file2 = new File("E:\\Share\\Video-Java4\\01JavaBase\\ioDemoBK.wmv");

		FileInputStream fis;
		FileOutputStream fos;

		try {
			// 创建文件输入流
			fis = new FileInputStream(file1);
			BufferedInputStream bis = new BufferedInputStream(fis);

			// 创建文件输出流
			fos = new FileOutputStream(file2);
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			int read = bis.read();
			while (read != -1) {
				bos.write(read);// 写入
				read = bis.read();// 读取
			}
			// 关闭文件流
			fis.close();
			fos.close();
			System.out.println("Copy OK!");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
