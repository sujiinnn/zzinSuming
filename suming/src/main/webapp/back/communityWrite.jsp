<%-- 
    Document   : communityWrite
    Created on : 2023. 6. 4., 오후 11:42:08
    Author     : sujin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="deu.cse.suming.Dao.CommunityDao"%>

<%
    request.setCharacterEncoding("utf-8");
    
    String uid = (String)session.getAttribute("uid"); // 나중에 작성자 로그인되어있는 세션 값에서 받아와야함
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    
    CommunityDao dao = new CommunityDao();    
    
    if (dao.insert(uid, title, content)) {
        %>
        <script>
            alert("게시글 등록 성공");
            location.href = "community.jsp";
        </script>
        <%        
    }
    
%>

