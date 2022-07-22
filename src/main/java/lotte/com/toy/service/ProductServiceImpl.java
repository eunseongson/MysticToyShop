package lotte.com.toy.service;

import lotte.com.toy.dao.ProductDao;

import lotte.com.toy.dto.ProductDto;
import lotte.com.toy.dto.ProductResponseDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductDao productDao;

    @Override
    public ProductDto findByProductId(int productId) {
        return productDao.findByProductId(productId);
    }

    @Override
    public List<ProductResponseDto> getProductList() {
        return productDao.getProductList();
    }

    @Override
    public ProductResponseDto getProductByProductId(int productId) {
        return productDao.getProductByProductId(productId);
    }

    @Override
    public List<ProductResponseDto> getProductListByCategoryId(int categoryId) {
        return productDao.getProductListByCategoryId(categoryId);
    }

    @Override
    public boolean product_write(ProductDto dto) {
        return productDao.product_write(dto) > 0 ? true : false;

    }

    @Override
    public List<ProductResponseDto> findMainList(String productName) {
        return productDao.findMainList(productName);
    }

    @Override
    public boolean updateProductStock(int productId) {
        int count =  productDao.updateProductStock(productId);
        if(count==0){
            return false;
        }
        return true;
    }

    @Override
    public boolean updateProductSellcount(int productId) {
        int count =  productDao.updateProductSellcount(productId);
        if(count==0){
            return false;
        }
        return true;
    }
    public List<ProductResponseDto> getProductListForMain() {
        return productDao.getProductListForMain();
    }

    @Override
    public boolean productUpdate(ProductDto dto) {
        return productDao.product_update(dto)>0?true:false;
    }
}
