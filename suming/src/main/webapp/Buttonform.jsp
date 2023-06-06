<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("utf-8");
String uid = request.getParameter("id");
String upass = request.getParameter("ps");
String form = request.getParameter("button");

session.setAttribute("uid", uid);
session.setAttribute("upass", upass);

if(form.equals("회원가입")) {
    response.sendRedirect("Signup.html");
} else if(form.equals("로그인")) {
    response.sendRedirect("Login.jsp");
}

%>
