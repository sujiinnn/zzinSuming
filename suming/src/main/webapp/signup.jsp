<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<html>

<body>
<%
request.setCharacterEncoding("utf-8");
String uid = request.getParameter("id");
String ups1 = request.getParameter("ps1");
String ups2 = request.getParameter("ps2");
String uname = request.getParameter("name");
String unum = request.getParameter("tel") + "-" + request.getParameter("middle") + "-" + request.getParameter("last");
String uyear = request.getParameter("year");
String uarea = request.getParameter("country");
String ugen = request.getParameter("man");

String sql = "INSERT INTO  USERS_TB(ID,PW,NAME,NUMBER,AGE,AREA,GENDER) VALUES(?,?,?,?,?,?,?)";
Class.forName("com.mysql.cj.jdbc.Driver"); 
Connection conn =null;
PreparedStatement pstmt =null;
ResultSet rs =null;
if(ups1!=null && ups2!=null && ups1.equals(ups2)){
    try {
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/TestDB?serverTimezone=UTC", "root", "0519");
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,uid);
        pstmt.setString(2,ups1);
        pstmt.setString(3,uname);
        pstmt.setString(4,unum);
        pstmt.setString(5,uyear);
        pstmt.setString(6,uarea);
        pstmt.setString(7,ugen);

        int count = pstmt.executeUpdate();
        if(count==1){
            %>
           <script>
                    alert("회원가입 성공!");
                </script>
            <%
            response.sendRedirect("login.html");
        }
    } catch(SQLException ex) {
        out.println(ex.getMessage());
        ex.printStackTrace();
    } finally {
        if (pstmt !=null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn !=null) try { conn.close(); } catch(SQLException ex) {}
    }
}
else{
    %>
     <script>
            alert("비밀번호를 재확인 해주세요.");
        </script>
    <%
}

%>
</body>
</html>