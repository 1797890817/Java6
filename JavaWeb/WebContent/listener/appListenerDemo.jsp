<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>app Listener Demo</h1>
	<%
		//使用application对象
		application.setAttribute("name", "zhangsan");	//第一次是新增
		application.setAttribute("name", "wangwu");	//第二次是修改
		application.removeAttribute("name");		//删除name属性	
		
		//servletContext
		this.getServletContext().setAttribute("age", 25);
		this.getServletContext().setAttribute("age", 30);
		this.getServletContext().removeAttribute("age");
		
	%>
</body>
</html>