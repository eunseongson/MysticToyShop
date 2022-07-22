package lotte.com.toy.controller;

import lotte.com.toy.dao.OrderStatsDao;
import lotte.com.toy.dto.*;
import lotte.com.toy.service.OrderStatsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class StatisticsController {
    Logger logger = LoggerFactory.getLogger(FileController.class);

    @Autowired
    OrderStatsService orderStatsService;

    @GetMapping("/orderstats.do")
    public String OrderStatsDetail(HttpServletRequest req, Model model) {
        logger.info("StatisticsController OrderStatsService");


        SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
        Date time = new Date();
        String inputDate = format1.format(time);

        SellerDto sellerDto = (SellerDto) req.getSession().getAttribute("sellerLogin");
        if (sellerDto == null) {
            return "redirect:/sellerLogin.do";
        }

        // 세션 seller id
        int sellerId = sellerDto.getSeller_id();

        OrderStatsDto today = orderStatsService.getOrderStatsByDate(sellerId, inputDate);
        OrderStatsDto week = orderStatsService.getOrderStatsWeek(sellerId);
        OrderStatsDto month = orderStatsService.getOrderStatsMonth(sellerId);

        List<OrderStatsDto> weeklyList = orderStatsService.getOrderStatsListWeekly(sellerId);

        List<OrderStatsDto> catTodayList = orderStatsService.getOrderStatsByCatsDate(sellerId, inputDate);
        List<OrderStatsDto> catWeekList = orderStatsService.getOrderStatsByCatsWeek(sellerId);
        List<OrderStatsDto> catMonthList = orderStatsService.getOrderStatsByCatsMonth(sellerId);

        List<WeeklyStatsDto> weeklyStatsDtoList = orderStatsService.getWeeklyAll(sellerId);

        WeeklyStatsDto WeekTotal = orderStatsService.getWeekTotal(sellerId);
        System.out.println("WeekTotal "+WeekTotal.toStringPrice());
        // 일간, 주간, 월간 판매량/판매금액 조회 (단건)
        model.addAttribute("today", today);
        model.addAttribute("week", week);
        model.addAttribute("month", month);

        // 주문 있는 날짜
        model.addAttribute("weeklyList", weeklyList);

        // 카테고리 - 일간
        if (!catTodayList.isEmpty()) {
            model.addAttribute("catToday", catTodayList.get(0));
        }

        // 카테고리 - 주간
        model.addAttribute("catWeeks", catWeekList);
        if (!catWeekList.isEmpty()) {
            model.addAttribute("catWeek", catWeekList.get(0));
        }

        // 카테고리 - 월간
        model.addAttribute("catMonths", catMonthList);
        if (!catMonthList.isEmpty()) {
            model.addAttribute("catMonth", catMonthList.get(0));
        }

        // 카테고리 판매분석 (월화수목금토일) (다건)
        model.addAttribute("weeklyStatsDtoList", weeklyStatsDtoList);

        // 판매량/판매금액 (월화수목금토일) (단건)
        model.addAttribute("weelTotAmount", WeekTotal.toStringPrice());
        model.addAttribute("weelTotQuan", WeekTotal.toStringQuantity());

        return "orderstatistics";
    }

    @GetMapping("/userstats.do")
    public String CustomerStatsDetail(HttpServletRequest req, Model model) {
        logger.info("StatisticsController CustomerStatsDetail");
        System.out.println("StatisticsController CustomerStatsDetail");


        SellerDto sellerDto = (SellerDto) req.getSession().getAttribute("sellerLogin");
        if (sellerDto == null) {
            return "redirect:/sellerLogin.do";
        }

        // 세션 seller id
        int sellerId = sellerDto.getSeller_id();

        List<OrderStatsDto> MostReviewedCat = orderStatsService.getMostReviewedCat(sellerId);
        List<OrderStatsDto> MostReviewedProduct = orderStatsService.getMostReviewedProduct(sellerId);
        List<OrderStatsDto> TopRatedProduct = orderStatsService.getTopRatedProduct(sellerId);

        UserStatsDto GenderOrders = orderStatsService.getGenderOrders(sellerId);
        UserStatsDto SignupCounts = orderStatsService.getSignupCounts();


        model.addAttribute("MostReviewedCat", MostReviewedCat);
        model.addAttribute("MostReviewedProduct", MostReviewedProduct.get(0));
        model.addAttribute("MostReviewedProducts", MostReviewedProduct);

        model.addAttribute("TopRatedProduct", TopRatedProduct);

        model.addAttribute("GenderOrders", GenderOrders);
        model.addAttribute("SignupCounts", SignupCounts);

        return "customerstatistics";
    }

}
