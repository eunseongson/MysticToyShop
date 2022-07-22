package lotte.com.toy.dto;

import lombok.*;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@AllArgsConstructor
public class UserDto {
    private int user_id;
    private String user_email;
    private String user_password;
    private String user_name;
    private String user_zipcode;
    private String user_address;
    private String user_phone;
    private int user_gender;
    private String user_register_date;
    private String user_kakao_identifier;
    private boolean is_activated;
    private int auth_id;
}
