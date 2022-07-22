package lotte.com.toy.dao;

import lotte.com.toy.dto.CategoryDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CategoryDaoImpl implements CategoryDao {

    @Autowired
    SqlSession session;
    String nameSpace = "categories.";
    @Override
    public List<CategoryDto> categoryList() {
        return session.selectList(nameSpace + "categoryList");
    }
}
