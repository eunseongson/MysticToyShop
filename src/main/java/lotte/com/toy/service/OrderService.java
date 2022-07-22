package lotte.com.toy.service;

import lotte.com.toy.dto.OrderDateDto;
import lotte.com.toy.dto.OrderDetailDto;
import lotte.com.toy.dto.OrderDto;
import lotte.com.toy.dto.OrderGroupDto;


import java.util.List;

public interface OrderService {
    List<OrderDetailDto> orderFindAll(OrderGroupDto groupDto);
    OrderDetailDto orderFind(int orderId);

    List<OrderDetailDto> findDateOrderList(OrderDateDto date);

    List<Integer> findOrderGroupList();

    List<Integer> findOrderGroupDateList(OrderDateDto date);

    boolean insertOrder(OrderDto order);

    int findByLastRowId();

    Integer findByOrderGroup();

    boolean deleteOrderByUserId(int userId);
}
