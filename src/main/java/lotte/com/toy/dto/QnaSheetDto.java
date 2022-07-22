package lotte.com.toy.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

import java.sql.Timestamp;
@Getter
@AllArgsConstructor
@ToString
public class QnaSheetDto {
    private String qna_title;
    private String qna_content;
    private int qna_writer;
    private int product_id;
}
