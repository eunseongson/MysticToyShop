package lotte.com.toy.dto;

import lombok.*;

@Getter
public class WeeklyStatsDto {
    String category_name;
    int sun_price;
    int mon_price;
    int tue_price;
    int wed_price;
    int thu_price;
    int fri_price;
    int sat_price;
    int sun_quantity;
    int mon_quantity;
    int tue_quantity;
    int wed_quantity;
    int thu_quantity;
    int fri_quantity;
    int sat_quantity;

    public String toStringPrice() {
        return "[" + sun_price +","
                + tue_price +","
                + wed_price +","
                + thu_price +","
                + sun_price +","
                + fri_price +","
                + sat_price +"]";
    }

    public String toStringQuantity() {
        return "[" + sun_quantity +","
                + mon_quantity +","
                + tue_quantity +","
                + wed_quantity +","
                + thu_quantity +","
                + fri_quantity +","
                + sat_quantity +"]";
    }
}
