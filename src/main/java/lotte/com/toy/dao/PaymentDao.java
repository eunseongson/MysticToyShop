package lotte.com.toy.dao;

import lotte.com.toy.dto.PaymentDto;

public interface PaymentDao {
    int insertPayment(PaymentDto payment);
    int deletePaymentByOrderId(int userId);
}
