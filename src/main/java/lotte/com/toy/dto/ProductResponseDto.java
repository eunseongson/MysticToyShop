package lotte.com.toy.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@RequiredArgsConstructor
@ToString
public class ProductResponseDto {
    private int product_id;
    private String product_name;
    private String product_info;
    private String product_img;
    private int product_cost;
    private int product_stock;
    private int product_sell_count;
    private int category_id;
    private String category_name;
    private int seller_id;
    private String seller_email;
    private String seller_company_name;
    private String seller_company_number;
    private String seller_address;
}
