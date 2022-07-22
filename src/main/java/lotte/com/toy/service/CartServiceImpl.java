package lotte.com.toy.service;

import lotte.com.toy.dao.CartDao;
import lotte.com.toy.dto.CartDto;
import lotte.com.toy.dto.CartUserProductDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    CartDao cartDao;

    @Override
    public List<CartDto> getCartList() {
        return cartDao.getCartList();
    }

    @Override
    public List<CartDto> getCartListByUserId(int userId) {
        return cartDao.getCartListByUserId(userId);
    }

    @Override
    public List<CartUserProductDto> getCartUserProductDtoByUserId(int userId) {
        return cartDao.getCartUserProductDtoByUserId(userId);
    }

    @Override
    public boolean insertCart(CartDto cartDto) {
        // product id 조회 후 같은 product id 가 이미 존재하면 quantity를 update 할 수 있도록 한다.

        return cartDao.insertCart(cartDto) > 0;
    }

    @Override
    public boolean updateCart(CartDto cartDto) {
        return cartDao.updateCart(cartDto) > 0;
    }

    @Override
    public boolean deleteCartByCartId(int cartId) {
        return cartDao.deleteCartByCartId(cartId) > 0;
    }

    @Override
    public CartDto getCartByCartId(int cartId) {
        return cartDao.getCartByCartId(cartId);
    }

    @Override
    public CartDto getCartByProductIdAndUserId(CartDto cartDto) {
        return cartDao.getCartByProductIdAndUserId(cartDto);
    }

    @Override
    public boolean deleteCartByUserId(int userId) {
        int count = cartDao.deleteCartByUserId(userId);
        if(count == 0){
            return false;
        }
        return true;
    }
}
