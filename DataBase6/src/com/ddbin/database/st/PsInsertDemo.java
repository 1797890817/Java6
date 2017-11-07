package com.ddbin.database.st;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class PsInsertDemo {
	public static final String DBDRIVER = "com.mysql.jdbc.Driver";
	public static final String DBURL = "jdbc:mysql://localhost:3306/db_demo";
	public static final String DBUSER = "root";
	public static final String DBPWD = "root";

	public static void main(String[] args) throws Exception {
		// 注册驱动
		// Class.forName("com.mysql.jdbc.Driver"); //方式一
		Class.forName(DBDRIVER); // 方式二

		// 建立数据库连接
		Connection conn = null;
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPWD);

		// 创建Ps-statment
		String sql = "insert into stu (name,age,cell,addr) values(?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		//设置四个占位符的值
		ps.setString(1, "u002");
		ps.setInt(2, 26);
		ps.setString(3, "15600001235");
		ps.setString(4, "南京");
		
		// 执行SQL语句
		int i = ps.executeUpdate();
		// 数据输出完毕
		System.out.println("数据插入完毕!");
		System.out.println(" i = " + i);

		// 释放资源
		ps.close();
		conn.close();

	}

}
