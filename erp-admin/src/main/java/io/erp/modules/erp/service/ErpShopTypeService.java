package io.erp.modules.erp.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.erp.common.utils.PageUtils;
import io.erp.modules.erp.entity.ErpShopTypeEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 *
 * @author Bin
 * @email eeason120@gmail.com
 * @date 2022-01-18 10:15:01
 */
public interface ErpShopTypeService extends IService<ErpShopTypeEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<Integer> queryTypeIds(Integer shopId);

    void deleteTypeIds(Integer shopId);
}

