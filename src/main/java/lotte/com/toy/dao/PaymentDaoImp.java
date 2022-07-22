package lotte.com.toy.dao;

import lotte.com.toy.dto.PaymentDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDaoImp implements PaymentDao{
    @Autowired
    SqlSession session;

    String namespace = "Payment.";

    @Override
    public int insertPayment(PaymentDto payment) {
        return session.insert(namespace+"insertPayment",payment);
    }

    @Override
    public int deletePaymentByOrderId(int userId) {
        return session.delete(namespace+"deletePaymentByOrderId",userId);
    }
}
