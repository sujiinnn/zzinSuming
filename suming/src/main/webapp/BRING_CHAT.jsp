<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@page import="deu.cse.suming.Dto.Message"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%

request.setCharacterEncoding("utf-8");
String uid = (String)session.getAttribute("uid");

Class.forName("com.mysql.cj.jdbc.Driver"); 
Connection conn =null;
PreparedStatement pstmt =null;
ResultSet rs =null;

try {
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/TestDB?serverTimezone=UTC", "root", "0519");

    String sql = "SELECT message,id,user_id,created_at FROM messages WHERE id = ? or user_id = ? ORDER BY created_at ASC";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, uid);
    pstmt.setString(2, uid);

    rs = pstmt.executeQuery();

    List<Message> messages = new ArrayList<>();
    while (rs.next()) {
        Message message = new Message();
        message.setMessage(rs.getString("message"));
        message.setId(rs.getString("id"));
        message.setUserId(rs.getString("user_id"));
        messages.add(message);
    }

    session.setAttribute("messages", messages);
    response.sendRedirect ("chat.jsp");
} catch (SQLException e) {
    out.println("SQL 오류: " + e.getMessage());
} finally {
    if (rs != null) {
        try {
            rs.close();
        } catch (SQLException e) {
            out.println("ResultSet 닫기 오류: " + e.getMessage());
        }
    }
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
