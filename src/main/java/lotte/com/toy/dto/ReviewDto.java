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
public class ReviewDto {

    private int review_id;
    private String review_title;
    private String review_content;
    private String review_rate;
    private int review_writer;
    private Timestamp review_register_date;
    private int ref_id;
    private int is_deleted;
    private int product_id;
}
