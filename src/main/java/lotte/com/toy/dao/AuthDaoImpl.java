package lotte.com.toy.dao;

import lotte.com.toy.dto.AuthDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AuthDaoImpl implements AuthDao {
    @Autowired
    SqlSession session;

    String nameSpace = "Authority.";

    @Override
    public List<AuthDto> authList() {
        return session.selectList(nameSpace + "authList");
    }
}
