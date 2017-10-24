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
	<h1>request Listener Demo</h1>
	<%
		//使用request对象
		request.setAttribute("name", "zhangsan");	//第一次是新增
		request.setAttribute("name", "wangwu");	//第二次是修改是替换
		request.removeAttribute("name");		//删除name属性	
		request.isAsyncSupported();
	%>
	
	request.isAsyncSupported()=<%=request.isAsyncSupported() %>
</body>
</html>