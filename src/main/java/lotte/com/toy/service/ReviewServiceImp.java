package lotte.com.toy.service;

import lotte.com.toy.dao.ReviewDao;
import lotte.com.toy.dto.CreateReviewDto;
import lotte.com.toy.dto.ReviewCheckDto;
import lotte.com.toy.dto.ReviewListDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewServiceImp implements ReviewService{

    @Autowired
    ReviewDao reviewDao;

    @Override
    public boolean insertReview(CreateReviewDto review) {
        int count = reviewDao.insertReview(review);
        if(count==0){
            return false;
        }
        return true;
    }

    @Override
    public List<ReviewListDto> findReviewList(int product_id) {
        return reviewDao.findReviewList(product_id);
    }

    @Override
    public int checkReviewWrite(ReviewCheckDto reviewCheck) {
        return reviewDao.checkReviewWrite(reviewCheck);
    }

    @Override
    public List<ReviewListDto> findAllByUserId(int userId) {
        return reviewDao.findAllByUserId(userId);
    }
}
