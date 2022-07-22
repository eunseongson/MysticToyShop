package lotte.com.toy.util;

import lotte.com.toy.dto.CartUserProductDto;
import lotte.com.toy.dto.ProductDto;

import java.util.List;

public class Utility {

    public static int getTotalPrice(List<CartUserProductDto> cartUserProductDtoList) {
        int totalPrice = 0;

        for (CartUserProductDto cartUserProductDto : cartUserProductDtoList) {
            totalPrice += cartUserProductDto.getProduct_cost() * cartUserProductDto.getCart_quantity();
        }

        return totalPrice;
    }

    public static int getTotalPriceByProduct(ProductDto productDto, int quantity) {
        return productDto.getProduct_cost() * quantity;
    }
}
