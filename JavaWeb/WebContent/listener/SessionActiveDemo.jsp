<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.ddbin.javaweb.listener.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
</head>

<body>
	<h2>演示session钝化与活化技术</h2>	

	<%
		if (session.getAttribute("p") == null) {
			Person p = new Person("" + (new Random()).nextInt(100));
			session.setAttribute("p", p);
		}
		System.out.println(session.getId() + "---" + session.getAttribute("p"));
		out.println(session.getId() + "---" + session.getAttribute("p"));
		Date d = new Date(session.getCreationTime());
		System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d));
		out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d));
	%>
</body>
</html>