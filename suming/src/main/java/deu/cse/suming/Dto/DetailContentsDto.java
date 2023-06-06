/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package deu.cse.suming.Dto;

/**
 *  게시글 내용 수정을 위한 Dto
 * @author sujin
 */
public class DetailContentsDto {
    private String title;
    private String contents;

    public DetailContentsDto(String title, String contents) {
        this.title = title;
        this.contents = contents;
    }

    public String getTitle() {
        return title;
    }

    public String getContents() {
        return contents;
    }
    
}
