package lotte.com.toy.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@RequiredArgsConstructor
@ToString
public class FileDto {
    private int file_id;
    private String file_original_name;
    private String file_name;
    private char file_where_use;
    private int file_use_id;
}
