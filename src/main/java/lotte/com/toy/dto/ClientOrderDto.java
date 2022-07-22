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
public class ClientOrderDto {

    private int product_id;
    private String product_name;
    private String product_img;
    private int product_cost;
    private int order_id;
    private String order_address;
    private String order_comment;
    private Timestamp order_date;
    private int order_quantity;
    private int order_total_price;
    private int user_id;
    private String user_name;
    private String user_phone;
    private String user_zipcode;
    private int user_gender;
    private char ship_status;

}
