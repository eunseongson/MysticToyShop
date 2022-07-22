package lotte.com.toy.service;

import lotte.com.toy.dao.AuthDao;
import lotte.com.toy.dto.AuthDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AuthServiceImpl implements AuthService{

    @Autowired
    AuthDao authDao;

    @Override
    public List<AuthDto> authList() {
        return authDao.authList();
    }
}
