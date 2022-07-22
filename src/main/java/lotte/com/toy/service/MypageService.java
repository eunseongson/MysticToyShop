package lotte.com.toy.service;

import lotte.com.toy.dto.*;

public interface MypageService {
    boolean updateUserPassword(UserUpdatePassword password);
    boolean updateUserPhone(UserUpdatePhone phone);
    boolean updateUserName(UserUpdateName name);
    boolean updateUserAddress(UserUpdateAddress address);
    boolean updateUserZipcode(UserUpdateZipcode zipcode);
    boolean deleteUser(int userId);
}
