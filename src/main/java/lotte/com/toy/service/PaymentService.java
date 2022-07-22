package lotte.com.toy.service;


import lotte.com.toy.dto.PaymentDto;

public interface PaymentService {
    boolean insertPayment(PaymentDto payment);

    boolean deletePaymentByOrderId(int userId);

}
