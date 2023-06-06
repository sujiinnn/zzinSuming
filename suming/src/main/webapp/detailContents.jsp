<%-- 
    Document   : detailContents
    Created on : 2023. 6. 5., 오전 1:35:43
    Author     : sujin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="deu.cse.suming.Dao.CommunityDao"%>
<%@page import="deu.cse.suming.Dto.DetailContentsDto"%>

<!DOCTYPE html>
<html>
<head>
  <title>게시글 내용 상세 보기</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" href="Comcss.css">
</head>
<body>
  <h1>게시글 내용 상세 보기</h1>
  
  <%
       String no = request.getParameter("no"); // 상세보기 게시물 번호
       String uid = request.getParameter("uid"); // 접속해있는 유저 id
       String wid = request.getParameter("wid"); // 글 작성한 유저 id
       
       CommunityDao dao = new CommunityDao();    
       DetailContentsDto dto = dao.getFeed(no);
       boolean check = dao.compare(no, uid);
       
       // 확인하는 것
       System.out.println("no : " + no);
       System.out.println("uid : " + uid);
       System.out.println("wid : " + wid);
       System.out.println("check 값 : " + check);
   %>
  <form id="write-form" method="post">
    <label for="title">제목:</label><br>
    <input type="text" id="title" name="title" value="<%=dto.getTitle()%>" required><br><br>

    <label for="content">내용:</label><br>
    <textarea id="content" name="content" rows="5" required><%=dto.getContents()%></textarea><br><br>

    <input type="submit" value="수정" onclick="submitUpdate();">
    <input type="submit" value="삭제" onclick="submitDelete();">
    <input type="submit" value="뒤로가기" onclick="submitBackPage();">
  </form>
    
    <script>
      function submitUpdate() {
          if (<%=check%>) {
            document.getElementById('write-form').action = './back/contentUpdate.jsp?no=<%=no%>';
            document.getElementById('write-form').submit();
          } else {
             alert("글 작성자가 아니기 때문에 수정이 불가능합니다.");
          }        
      }

      function submitDelete() {
        if (<%=check%>) {
            document.getElementById('write-form').action = './back/contentDelete.jsp?no=<%=no%>';
            document.getElementById('write-form').submit();
        } else {
            alert("글 작성자가 아니기 때문에 삭제가 불가능합니다.");
        }
      }
      
      function submitBackPage() {
        document.getElementById('write-form').action = './back/community.jsp';
        document.getElementById('write-form').submit();
      }
    </script>
</body>
</html>
