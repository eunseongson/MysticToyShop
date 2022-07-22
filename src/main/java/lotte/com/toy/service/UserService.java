package lotte.com.toy.service;

import lotte.com.toy.dto.UserDto;
import lotte.com.toy.dto.SellerDto;

import java.util.HashMap;

public interface UserService {
    String getUserId(String user_id);
    boolean addUser(UserDto dto);
    UserDto userLogin(UserDto dto);
    String getSellerId(String seller_id);
    boolean addSeller(SellerDto dto);
    SellerDto sellerLogin(SellerDto dto);
    String getAccessToken (String authorize_code);
    HashMap<String, Object> getUserInfo(String access_Token);
    int getKakaoId (String user_kakao_identifier);
    UserDto kakaoUserLogin(String user_kakao_identifier);

    String findNameByUserId(int userId);
}
