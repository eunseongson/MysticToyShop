package lotte.com.toy.dao;

import lotte.com.toy.dto.OrderDateDto;
import lotte.com.toy.dto.OrderDetailDto;
import lotte.com.toy.dto.OrderDto;
import lotte.com.toy.dto.OrderGroupDto;


import java.util.List;

public interface OrderDao {
    List<OrderDetailDto> findAll(OrderGroupDto groupDto);
    OrderDetailDto find(int orderId);

    List<OrderDetailDto> findDateOrderList(OrderDateDto date);

    List<Integer> findOrderGroupList();

    List<Integer> findOrderGroupDateList(OrderDateDto date);

    int insertOrder(OrderDto order);

    int findByLastRowId();

    Integer findByOrderGroup();

    int deleteOrderByUserId(int userId);
}
