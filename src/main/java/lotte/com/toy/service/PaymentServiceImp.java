package lotte.com.toy.service;

import lotte.com.toy.dao.PaymentDao;
import lotte.com.toy.dto.OrderDto;
import lotte.com.toy.dto.PaymentDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentServiceImp implements PaymentService {

    @Autowired
    PaymentDao paymentDao;
    @Override
    public boolean insertPayment(PaymentDto payment) {
        int count = paymentDao.insertPayment(payment);
        if(count ==0){
            return false;
        }
        return true;
    }

    @Override
    public boolean deletePaymentByOrderId(int userId) {
        int count = paymentDao.deletePaymentByOrderId(userId);
        if(count ==0){
            return false;
        }
        return true;
    }
}
