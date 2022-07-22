package lotte.com.toy.dao;

import lotte.com.toy.dto.*;

public interface MypageDao {
    int updateUserPassword(UserUpdatePassword password);
    int updateUserPhone(UserUpdatePhone phone);
    int updateUserName(UserUpdateName name);
    int updateUserAddress(UserUpdateAddress address);
    int updateUserZipcode(UserUpdateZipcode zipcode);
    int deleteUser(int userId);
}
