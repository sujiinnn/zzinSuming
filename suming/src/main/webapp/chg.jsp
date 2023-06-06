<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");
    Class.forName("com.mysql.jdbc.Driver");
    String uid = (String) session.getAttribute("uid");
    String upassword = request.getParameter("ps");
    String utel = request.getParameter("tel") + "-" + request.getParameter("middle") + "-" + request.getParameter("last");
    String uyear = request.getParameter("year");
    String uABO = request.getParameter("ABO");
    String uMBTI = request.getParameter("MBTI");
    String ucountry = request.getParameter("country");
    String umind = request.getParameter("mind");
    String ualcohol = request.getParameter("alcohol");
    String uYN = request.getParameter("YN");
    
    

    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/TestDB?serverTimezone=UTC", "root", "0519");
    String sql = "UPDATE USER_TB set pw = ?, number = ?, age = ?, my_blood = ?, my_mbti = ?, area = ?, religion = ?, drink = ?, smoking = ? where id = ?";
    PreparedStatement stmt = conn.prepareStatement(sql);

    stmt.setString(1, upassword);
    stmt.setString(2, utel);
    stmt.setString(3, uyear);
    stmt.setString(4, uABO);
    stmt.setString(5, uMBTI);
    stmt.setString(6, ucountry);
    stmt.setString(7, umind);
    stmt.setString(8, ualcohol);
    stmt.setString(9, uYN);
    stmt.setString(10, uid);

    int count = stmt.executeUpdate();
    if (count == 1) {
        out.print("회원 정보가 업데이트 되었습니다.");
        response.sendRedirect("Mypage.html");
    }
    stmt.close();
    conn.close();


%>