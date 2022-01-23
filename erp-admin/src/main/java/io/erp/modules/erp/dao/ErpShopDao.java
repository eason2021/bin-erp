package io.erp.modules.erp.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.erp.modules.erp.entity.ErpShopEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 
 * 
 * @author Bin
 * @email eeason120@gmail.com
 * @date 2022-01-18 10:15:01
 */
@Mapper
public interface ErpShopDao extends BaseMapper<ErpShopEntity> {
    IPage<ErpShopEntity> queryPage(IPage<ErpShopEntity> page, String title,String code);

    List<ErpShopEntity> queryAll();
}
