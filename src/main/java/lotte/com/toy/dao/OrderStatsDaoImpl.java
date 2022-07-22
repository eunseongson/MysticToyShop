package lotte.com.toy.dao;

import lotte.com.toy.dto.OrderStatsDto;
import lotte.com.toy.dto.UserStatsDto;
import lotte.com.toy.dto.WeeklyStatsDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class OrderStatsDaoImpl implements OrderStatsDao{
    @Autowired
    SqlSession session;

    String nameSpace = "OrderStats.";

    @Override
    public OrderStatsDto getOrderStatsByDate(Map<String, Object> sellerDate) {
        return session.selectOne(nameSpace + "getOrderStatsByDate", sellerDate);
    }

    @Override
    public OrderStatsDto getOrderStatsWeek(int sellerId) {
        return session.selectOne(nameSpace + "getOrderStatsWeek", sellerId);
    }

    @Override
    public OrderStatsDto getOrderStatsMonth(int sellerId) {
        return session.selectOne(nameSpace + "getOrderStatsMonth", sellerId);
    }

    @Override
    public List<OrderStatsDto> getOrderStatsListWeekly(int sellerId) {
        return session.selectList(nameSpace+"getOrderStatsListWeekly", sellerId);
    }

    @Override
    public List<OrderStatsDto> getOrderStatsByCatsDate(Map<String, Object> sellerDate) {
        return session.selectList(nameSpace + "getOrderStatsByCatsDate", sellerDate);
    }

    @Override
    public List<OrderStatsDto> getOrderStatsByCatsWeek(int sellerId) {
        return session.selectList(nameSpace + "getOrderStatsByCatsWeek", sellerId);
    }

    @Override
    public List<OrderStatsDto> getOrderStatsByCatsMonth(int sellerId) {
        return session.selectList(nameSpace + "getOrderStatsByCatsMonth", sellerId);
    }

    @Override
    public List<OrderStatsDto> getMostReviewedCat(int sellerId) {
        return session.selectList(nameSpace + "getMostReviewedCat", sellerId);
    }

    @Override
    public List<OrderStatsDto> getMostReviewedProduct(int sellerId) {
        return session.selectList(nameSpace + "getMostReviewedProduct", sellerId);
    }

    @Override
    public List<OrderStatsDto> getTopRatedProduct(int sellerId) {
        return session.selectList(nameSpace + "getTopRatedProduct", sellerId);
    }

    @Override
    public List<WeeklyStatsDto> getWeeklyAll(int sellerId) {
        return session.selectList(nameSpace + "getWeeklyAll", sellerId);
    }

    @Override
    public WeeklyStatsDto getWeekTotal(int sellerId) {
        return session.selectOne(nameSpace + "getWeekTotal", sellerId);
    }

    @Override
    public UserStatsDto getGenderOrders(int sellerId) {
        return session.selectOne(nameSpace + "getGenderOrders", sellerId);
    }

    @Override
    public UserStatsDto getSignupCounts() {
        return session.selectOne(nameSpace + "getSignupCounts");
    }
}
