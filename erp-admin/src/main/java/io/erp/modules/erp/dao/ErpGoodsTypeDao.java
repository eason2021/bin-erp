package io.erp.modules.erp.dao;

import io.erp.modules.erp.entity.ErpGoodsTypeEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 
 * 
 * @author Bin
 * @email eeason120@gmail.com
 * @date 2022-01-18 10:15:01
 */
@Mapper
public interface ErpGoodsTypeDao extends BaseMapper<ErpGoodsTypeEntity> {
    void deleteByGoodsId(@Param("goodsId") Integer goodsId);

    List<Integer> queryTypeByGoodsId(@Param("goodsId") Integer goodsId);
}
