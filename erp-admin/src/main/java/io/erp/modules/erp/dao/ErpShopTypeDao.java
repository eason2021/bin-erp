package io.erp.modules.erp.dao;

import io.erp.modules.erp.entity.ErpShopTypeEntity;
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
public interface ErpShopTypeDao extends BaseMapper<ErpShopTypeEntity> {
    List<Integer> queryTypeIds(@Param("shopId") Integer shopId);

    void deleteTypeIds(@Param("shopId") Integer shopId);
}
