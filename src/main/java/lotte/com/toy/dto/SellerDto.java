package lotte.com.toy.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@RequiredArgsConstructor
public class SellerDto {
    private int seller_id;
    private String seller_email;
    private String seller_password;
    private String seller_name;
    private String seller_zipcode;
    private String seller_address;
    private String seller_phone;
    private String seller_company_name;
    private String seller_company_number;
    private String seller_business_number;
    private String seller_register_date;
    private boolean is_activated;
    private int auth_id;
}
