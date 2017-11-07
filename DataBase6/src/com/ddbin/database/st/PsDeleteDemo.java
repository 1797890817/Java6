package com.ddbin.database.st;

import java.sql.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.rowset.serial.SerialArray;

public class PsDeleteDemo {
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

		// String sql = "delete from stu where id = ?";
		ArrayList<Integer> ids = new ArrayList<Integer>();
		// ids.add(1);
		// ids.add(3);
		// ids.add(7);

		// 构建批量删除id的SQL语句 ：delete from stu where id in (....);
		String sql = buildIdsSQL("stu", ids);
		PreparedStatement ps = conn.prepareStatement(sql);

		// 暂时不支持的特性
		// Array ids= conn.createArrayOf("int",new Object[]{1,3,5});
		// ps.setArray(1, ids);

		// 执行SQL语句
		int i = ps.executeUpdate();
		// 数据输出完毕
		System.out.println("数据删除完毕!");
		System.out.println(" i = " + i);

		// 释放资源
		ps.close();
		conn.close();

	}

	private static String buildIdsSQL(String tableName, ArrayList<Integer> ids) throws Exception {
		if (ids == null || ids.size() == 0) {
			throw new Exception("集合不允许为空！");
			// return "";
		} else {
			String idString = "";
			StringBuilder sb = new StringBuilder();
			for (Integer integer : ids) {
				sb.append(integer).append(",");
			}

			idString = sb.toString(); // "1,3,5,"
			// 去除最后一个逗号！
			idString = idString.substring(0, idString.length() - 1); // "1,3,5"
			String sql = "delete from " + tableName + " where id in ( " + idString + " )";
			return sql;
		}
	}

}
