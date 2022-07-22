package lotte.com.toy.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
public class CartDto {
    private int cart_id;
    private int cart_quantity;
    private int user_id;
    private int product_id;

    @Override
    public String toString() {
        return "CartDto{" +
                "cart_id=" + cart_id +
                ", cart_quantity=" + cart_quantity +
                ", user_id=" + user_id +
                ", product_id=" + product_id +
                '}';
    }
}
