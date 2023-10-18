package com.smalleats.service;

import com.smalleats.DTO.foodProductDTO.FoodDeliveryRespDto;
import com.smalleats.DTO.foodProductDTO.FoodMenuRespDto;
import com.smalleats.DTO.foodProductDTO.FoodProductsRespDto;
import com.smalleats.DTO.foodProductDTO.ProductDetailRespDto;
import com.smalleats.entity.FoodDeliveryArea;
import com.smalleats.entity.FoodMenu;
import com.smalleats.entity.FoodProduct;
import com.smalleats.repository.FoodProductDAOImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class FoodProductService {
    private final FoodProductDAOImpl foodProductDAO;
    public List<FoodProductsRespDto> getFoodProducts(){
        List<FoodProductsRespDto> foodProductRespDtoList = new ArrayList<>();
        List<FoodProduct> foodProductList = foodProductDAO.getFoodProducts();
        foodProductList.forEach(foodProduct -> {
            foodProductRespDtoList.add(foodProduct.toDto());
        });
        return foodProductRespDtoList;
    }

    public List<FoodMenuRespDto> getFoodMenu(int foodId){
        FoodMenuRespDto foodMenuRespDto = new FoodMenuRespDto();
        List<FoodMenuRespDto> foodMenuRespDtoList = new ArrayList<>();
        List<FoodMenu> foodMenuList = foodProductDAO.getFoodMenu(foodId);
        foodMenuList.forEach(foodMenu -> {
            foodMenuRespDtoList.add(foodMenuRespDto.toDto(foodMenu));
        });
        return foodMenuRespDtoList;
    }

    public List<FoodDeliveryRespDto> getFoodDeliverArea(int foodId){
        List<FoodDeliveryRespDto> foodDeliveryRespDtoList = new ArrayList<>();
        List<FoodDeliveryArea> foodDeliveryAreaList = foodProductDAO.getDeliveryArea(foodId);
        foodDeliveryAreaList.forEach(foodDeliveryArea -> {
            foodDeliveryRespDtoList.add(foodDeliveryArea.toDto());
        });
        return foodDeliveryRespDtoList;
    }
    public ProductDetailRespDto getProductDetail(int foodId){
        FoodProduct foodProduct = foodProductDAO.getProductDetail(foodId);
        return foodProduct.toProductDetailRespDto();
    }
}
