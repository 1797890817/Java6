package javademo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class HelloWorld {
	private String name;
	private int age;

	public static final String DBDRIVER = "com.mysql.jdbc.Driver";
	public static final String DBURL = "jdbc:mysql://localhost:3306/db_demo";
	public static final String DBUSER = "root";
	public static final String DBPWD = "root";

	public HelloWorld(String name, int age) {
		this.name = name;
		this.age = age;
	}

	@Override
	public String toString() {
		return "HelloWorld [name=" + this.getName() + ", age=" + this.getAge() + "]";
	}

	public static void main(String[] args) throws Exception {
		System.out.println("Hello World!");
		HelloWorld helloWorld = new HelloWorld("zhangsan", 25);

		System.out.println(helloWorld);

		// 注册驱动
		// Class.forName("com.mysql.jdbc.Driver"); //方式一
		Class.forName(DBDRIVER); // 方式二

		// 建立数据库连接
		Connection conn = null;
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPWD);

		// 创建statment
		Statement st = conn.createStatement();
		String sql = "select * from stu";

		// 执行SQL语句
		ResultSet rs = st.executeQuery(sql);

		// 循环处理得到的结果集
		// 打印表头
		System.out.println("id \t\t age \t\t name \t\t cell \t\t addr \t\t");
		while (rs.next()) {
			// 取得每一条记录中的数据
			int id = rs.getInt("id");
			int age = rs.getInt("age");
			String name = rs.getString("name");
			String cell = rs.getString("cell");
			String addr = rs.getString("addr");
			// 输出我们的每一条记录
			System.out.println(id + " \t\t" + age + " \t\t" + name + " \t\t" + cell + " \t\t" + addr + " \t\t");
		}
		// 数据输出完毕
		System.out.println("数据输出完毕!");

		// 释放资源
		rs.close();
		st.close();
		conn.close();

	}
}
