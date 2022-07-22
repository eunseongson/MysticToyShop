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
public class OrderDetailDto {
    private int order_id;
    private int order_group;
    private int order_total_price;
    private String order_address;
    private String order_phone;
    private String order_comment;
    private Timestamp order_date;
    private int order_quantity;
    private int user_id;
    private String user_name;
    private String product_name;
    private String product_info;
    private String product_img;
    private int product_cost;
    private int product_category;
    private char ship_status;
    private String seller_company_name;
    private int product_id;
    private int reviewCheck;

    public void setReviewCheck(int check){
        this.reviewCheck = check;
    }
}
