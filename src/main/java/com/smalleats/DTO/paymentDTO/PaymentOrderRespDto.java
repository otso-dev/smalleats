package com.smalleats.DTO.paymentDTO;

import com.smalleats.entity.Order;
import lombok.*;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PaymentOrderRespDto {
    private int orderId;
    private int foodId;

    private String orderReqTime;
    private String orderDeliveryDay;

    private String foodName;
    private int foodDeliveryPrice;

    public PaymentOrderRespDto toDto(Order order){
        return PaymentOrderRespDto.builder()
                .orderId(order.getOrderId())
                .foodId(order.getFoodId())
                .orderReqTime(order.getOrderReqTime())
                .orderDeliveryDay(order.getOrderDeliveryDay())
                .foodName(order.getFoodProduct().getFoodName())
                .foodDeliveryPrice(order.getFoodProduct().getFoodDeliveryPrice())
                .build();
    }
}
