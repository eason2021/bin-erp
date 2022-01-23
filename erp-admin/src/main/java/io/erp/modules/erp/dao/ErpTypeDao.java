package io.erp.modules.erp.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.erp.modules.erp.entity.ErpTypeEntity;
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
public interface ErpTypeDao extends BaseMapper<ErpTypeEntity> {
    IPage<ErpTypeEntity> queryPage(IPage<ErpTypeEntity> page, String name,String code);

    List<ErpTypeEntity> queryList();

    List<ErpTypeEntity> queryListByShopId(@Param("shopId") Integer shopId);
}
