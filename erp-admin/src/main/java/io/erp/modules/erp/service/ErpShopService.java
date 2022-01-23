package io.erp.modules.erp.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.erp.common.utils.PageUtils;
import io.erp.modules.erp.entity.ErpShopEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 *
 * @author Bin
 * @email eeason120@gmail.com
 * @date 2022-01-18 10:15:01
 */
public interface ErpShopService extends IService<ErpShopEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void saveShop(ErpShopEntity erpShopEntity);

    void updateShop(ErpShopEntity erpShopEntity);

    void deleteShop(Integer[] ids);

    String queryShopTypeId(Integer shopId);

    List<ErpShopEntity> queryAll();
}

