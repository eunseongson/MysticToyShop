package lotte.com.toy.service;

import lotte.com.toy.dto.CreateReviewDto;
import lotte.com.toy.dto.ReviewCheckDto;
import lotte.com.toy.dto.ReviewListDto;

import java.util.List;

public interface ReviewService {
    boolean insertReview(CreateReviewDto review);

    List<ReviewListDto> findReviewList(int product_id);

    int checkReviewWrite(ReviewCheckDto reviewCheck);

    List<ReviewListDto> findAllByUserId(int userId);
}
