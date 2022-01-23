package io.erp.modules.erp.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.erp.common.utils.PageUtils;
import io.erp.modules.erp.entity.ErpGoodsEntity;

import java.util.Map;

/**
 * 
 *
 * @author Bin
 * @email eeason120@gmail.com
 * @date 2022-01-18 10:15:01
 */
public interface ErpGoodsService extends IService<ErpGoodsEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void saveGoods(ErpGoodsEntity erpGoodsEntity);
    void updateGoods(ErpGoodsEntity erpGoodsEntity);
    void deleteGoods(Integer[] ids);
    void deleteGoodsByShopId(Integer id);

    Integer queryCountByshopTypeId(Integer shopId,Integer typeId);
}

