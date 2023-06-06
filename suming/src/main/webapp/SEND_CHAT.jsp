<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("utf-8");

String uid = (String) session.getAttribute("uid");
String umessage = (String) request.getParameter("messagetext");

Class.forName("com.mysql.cj.jdbc.Driver"); 
Connection conn =null;
PreparedStatement pstmt =null;
ResultSet rs =null;
String chatfriend = (String)session.getAttribute("sfriend");
session.setAttribute("sfriend2",chatfriend);

try {

    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/TestDB?serverTimezone=UTC", "root", "0519");

    String sql = "INSERT INTO messages(id, user_id, message) VALUES(?, ?, ?)";
    
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, uid);
    pstmt.setString(2,chatfriend);
    pstmt.setString(3, umessage);

    int i = pstmt.executeUpdate();
    
    if(i==1){
    response.sendRedirect ("BRING_CHAT.jsp");
    }
    else{
        out.print("메시지 보내기 실패");
    }
    
    out.print(chatfriend);
} catch (SQLException e) {
    out.println("SQL 오류: " + e.getMessage());
} finally {
    if (pstmt != null) {
        try {
            pstmt.close();
        } catch (SQLException e) {
            out.println("PreparedStatement 닫기 오류: " + e.getMessage());
        }
    }
    if (conn != null) {
        try {
            conn.close();
        } catch (SQLException e) {
            out.println("Connection 닫기 오류: " + e.getMessage());
        }
    }
}
%>
