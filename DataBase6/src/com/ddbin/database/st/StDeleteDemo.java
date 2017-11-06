package com.ddbin.database.st;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class StDeleteDemo {
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

		// 创建statment
		Statement st = conn.createStatement();
		String sql = "delete from stu where name = 'user4'";

		// 执行SQL语句
		int i = st.executeUpdate(sql);
		// 数据输出完毕
		System.out.println("数据删除完毕!");
		System.out.println(" i = " + i);

		// 释放资源
		st.close();
		conn.close();

	}

}
