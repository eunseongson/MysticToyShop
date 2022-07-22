package lotte.com.toy.service;

import lombok.Getter;
import lotte.com.toy.dao.OrderDao;
import lotte.com.toy.dto.OrderDateDto;
import lotte.com.toy.dto.OrderDetailDto;

import lotte.com.toy.dto.OrderDto;
import lotte.com.toy.dto.OrderGroupDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
@Getter
public class OrderServiceImp implements OrderService{

    @Autowired
    OrderDao orderDao;

    @Override
    public List<OrderDetailDto> orderFindAll(OrderGroupDto groupDto) {
        return orderDao.findAll(groupDto);
    }

    @Override
    public OrderDetailDto orderFind(int orderId) {
        return orderDao.find(orderId);
    }

    @Override
    public List<OrderDetailDto> findDateOrderList(OrderDateDto date) {
        return orderDao.findDateOrderList(date);
    }

    @Override
    public List<Integer> findOrderGroupList() {
        return orderDao.findOrderGroupList();
    }

    @Override
    public List<Integer> findOrderGroupDateList(OrderDateDto date) {
        return orderDao.findOrderGroupDateList(date);
    }

    @Override
    public boolean insertOrder(OrderDto order) {
        int count = orderDao.insertOrder(order);
        if(count==0){
            return false;
        }
        return true;
    }

    @Override
    public int findByLastRowId() {
        return orderDao.findByLastRowId();
    }

    @Override
    public Integer findByOrderGroup() {
        return orderDao.findByOrderGroup();
    }

    @Override
    public boolean deleteOrderByUserId(int userId) {
        int count = orderDao.deleteOrderByUserId(userId);
        if(count==0){
            return false;
        }
        return true;
    }

}
