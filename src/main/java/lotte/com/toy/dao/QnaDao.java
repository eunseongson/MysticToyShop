package lotte.com.toy.dao;


import lotte.com.toy.dto.QnaListDto;
import lotte.com.toy.dto.QnaSheetDto;

import java.util.List;

public interface QnaDao {
    int insertQna(QnaSheetDto qna);

    List<QnaListDto> findQnaList(int productId);


}
