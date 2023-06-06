<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<%
request.setCharacterEncoding("utf-8");

String uid = (String) session.getAttribute("uid");
String upass = (String) session.getAttribute("upass");
Class.forName("com.mysql.cj.jdbc.Driver"); 
Connection conn =null;
ResultSet rs =null;
PreparedStatement pstmt =null;

String sql="select id, pw from USERS_TB";

try{

    conn  = DriverManager.getConnection("jdbc:mysql://localhost:3306/TestDB?serverTimezone=UTC", "root", "0519");

    pstmt = conn.prepareStatement(sql);

    rs = pstmt.executeQuery();

    while(rs.next()){
    if(rs.getString("id").equals(uid)){
        if(rs.getString("pw").equals(upass)){
            session.setAttribute("uid", uid); // 글 작성하면 작성자가 아이디로 보이게 할 경우 사용
            response.sendRedirect ("index2.html");
        }
        else{
            out.print("비밀 번호가 틀립니다.");
        }
    }else{
    out.print("일치하는 아이디가 없습니다.");
    }
}
} catch(SQLException ex) {
        out.println(ex.getMessage());
        ex.printStackTrace();
    } finally {
        if (rs!=null)try{rs.close();}catch(SQLException ex){}
        if (pstmt !=null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn !=null) try { conn.close(); } catch(SQLException ex) {}
    }
%>