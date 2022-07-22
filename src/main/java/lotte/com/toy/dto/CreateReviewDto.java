package lotte.com.toy.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter
@AllArgsConstructor
@ToString
public class CreateReviewDto {
    private int review_id;
    private String review_title;
    private String review_content;
    private int review_writer;
    private int review_rate;
    private Timestamp review_register_date;
    private int ref_id;
    private char is_deleted;
    private int product_id;

    public CreateReviewDto(String review_title, String review_content, int review_writer, int review_rate, int product_id) {
        this.review_title = review_title;
        this.review_content = review_content;
        this.review_writer = review_writer;
        this.review_rate = review_rate;
        this.product_id = product_id;
    }

}
