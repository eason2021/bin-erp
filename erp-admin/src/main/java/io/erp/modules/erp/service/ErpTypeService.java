package io.erp.modules.erp.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.erp.common.utils.PageUtils;
import io.erp.modules.erp.entity.ErpTypeEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 *
 * @author Bin
 * @email eeason120@gmail.com
 * @date 2022-01-18 10:15:01
 */
public interface ErpTypeService extends IService<ErpTypeEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<ErpTypeEntity> queryList();

    List<ErpTypeEntity> queryListByShopId(Integer shopId);
}

