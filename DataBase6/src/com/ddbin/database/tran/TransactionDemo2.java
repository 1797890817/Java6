package com.ddbin.database.tran;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Savepoint;
import java.sql.Statement;

public class TransactionDemo2 {
	public static final String DBDRIVER = "com.mysql.jdbc.Driver";
	public static final String DBURL = "jdbc:mysql://localhost:3306/db_demo";
	public static final String DBUSER = "root";
	public static final String DBPWD = "root";

	public static void main(String[] args) throws Exception {
		// 注册驱动
		// Class.forName("com.mysql.jdbc.Driver"); //方式一
		Class.forName(DBDRIVER); // 方式二

		Connection conn = null;
		Statement st = null;
		Savepoint sp = null;	//设置保存点标记
		try {
			// 建立数据库连接
			conn = DriverManager.getConnection(DBURL, DBUSER, DBPWD);
			// 关闭自动提交功能
			conn.setAutoCommit(false);
			// 创建statment
			st = conn.createStatement();
			String sql = "insert into stu (name,age,cell,addr) values ";
			st.executeUpdate(sql + " ('us01',21,'13022221111','xian' )");
			st.executeUpdate(sql + " ('us02',22,'13022221101','xian' )");
			sp = conn.setSavepoint();		//设了一个保存点
			// 制造错误
			st.executeUpdate(sql + " ('us04',31,'13022231111','xian' )");
			sp = conn.setSavepoint();		//设了一个保存点
			st.executeUpdate(sql + " ('us05',21,'13022221161','hefei' )");
			sp = conn.setSavepoint();		//设了一个保存点
			st.executeUpdate(sql + " ('us03',23,'13022221131’,'xian' )");	//有错误的一行
			st.executeUpdate(sql + " ('us06',20,'13022220011','xian' )");
			sp = conn.setSavepoint();		//设了一个保存点
			// 执行SQL语句
			st.executeUpdate(sql);
			conn.commit();
			// 数据输出完毕
			System.out.println("数据插入完毕!");
		} catch (Exception e) {
			// 出现异常回滚
			//conn.rollback();
			conn.rollback(sp);
			conn.commit();
			System.out.println("出现异常，进行回滚");
		} finally {
			// 释放资源
			st.close();
			conn.close();
			System.out.println("释放资源");
		}

	}

}
