package lotte.com.toy.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@AllArgsConstructor
@ToString
public class PaymentDto {
    private int product_id;
    private int order_id;
    private char ship_status;
}
