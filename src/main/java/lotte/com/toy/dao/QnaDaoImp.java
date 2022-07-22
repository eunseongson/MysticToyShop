package lotte.com.toy.dao;

import lotte.com.toy.dto.QnaListDto;
import lotte.com.toy.dto.QnaSheetDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class QnaDaoImp implements QnaDao{

    @Autowired
    SqlSession session;

    String nameSpace = "Qna.";

    @Override
    public int insertQna(QnaSheetDto qna) {
        return session.insert(nameSpace+"insertQna",qna);
    }

    @Override
    public List<QnaListDto> findQnaList(int productId) {
        return session.selectList(nameSpace+"findAll",productId);
    }
}
