package lotte.com.toy.dao;

import lotte.com.toy.dto.CartDto;
import lotte.com.toy.dto.CartUserProductDto;

import java.util.List;

public interface CartDao {
    List<CartDto> getCartList();
    List<CartDto> getCartListByUserId(int userId);

    List<CartUserProductDto> getCartUserProductDtoByUserId(int userId);

    int insertCart(CartDto cartDto);

    int updateCart(CartDto cartDto);

    int deleteCartByCartId(int cartId);

    CartDto getCartByCartId(int cartId);

    CartDto getCartByProductIdAndUserId(CartDto cartDto);

    int deleteCartByUserId(int userId);
}
