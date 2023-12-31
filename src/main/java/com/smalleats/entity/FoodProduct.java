package com.smalleats.entity;

import lombok.*;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class FoodProduct {
    private int foodId;
    private String foodName;
    private String foodImg;
    private String foodOpen;
    private String foodClose;
    private int foodMin;
    private int foodDeliveryPrice;
    private String foodRoadAddress;
    private String foodDetailAddress;
    private int foodZoneCode;
    private String foodAddressSiGunGu;
    private String foodAddressSido;
    private String categoryName;

    private Category category;
}
