<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@page import="deu.cse.suming.Dto.Album"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    request.setCharacterEncoding("utf-8");
    String uid = (String) session.getAttribute("uid");

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {

        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/TestDB?serverTimezone=UTC", "root", "0519");

        String sql = "SELECT ID FROM USERS_TB";
        pstmt = conn.prepareStatement(sql);

        rs = pstmt.executeQuery(sql);

        List<Album> albums = new ArrayList<>();
        while (rs.next()) {
            Album album = new Album();
            album.setId(rs.getString("ID"));
            albums.add(album);
        }

        session.setAttribute("albums", albums);
        response.sendRedirect("PickYou.html");
    } catch (SQLException e) {
        out.println("SQL 오류: " + e.getMessage());
    } finally {
        // 리소스 해제 관련 코드를 작성하세요.
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                // ResultSet 닫기 오류 처리
                out.println("ResultSet 닫기 오류: " + e.getMessage());
            }
        }

        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                // Statement 닫기 오류 처리
                out.println("Statement 닫기 오류: " + e.getMessage());
            }
        }

        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                // Connection 닫기 오류 처리
                out.println("Connection 닫기 오류: " + e.getMessage());
            }
        }
    }
%>
