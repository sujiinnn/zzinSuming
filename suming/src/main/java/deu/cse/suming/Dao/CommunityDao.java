/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package deu.cse.suming.Dao;

import deu.cse.suming.Dto.DetailContentsDto;
import deu.cse.suming.Dto.FeedDto;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;

/**
 *  게시판에 필요한 정보를 DB에 저장하고 가져오고 하기 위한 클래스
 *  수정할 것 : Connection conn  = DriverManager.getConnection("jdbc:mysql://localhost:3306/TestDB?serverTimezone=UTC", "root", "0519");
 *                 포트 알맞게 변경 + DB 계정 및 비밀번호 알맞게 변경하기
 * @author sujin
 */
public class CommunityDao {
    
    // 
    /**
     * 상세보기 된 게시글의 글 작성자와 로그인 된 아이디 비교하는 메소드
     * @param no
     * @param uid // 현재 로그인 되어있는 아이디
     * @return 로그인된 아이디와 글 작성자 아이디가 동일하면 true 아니면 false
     */
    public boolean compare(String no, String uid) throws NamingException, SQLException {        
        Connection conn  = DriverManager.getConnection("jdbc:mysql://localhost:3306/TestDB?serverTimezone=UTC", "root", "0519");
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            String sql = "select uid from community where id = " + no;
            
            stmt = conn.prepareStatement(sql);
            
            rs = stmt.executeQuery();
            
            if (rs.next() && (rs.getString("uid").equals(uid))) { // rs.getString("uid")에서 uid는 글 작성자 아이디
                return true;
            } else {
                return false;
            }
            
        } finally {
            if (rs != null) 
                rs.close();
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();
        }
    }
    
    // 게시글 작성 메소드
    public boolean insert(String uid, String title, String content) throws NamingException, SQLException {
        Connection conn  = DriverManager.getConnection("jdbc:mysql://localhost:3306/TestDB?serverTimezone=UTC", "root", "0519");
        PreparedStatement stmt = null;
        
        try {
            String sql = "insert into community(uid, title, content) values(?, ?, ?)";
            
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            stmt.setString(2, title);
            stmt.setString(3, content);
            
            int count = stmt.executeUpdate();
            
            return (count > 0) ? true : false;
        } finally {
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();
        }
    }
    
    // 게시글 내용 전체 출력 메소드
    public ArrayList<FeedDto> getList() throws NamingException, SQLException {
        Connection conn  = DriverManager.getConnection("jdbc:mysql://localhost:3306/TestDB?serverTimezone=UTC", "root", "0519");
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            String sql = "select id, uid, title, insertDate from community";
            
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            
            ArrayList<FeedDto> feeds = new ArrayList<FeedDto>();
            
            while (rs.next()) {
                feeds.add(new FeedDto(rs.getString("id"), rs.getString("title"), rs.getString("insertDate"), rs.getString("uid")));
            }
            return feeds;                    
        } finally {
            if (rs != null)
                rs.close();
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();
        }
    }
    
    // 게시글 내용 상세 보기 메소드
    public DetailContentsDto getFeed(String no) throws NamingException, SQLException {
        Connection conn  = DriverManager.getConnection("jdbc:mysql://localhost:3306/TestDB?serverTimezone=UTC", "root", "0519");
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            String sql = "select title, content from community where id = ?";
            
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, no);
            
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                String title = rs.getString("title");
                String contents = rs.getString("content");
                
                return new DetailContentsDto(title, contents);
            } else {
                return new DetailContentsDto("", ""); // 없을 때 아무것도 없는거 보내기
            }
        } finally {
            if(rs != null)
                rs.close();
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();
        }
    }
    
    // 게시글 수정 메소드
    public boolean update(String no, DetailContentsDto dto) throws NamingException, SQLException {
        Connection conn  = DriverManager.getConnection("jdbc:mysql://localhost:3306/TestDB?serverTimezone=UTC", "root", "0519");
        PreparedStatement stmt = null;
        
        try {
            String sql = "update community set title=?, content=? where id = " + no;
            
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, dto.getTitle());
            stmt.setString(2, dto.getContents());
            
            int count = stmt.executeUpdate();
            
            return (count >= 1) ? true : false;
            
            
        } finally {
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();
        }
    }
    

    // 게시글 삭제 메소드
    public boolean delete(String no) throws NamingException, SQLException{
        Connection conn  = DriverManager.getConnection("jdbc:mysql://localhost:3306/TestDB?serverTimezone=UTC", "root", "0519");
        PreparedStatement stmt = null;
        
        try {
            String sql = "delete from community where id = " + no;
            
            stmt = conn.prepareStatement(sql);
            
            int count = stmt.executeUpdate();
            
            return (count == 1) ? true : false;
            
            
        } finally {
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();
        }
    }
    
}
