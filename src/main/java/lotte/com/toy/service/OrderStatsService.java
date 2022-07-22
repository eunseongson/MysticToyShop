package lotte.com.toy.service;

import lotte.com.toy.dto.OrderStatsDto;
import lotte.com.toy.dto.UserStatsDto;
import lotte.com.toy.dto.WeeklyStatsDto;

import java.util.List;
import java.util.Map;

public interface OrderStatsService {

    OrderStatsDto getOrderStatsByDate(int sellerId, String inputDate);

    OrderStatsDto getOrderStatsWeek(int sellerId);

    OrderStatsDto getOrderStatsMonth(int sellerId);

    List<OrderStatsDto> getOrderStatsListWeekly(int sellerId);

    List<OrderStatsDto> getOrderStatsByCatsDate(int sellerId, String inputDate);

    List<OrderStatsDto> getOrderStatsByCatsWeek(int sellerId);

    List<OrderStatsDto> getOrderStatsByCatsMonth(int sellerId);

    List<OrderStatsDto> getMostReviewedCat(int sellerId);

    List<OrderStatsDto> getMostReviewedProduct(int sellerId);

    List<OrderStatsDto> getTopRatedProduct(int sellerId);

    List<WeeklyStatsDto> getWeeklyAll(int sellerId);

    WeeklyStatsDto getWeekTotal(int sellerId);

    UserStatsDto getGenderOrders(int sellerId);

    UserStatsDto getSignupCounts();


}
