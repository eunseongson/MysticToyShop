package lotte.com.toy.service;

import lotte.com.toy.dto.ProductDto;
import lotte.com.toy.dto.ProductResponseDto;

import java.util.List;

public interface ProductService {
    ProductDto findByProductId(int productId);
    List<ProductResponseDto> getProductList();
    ProductResponseDto getProductByProductId(int productId);
    List<ProductResponseDto> getProductListByCategoryId(int categoryId);

    boolean product_write(ProductDto dto);

    List<ProductResponseDto> findMainList(String productName);

    boolean updateProductStock(int productId);

    boolean updateProductSellcount(int productId);

    List<ProductResponseDto> getProductListForMain();
    boolean productUpdate(ProductDto dto);
}
