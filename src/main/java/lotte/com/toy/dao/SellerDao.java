package lotte.com.toy.dao;

import lotte.com.toy.dto.*;

import java.util.List;

public interface SellerDao {

    int findTotalCount(SellerDto seller);
    int findSoldOut(SellerDto seller);
    int findEndSale(SellerDto seller);
    int findReadyShip(SellerDto seller);
    int findCompletedShip(SellerDto seller);
    int newOrders(String today);
    int newReviews(String today);
    int newQnAs(String today);
    List<ReviewDto> findAllReviews(SellerDto seller);
    List<QnADto> findAllQnAs(SellerDto seller);
    List<ProductResponseDto> findAllSellerProductList(SellerDto seller);
    List<ClientOrderDto> findClientOrders(SellerDto seller);
    int shipUpdate(int order_id);
    int shipUpdateCancel(int order_id);
    int stockUpdate(ProductDto dto);
}
