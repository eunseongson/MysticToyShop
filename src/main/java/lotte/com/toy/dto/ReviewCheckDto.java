package lotte.com.toy.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
public class ReviewCheckDto {
    private int product_id;
    private int review_writer;
}
