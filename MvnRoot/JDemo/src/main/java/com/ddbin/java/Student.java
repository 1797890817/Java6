package com.ddbin.java;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Student {
	private String name;
	private int age;

	public static final String DBDRIVER = "com.mysql.jdbc.Driver";
	public static final String DBURL = "jdbc:mysql://localhost:3306/db_demo";
	public static final String DBUSER = "root";
	public static final String DBPWD = "root";

	public static Student getStu() throws Exception {
		return getStuFromDB();
	}

	@Override
	public String toString() {
		return "Student [name=" + name + ", age=" + age + "]";
	}

	@SuppressWarnings("unused")
	private static Student getStuFromDB() throws Exception {
		Student student = new Student();
		// 注册驱动
		// Class.forName("com.mysql.jdbc.Driver"); //方式一
		Class.forName(DBDRIVER); // 方式二

		// 建立数据库连接
		Connection conn = null;
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPWD);

		// 创建statment
		Statement st = conn.createStatement();
		String sql = "select name,age from stu where id = 4";

		// 执行SQL语句
		ResultSet rs = st.executeQuery(sql);

		// 循环处理得到的结果集
		// 打印表头
		System.out.println("age \t\t name ");
		while (rs.next()) {
			int age = rs.getInt("age");
			String name = rs.getString("name");

			student.setName(name);
			student.setAge(age);
		}
		// 数据输出完毕
		System.out.println("数据输出完毕!");

		// 释放资源
		rs.close();
		st.close();
		conn.close();
		
		return student;

	}

}
