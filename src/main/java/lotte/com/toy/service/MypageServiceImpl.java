package lotte.com.toy.service;

import lotte.com.toy.dao.MypageDao;
import lotte.com.toy.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MypageServiceImpl implements MypageService{

    @Autowired
    MypageDao mypagedao;

    @Override
    public boolean updateUserPassword(UserUpdatePassword password) {
        int count = mypagedao.updateUserPassword(password);
        if(count==0){
            return false;
        }
        return true;
    }

    @Override
    public boolean updateUserPhone(UserUpdatePhone phone) {
        int count = mypagedao.updateUserPhone(phone);
        if(count==0){
            return false;
        }
        return true;
    }

    @Override
    public boolean updateUserName(UserUpdateName name) {
        int count = mypagedao.updateUserName(name);
        if(count==0){
            return false;
        }
        return true;
    }

    @Override
    public boolean updateUserAddress(UserUpdateAddress address) {
        int count = mypagedao.updateUserAddress(address);
        if(count==0){
            return false;
        }
        return true;
    }

    @Override
    public boolean updateUserZipcode(UserUpdateZipcode zipcode) {
        int count = mypagedao.updateUserZipcode(zipcode);
        if(count==0){
            return false;
        }
        return true;
    }

    @Override
    public boolean deleteUser(int userId) {
        int count = mypagedao.deleteUser(userId);
        if(count==0){
            return false;
        }
        return true;
    }
}
