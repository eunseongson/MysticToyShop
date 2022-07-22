package lotte.com.toy.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import java.sql.Timestamp;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor
@ToString
public class QnADto {

    private int qna_id;
    private String qna_title;
    private String qna_content;
    private int qna_writer;
    private Timestamp qna_register_date;
    private int ref_id;
    private int in_deleted;
    private int is_secret;
    private int product_id;
}
