package lotte.com.toy.controller;

import lotte.com.toy.dto.*;
import lotte.com.toy.service.ProductService;
import lotte.com.toy.service.ReviewService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ReviewController {

    private Logger log = LoggerFactory.getLogger(ReviewController.class);

    @Autowired
    ReviewService reviewService;

    @Autowired
    ProductService productService;

    @RequestMapping(value = "review.do")
    public String startReview(Model model, ReviewRequestDto reviewRequestDto){
        log.info("ReviewController startReview()");
        log.info(reviewRequestDto.toString());
        model.addAttribute("image",reviewRequestDto.getProduct_img());
        model.addAttribute("title",reviewRequestDto.getProduct_name());
        model.addAttribute("productId",reviewRequestDto.getProduct_id());
        model.addAttribute("orderId",reviewRequestDto.getOrder_id());
        return "review";
    }

    @RequestMapping(value = "reviewAf.do")
    public String insertReview(HttpServletRequest req, int productId, String reviewTitle, String reviewContent, String reviewRate){
        UserDto userDto = (UserDto) req.getSession().getAttribute("userLogin");
        if (userDto == null) {
//            response.sendRedirect("/userLogin.do");
            return "redirect:/userLogin.do";
        }
        System.out.println(reviewRate + " : reviewrate");
        int userId = userDto.getUser_id();
        int IntreviewRate = Integer.parseInt(reviewRate); // 지울 것
        CreateReviewDto review = new CreateReviewDto(reviewTitle,reviewContent,userId,IntreviewRate,productId);
        boolean checker = reviewService.insertReview(review);
        if(!checker){
            return "redirect:/orderlist.do";
        }
        return "redirect:/orderlist.do";
    }

    @RequestMapping(value = "findReviewList.do")
    public String findReviewList(Model model,int productId){
        List<ReviewListDto> reviews = reviewService.findReviewList(productId);
        ProductResponseDto productResponseDto = productService.getProductByProductId(productId);
        model.addAttribute("productResponseDto",productResponseDto);
        model.addAttribute("reviews",reviews);

        System.out.println(checkerDelete(reviews).size());
        model.addAttribute("reviews",checkerDelete(reviews));
        return "reviewlist";
    }

    @RequestMapping(value="findMyReviewList.do")
    public String findMyReviewList(Model model, int userId){
        List<ReviewListDto> myReviews = reviewService.findAllByUserId(userId);

        model.addAttribute("myReviews",checkerDelete(myReviews));
        return "findMyReviewList";
    }

    public List<ReviewListDto> checkerDelete(List<ReviewListDto> list){
        List<ReviewListDto> newList = new ArrayList<>();
        for(ReviewListDto review : list){
            if(review.getIs_deleted()=='0'){
                newList.add(review);
            }
        }
        System.out.println(newList.size());
        return newList;
    }
}
