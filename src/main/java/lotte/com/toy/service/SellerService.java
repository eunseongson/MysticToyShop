package lotte.com.toy.service;

import com.mysql.cj.xdevapi.Client;
import lotte.com.toy.dto.*;

import java.util.List;

public interface SellerService {

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
    boolean shipUpdate(int order_id);
    boolean shipUpdateCancel(int order_id);
    boolean stockUpdate(ProductDto dto);
}
