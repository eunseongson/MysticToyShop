package lotte.com.toy.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@RequiredArgsConstructor
public class CategoryDto {
    private int category_id;
    private String category_name;
}
