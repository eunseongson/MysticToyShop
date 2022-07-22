package lotte.com.toy.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter
@ToString
@AllArgsConstructor
public class OrderDateDto {
    private Timestamp startDate;
    private Timestamp endDate;
    private int userId;
}
