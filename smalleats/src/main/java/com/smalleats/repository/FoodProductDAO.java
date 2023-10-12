package com.smalleats.repository;

import com.smalleats.entity.FoodDeliveryArea;
import com.smalleats.entity.FoodMenu;
import com.smalleats.entity.FoodProduct;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class FoodProductDAO implements FoodProductDAOImpl{
    private final String NS = "";
    private final SqlSessionTemplate sqlSession;
    @Override
    public List<FoodProduct> getFoodProducts() {
        return sqlSession.selectList(NS + "getFoodProducts");
    }

    @Override
    public List<FoodMenu> getFoodMenu(int foodId) {
        return sqlSession.selectList(NS + "getFoodMenu", foodId);
    }

    @Override
    public List<FoodDeliveryArea> getDeliveryArea(int foodId) {
        return sqlSession.selectList(NS + "getDeliveryArea", foodId);
    }

    @Override
    public FoodProduct getProductDetail(int foodId) {
        return sqlSession.selectOne(NS + "getProductDetail", foodId);
    }
}