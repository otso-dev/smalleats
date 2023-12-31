package com.smalleats.repository;


import com.smalleats.entity.FoodDeliveryArea;
import com.smalleats.entity.Order;
import com.smalleats.entity.OrderMenu;
import com.smalleats.entity.Payment;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class PaymentDAOImpl implements PaymentDAO {
    private final String NS = "PaymentDAOImpl.";
    private final SqlSessionTemplate sqlSession;
    @Override
    public Order getOrder(int orderId) {
        return sqlSession.selectOne(NS+"getOrder",orderId);
    }

    @Override
    public OrderMenu getOrderMenuList(int orderId) {
        return sqlSession.selectOne(NS+"getOrderMenuList", orderId);
    }

    @Override
    public int paid(Payment payment) {
        return sqlSession.insert(NS+"paid",payment);
    }

    @Override
    public int cancel(int orderId) {
        return sqlSession.delete(NS+"cancel", orderId);
    }

    @Override
    public List<FoodDeliveryArea> getDeliveryArea(int orderId) {
        return sqlSession.selectList(NS+"getDeliveryArea", orderId);
    }

}
