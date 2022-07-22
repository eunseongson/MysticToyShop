package lotte.com.toy.dao;

import lotte.com.toy.dto.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SellerDaoImpl implements SellerDao {

    @Autowired
    SqlSession session;
    String nameSpace = "Seller.";

    @Override
    public int findTotalCount(SellerDto seller) {
        return session.selectOne(nameSpace + "findTotalCount", seller);
    }

    @Override
    public int findSoldOut(SellerDto seller) {
        return session.selectOne(nameSpace + "findSoldOut", seller);
    }

    @Override
    public int findEndSale(SellerDto seller) {
        return session.selectOne(nameSpace + "findEndSale", seller);
    }

    @Override
    public int findReadyShip(SellerDto seller) {
        return session.selectOne(nameSpace + "findReadyShip", seller);
    }

    @Override
    public int findCompletedShip(SellerDto seller) {
        return session.selectOne(nameSpace + "findCompletedShip", seller);
    }

    @Override
    public int newOrders(String today) {
        return session.selectOne(nameSpace + "newOrders", today);
    }

    @Override
    public int newReviews(String today) {
        return session.selectOne(nameSpace + "newReviews", today);
    }

    @Override
    public int newQnAs(String today) {
        return session.selectOne(nameSpace + "newQnAs", today);
    }

    @Override
    public List<ReviewDto> findAllReviews(SellerDto seller) {
        return session.selectList(nameSpace + "findAllReviews", seller);
    }

    @Override
    public List<QnADto> findAllQnAs(SellerDto seller) {
        return session.selectList(nameSpace + "findAllQnAs", seller);
    }

    @Override
    public List<ProductResponseDto> findAllSellerProductList(SellerDto seller) {
        return session.selectList(nameSpace + "findAllSellerProductList", seller);
    }

    @Override
    public List<ClientOrderDto> findClientOrders(SellerDto seller) {
        return session.selectList(nameSpace + "findClientOrders", seller);
    }

    @Override
    public int shipUpdate(int order_id) {
        return session.update(nameSpace + "shipUpdate", order_id);
    }

    @Override
    public int shipUpdateCancel(int order_id) {
        return session.update(nameSpace + "shipUpdateCancel", order_id);
    }

    @Override
    public int stockUpdate(ProductDto dto) {
        return session.update(nameSpace + "stockUpdate", dto);
    }
}
