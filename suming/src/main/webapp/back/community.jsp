<%-- 
    Document   : community
    Created on : 2023. 6. 5., 오전 12:42:52
    Author     : sujin
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="deu.cse.suming.Dao.CommunityDao"%>
<%@page import="deu.cse.suming.Dto.FeedDto"%>
<%String ar = (String)session.getAttribute("uid");%>


<!DOCTYPE html>
<html>
<head>
  <title>게시판</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" href="../Comcss.css">
</head>
<body>
  <h1>게시판</h1>

  <table id="post-table">
    <tr>
      <th>게시글 번호</th>
      <th>제목</th>
      <th>등록일</th>
      <th>작성자</th>
    </tr>
    <%
        StringBuilder buffer = new StringBuilder();
        ArrayList<FeedDto> feeds = (new CommunityDao()).getList();
        
        for (FeedDto feed : feeds) {
            String str = "<tr><td>";
            str += feed.getNo();
            str += "</td><td><a href = \"../detailContents.jsp?no=";
            str += feed.getNo();
            str += "&uid=";
            str += ar;
            str += "&wid=";
            str += feed.getUid(); // 글 작성자 id
            str += "\">";
            str += feed.getTitle();
            str += "</a></td><td>";
            str += feed.getDate();
            str += "</td><td>";
            str += feed.getUid();
            str += "</td></tr>";
            buffer.append(str);
       }
       
       out.print(buffer.toString());
    %>
  </table>

  
  
  <div class="write-button">
      <a href="../ComWrite.html"><button id="write-btn">글쓰기</button></a>
      <a href="../index.html"><button id="write-btn">뒤로가기</button></a>
  </div>

  
</body>
</html>

