<%-- 
    Document   : contentUpdate
    Created on : 2023. 6. 5., 오전 3:23:01
    Author     : sujin
--%>


<%@page import="deu.cse.suming.Dto.DetailContentsDto"%>
<%@page import="deu.cse.suming.Dao.CommunityDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("utf-8");
    
    String no = request.getParameter("no");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    
    CommunityDao dao = new CommunityDao();    
    
    // 세션을 통해 접속해있는 유저와 게시글 유저가 동일한지 비교하는 로직 넣기
    
    // 동일하다면 수정
    boolean check = dao.update(no, new DetailContentsDto(title, content));
    
    if (check) {
        %>
        <script>
            alert("게시글 수정 성공");
            location.href = "community.jsp";
        </script>
        <%        
    }
    
%>
