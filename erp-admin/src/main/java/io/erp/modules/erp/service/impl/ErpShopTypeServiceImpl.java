package io.erp.modules.erp.service.impl;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.erp.common.utils.PageUtils;
import io.erp.common.utils.Query;

import io.erp.modules.erp.dao.ErpShopTypeDao;
import io.erp.modules.erp.entity.ErpShopTypeEntity;
import io.erp.modules.erp.service.ErpShopTypeService;


@Service("erpShopTypeService")
public class ErpShopTypeServiceImpl extends ServiceImpl<ErpShopTypeDao, ErpShopTypeEntity> implements ErpShopTypeService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ErpShopTypeEntity> page = this.page(
                new Query<ErpShopTypeEntity>().getPage(params),
                new QueryWrapper<ErpShopTypeEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public List<Integer> queryTypeIds(Integer shopId) {
        return baseMapper.queryTypeIds(shopId);
    }

    @Override
    public void deleteTypeIds(Integer shopId) {
        baseMapper.deleteTypeIds(shopId);
    }

}
