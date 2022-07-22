package lotte.com.toy.service;

import lotte.com.toy.dao.CategoryDao;
import lotte.com.toy.dto.CategoryDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryDao categorydao;

    @Override
    public List<CategoryDto> categoryList() {
        return categorydao.categoryList();
    }
}
