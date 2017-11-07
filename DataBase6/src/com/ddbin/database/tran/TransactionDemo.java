package com.ddbin.database.tran;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class TransactionDemo {
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

		//关闭自动提交功能
		conn.setAutoCommit(false);
		
		// 创建statment
		Statement st = conn.createStatement();
		String sql = "insert into stu (name,age,cell,addr) values ";
		st.addBatch(sql + " ('us01',21,'13022221111','xian' )");
		st.addBatch(sql + " ('us02',22,'13022221101','xian' )");
		//制造错误
		st.addBatch(sql + " ('us03',23,'13022221131’,'xian' )");			//这样的话，数据没有进入到数据库
		st.addBatch(sql + " ('us04',31,'13022231111','xian' )");
		st.addBatch(sql + " ('us05',21,'13022221161','hefei' )");
		st.addBatch(sql + " ('us06',20,'13022220011','xian' )");
		
		// 执行SQL语句
		st.executeBatch();
		conn.commit();
		// 数据输出完毕
		System.out.println("数据插入完毕!");
		//System.out.println(" i = " + i);

		// 释放资源
		st.close();
		conn.close();

	}

}
