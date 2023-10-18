package com.smalleats.DTO.foodProductDTO;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FoodDeliveryRespDto {
    private String foodDeliveryArea;
}
