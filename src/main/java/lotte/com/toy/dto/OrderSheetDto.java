package lotte.com.toy.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

import java.sql.Timestamp;
@Getter
@AllArgsConstructor
@ToString
public class OrderSheetDto {
    private int order_id;
    private int order_group;
    private int product_id;
    private int user_id;
    private String order_address;
    private String order_phone;
    private String order_comment;
    private Timestamp order_date;
    private int order_quantity;
    private int order_total_price;
}
