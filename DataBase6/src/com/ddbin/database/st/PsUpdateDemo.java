package com.ddbin.database.st;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class PsUpdateDemo {
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

		// 创建ps-statment
		String sql = "update stu set addr = ? where id = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, "南京");
		ps.setInt(2, 19);
		// 执行SQL语句
		int i = ps.executeUpdate();
		// 数据输出完毕
		System.out.println("数据更新完毕!");
		System.out.println(" i = " + i);

		// 释放资源
		ps.close();
		conn.close();

	}

}
