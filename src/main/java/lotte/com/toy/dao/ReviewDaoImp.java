package lotte.com.toy.dao;

import lotte.com.toy.dto.CreateReviewDto;
import lotte.com.toy.dto.ReviewCheckDto;
import lotte.com.toy.dto.ReviewListDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReviewDaoImp implements ReviewDao{

    @Autowired
    SqlSession session;

    String nameSpace = "Review.";

    @Override
    public int insertReview(CreateReviewDto review) {
        return session.insert(nameSpace+"insertReview",review);
    }

    @Override
    public List<ReviewListDto> findReviewList(int product_id) {
        return session.selectList(nameSpace+"findAll",product_id);
    }

    @Override
    public int checkReviewWrite(ReviewCheckDto reviewCheck) {
        return session.selectOne(nameSpace+"checkReview",reviewCheck);
    }

    @Override
    public List<ReviewListDto> findAllByUserId(int userId) {
        return session.selectList(nameSpace+"findAllByUserId",userId);
    }
}
