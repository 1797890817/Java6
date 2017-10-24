<%@page import="com.ddbin.javaweb.listener.HttpSessionListenerDemo"%>
<%@page import="com.ddbin.javaweb.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>session Listener Demo</h1>
	<%
		//使用session对象
		session.setAttribute("name", "zhangsan");	//第一次是新增
		session.setAttribute("name", "wangwu");	//第二次是修改是替换
		session.removeAttribute("name");		//删除name属性	
		//使用Bean
		BookBean bb = new BookBean("JavaEE",20);
		BookBean bb2 = new BookBean("JavaCore",25);
		session.setAttribute("book", bb);
		session.setAttribute("book", bb2);
		session.removeAttribute("book");
		
		//session bind
		HttpSessionListenerDemo hsld = new HttpSessionListenerDemo();
		HttpSessionListenerDemo hsld2 = new HttpSessionListenerDemo("new-hsld");
		session.setAttribute("hsld", hsld);
		//session.setAttribute("hsld", hsld2);
		//session.removeAttribute("hsld");
	%>
	<a href="/JavaWeb/InvalidateSessionServlet">使会话失效</a>
	
</body>
</html>