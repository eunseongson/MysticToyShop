package lotte.com.toy.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter
@AllArgsConstructor
@ToString
public class QnaListDto {
    private String qna_title;
    private String qna_content;
    private int qna_writer;
    private Timestamp qna_register_date;
    private char is_secret;
    private int is_deleted;
    private int product_id;
    private String product_name;
}
