package lotte.com.toy.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@AllArgsConstructor
@ToString
public class OrderDto {
    private String orderName;
    private String order_address;
    private String order_phone;
    private String order_comment;
    private int user_id;
    private int product_id;
    private int order_quantity;
    private int order_total_price;
    private int order_group;
}
