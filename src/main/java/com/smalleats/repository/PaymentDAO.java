package com.smalleats.repository;


import com.smalleats.entity.FoodDeliveryArea;
import com.smalleats.entity.Order;
import com.smalleats.entity.OrderMenu;
import com.smalleats.entity.Payment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PaymentDAO {

    Order getOrder(int orderId);
    OrderMenu getOrderMenuList(int orderId);
    int paid(Payment payment);

    int cancel(int orderId);
    List<FoodDeliveryArea> getDeliveryArea(int orderId);
}
