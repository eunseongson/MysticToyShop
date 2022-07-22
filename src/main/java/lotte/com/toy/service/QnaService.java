package lotte.com.toy.service;

import lotte.com.toy.dto.QnaListDto;
import lotte.com.toy.dto.QnaSheetDto;

import java.util.List;

public interface QnaService {
    boolean insertQna(QnaSheetDto qna);

    List<QnaListDto> findQnaList(int productId);
}
