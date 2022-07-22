package lotte.com.toy.dao;

import lotte.com.toy.dto.ProductDto;
import lotte.com.toy.dto.ProductResponseDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDaoImpl implements ProductDao {

    @Autowired
    SqlSession session;

    String nameSpace = "Product.";


    @Override
    public ProductDto findByProductId(int productId) {
        return session.selectOne(nameSpace + "findByProductId", productId);
    }

    @Override
    public List<ProductResponseDto> getProductList() {
        return session.selectList(nameSpace + "getProductList");
    }

    @Override
    public ProductResponseDto getProductByProductId(int productId) {
        return session.selectOne(nameSpace + "getProductByProductId", productId);
    }

    @Override
    public List<ProductResponseDto> getProductListByCategoryId(int categoryId) {
        return session.selectList(nameSpace + "getProductListByCategoryId", categoryId);

    }

    @Override
    public int product_write(ProductDto dto) {
        return session.insert(nameSpace + "product_write", dto);
    }

    @Override
    public List<ProductResponseDto> findMainList(String productName) {
        return session.selectList(nameSpace+"findByProductName",productName);
    }

    @Override
    public int updateProductStock(int productId) {
        return session.update(nameSpace+"updateProductStock",productId);
    }

    @Override
    public int updateProductSellcount(int productId) {
        return session.update(nameSpace+"updateProductSellCount",productId);
    }

    public List<ProductResponseDto> getProductListForMain() {
        return session.selectList(nameSpace + "getProductListForMain");
    }

    @Override
    public int product_update(ProductDto dto) {
        return session.update(nameSpace + "product_update", dto);
    }
}
