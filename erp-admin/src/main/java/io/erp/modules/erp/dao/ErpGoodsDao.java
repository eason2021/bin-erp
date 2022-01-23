package io.erp.modules.erp.dao;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.erp.modules.erp.entity.ErpGoodsEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 
 * 
 * @author Bin
 * @email eeason120@gmail.com
 * @date 2022-01-18 10:15:01
 */
@Mapper
public interface ErpGoodsDao extends BaseMapper<ErpGoodsEntity> {
    IPage<ErpGoodsEntity> queryPage(IPage<ErpGoodsEntity> page, String title,String code,Integer shopid,Integer typeid);

    Integer queryCountByshopTypeId(Integer shopId,Integer typeId);

    void deleteGoodsByShopId(@Param("id") Integer id);

}
