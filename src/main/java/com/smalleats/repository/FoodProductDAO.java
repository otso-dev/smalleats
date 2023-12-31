package com.smalleats.repository;

import com.smalleats.entity.Category;
import com.smalleats.entity.FoodDeliveryArea;
import com.smalleats.entity.FoodMenu;
import com.smalleats.entity.FoodProduct;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FoodProductDAO {
    List<FoodProduct> getFoodProducts();

    List<FoodProduct> searchFoodProducts(FoodProduct foodProduct);

    List<FoodMenu> getFoodMenu(int foodId);
    List<FoodDeliveryArea> getDeliveryArea(int foodId);

    List<Category> getCatgoryList();

    FoodProduct getProductDetail(int foodId);
}
