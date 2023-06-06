<%-- 
    Document   : contentDelete
    Created on : 2023. 6. 5., 오전 3:53:20
    Author     : sujin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="deu.cse.suming.Dao.CommunityDao"%>

<%
    request.setCharacterEncoding("utf-8");
    
    String no = request.getParameter("no");
    String uid =(String) request.getParameter("uid");
    String uid2 =(String) session.getAttribute("uid");
    CommunityDao dao = new CommunityDao();    
    
    
    // 세션을 통해 접속해있는 유저와 게시글 유저가 동일한지 비교하는 로직 넣기
    // 동일하다면 삭제
    boolean check = dao.delete(no);
    
    if (check) {
        %>
        <script>
            alert("게시글 삭제 성공");
            location.href = "community.jsp";
        </script>
        <%        
}
%>