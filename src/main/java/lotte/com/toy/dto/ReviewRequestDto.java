package lotte.com.toy.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@RequiredArgsConstructor
@ToString
public class ReviewRequestDto {
    private int order_id;
    private int product_id;
    private String product_name;
    private String product_img;
}
