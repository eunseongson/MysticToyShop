package lotte.com.toy.service;

import lotte.com.toy.dao.QnaDao;
import lotte.com.toy.dao.ReviewDao;
import lotte.com.toy.dto.QnaListDto;
import lotte.com.toy.dto.QnaSheetDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QnaServiceImp implements QnaService{

    @Autowired
    QnaDao qnaDao;

    @Override
    public boolean insertQna(QnaSheetDto qna) {
         int count = qnaDao.insertQna(qna);
         if(count==0){
             return false;
         }
         return true;
    }

    @Override
    public List<QnaListDto> findQnaList(int productId) {
        return qnaDao.findQnaList(productId);
    }
}
