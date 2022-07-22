package lotte.com.toy.service;

import lotte.com.toy.dto.CartDto;
import lotte.com.toy.dto.CartUserProductDto;

import java.util.List;

public interface CartService {
    List<CartDto> getCartList();
    List<CartDto> getCartListByUserId(int userId);

    List<CartUserProductDto> getCartUserProductDtoByUserId(int userId);

    boolean insertCart(CartDto cartDto);
    boolean updateCart(CartDto cartDto);
    boolean deleteCartByCartId(int cartId);

    CartDto getCartByCartId(int cartId);
    CartDto getCartByProductIdAndUserId(CartDto cartDto);

    boolean deleteCartByUserId(int userId);
}
