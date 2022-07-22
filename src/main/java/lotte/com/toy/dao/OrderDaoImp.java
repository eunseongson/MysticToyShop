package lotte.com.toy.dao;

import lotte.com.toy.dto.OrderDateDto;
import lotte.com.toy.dto.OrderDetailDto;

import lotte.com.toy.dto.OrderDto;
import lotte.com.toy.dto.OrderGroupDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import java.sql.SQLException;
import java.util.List;


@Repository
public class OrderDaoImp implements OrderDao{

    @Autowired
    SqlSession session;

    String namespace = "Order.";

    @Override
    public List<OrderDetailDto> findAll(OrderGroupDto groupDto) {
        List<OrderDetailDto> orderlist = session.selectList(namespace+"findAll",groupDto);
        return orderlist;
    }

    @Override
    public OrderDetailDto find(int orderId) {
        return session.selectOne(namespace+"find",orderId);
    }

    @Override
    public List<OrderDetailDto> findDateOrderList(OrderDateDto date) {

        return session.selectList(namespace+"findDate",date);
    }

    @Override
    public List<Integer> findOrderGroupList() {
        System.out.println("findOrderGroupList DAO");
        return session.selectList(namespace+"findOrderGroupList");
    }

    @Override
    public List<Integer> findOrderGroupDateList(OrderDateDto date) {
        return session.selectList(namespace+"findOrderGroupDateList", date);
    }

    @Override
    public int insertOrder(OrderDto order) {
       return session.insert(namespace+"insertOrder",order);
    }

    @Override
    public int findByLastRowId() {
        return session.selectOne(namespace+"findByLastRowId");
    }

    @Override
    public Integer findByOrderGroup() {
        return session.selectOne(namespace+"findByOrderGroup");
    }

    @Override
    public int deleteOrderByUserId(int userId) {
        return session.delete(namespace+"deleteOrderByUserId",userId);
    }
}
