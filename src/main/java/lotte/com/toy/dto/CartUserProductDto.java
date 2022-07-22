package lotte.com.toy.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
public class CartUserProductDto {
    private int cart_id;
    private int cart_quantity;
    private int user_id;
    private int product_id;

    private int product_cost;
    private String product_img;
    private String product_name;
    private int product_stock;

}
