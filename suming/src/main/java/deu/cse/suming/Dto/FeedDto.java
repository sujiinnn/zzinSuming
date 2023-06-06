/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package deu.cse.suming.Dto;

/**
 *  게시판에 들어갈 게시글을 저장하는 Dto
 * @author sujin
 */
public class FeedDto {
    private String no;
    private String title;
    private String date;
    private String uid;

    public FeedDto(String no, String title, String date, String uid) {
        this.no = no;
        this.title = title;
        this.date = date;
        this.uid = uid;
    }

    public String getNo() {
        return no;
    }

    public String getTitle() {
        return title;
    }

    public String getDate() {
        return date;
    }

    public String getUid() {
        return uid;
    }
    
    
    
    
}
