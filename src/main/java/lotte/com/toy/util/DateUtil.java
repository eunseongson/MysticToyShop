package lotte.com.toy.util;

import java.sql.SQLOutput;
import java.sql.Timestamp;
import java.text.NumberFormat;

public class DateUtil {

    public static String toYYYYMMDD(Timestamp date){
        String t = String.valueOf(date);
        t = t.substring(0,10);
        return t;
    }

    public static String toOrderNumber(Timestamp date){
        String t = String.valueOf(date);
        t = t.substring(0,t.indexOf("."));
        t = t.trim().replace("-","").replace(" ","").replace(":","");
        return t;
    }

    public static String to000(int cost){
        String money = NumberFormat.getInstance().format(cost);
        return money;
    }
}
