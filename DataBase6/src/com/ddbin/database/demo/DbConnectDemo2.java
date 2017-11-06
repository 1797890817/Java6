package com.ddbin.database.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnectDemo2 {
	public static final String DBDRIVER = "com.mysql.jdbc.Driver";
	public static final String DBURL = "jdbc:mysql://localhost:3306/db_demo";
	public static final String DBUSER = "root";
	public static final String DBPWD = "root";

	public static void main(String[] args) {
		// 注册驱动
		// Class.forName("com.mysql.jdbc.Driver"); //方式一
		try {
			Class.forName(DBDRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} // 方式二

		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;

		try {
			// 建立数据库连接
			conn = DriverManager.getConnection(DBURL, DBUSER, DBPWD);
			// 创建statment
			st = conn.createStatement();
			String sql = "select * from stu";
			// 执行SQL语句
			rs = st.executeQuery(sql);
			// 循环处理得到的结果集
			// 打印表头
			System.out.println("id \t\t age \t\t name \t\t cell \t\t addr \t\t");
			while (rs.next()) {
				// 取得每一条记录中的数据
				int id = rs.getInt(1);		//使用的是字段的索引，从1开始
				int age = rs.getInt(2);
				String name = rs.getString(3);
				String cell = rs.getString(4);
				String addr = rs.getString(5);
				
				// 输出我们的每一条记录
				System.out.println(id + " \t\t" + age + " \t\t" + name + " \t\t" + cell + " \t\t" + addr + " \t\t");
			}
			// 数据输出完毕
			System.out.println("数据输出完毕!");
			rs.close();
			st.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 释放资源
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
